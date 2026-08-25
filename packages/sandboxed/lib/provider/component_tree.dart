import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recursive_tree_flutter/recursive_tree_flutter.dart';
import 'package:sandboxed/provider/tags.dart';
import 'package:sandboxed/tree/component_tree_node.dart';
import 'package:sandboxed/tree/component_tree_parser.dart';
import 'package:sandboxed/sandboxed.dart';

List<SandboxedElement> components(Ref ref) {
  return [];
}

final componentsProvider = Provider.autoDispose<List<SandboxedElement>>(
  components,
  dependencies: const [],
);

final componentTreeNotifierProvider =
    NotifierProvider<ComponentTreeNotifier, TreeType<NodeData>>(
  ComponentTreeNotifier.new,
  dependencies: [componentsProvider],
);

final nodeProvider = NotifierProvider.family<Node, Tree?, String?>(
  Node.new,
  dependencies: [componentTreeNotifierProvider],
  isAutoDispose: true,
);

final treeNodeProvider = NotifierProvider.family<TreeNode, Tree?, String?>(
  TreeNode.new,
  dependencies: [filteredTreeProvider],
  isAutoDispose: true,
);

final searchQueryProvider = NotifierProvider<SearchQuery, String>(
  SearchQuery.new,
);

final filteredTreeProvider = Provider.autoDispose<Tree?>(
  filteredTree,
  dependencies: [componentTreeNotifierProvider],
);

final tree2Provider = Provider.autoDispose<List<TreeViewNode<ElementNode>>>(
  tree2,
  dependencies: [componentTreeNotifierProvider],
);

final filteredTree2Provider =
    Provider.autoDispose<List<TreeViewNode<ElementNode>>>(
  filteredTree2,
  dependencies: [tree2Provider, componentTreeNotifierProvider],
);

final largestNodeProvider = Provider.autoDispose<TreeViewNode<ElementNode>>(
  largestNode,
  dependencies: [tree2Provider],
);

class ComponentTreeNotifier extends Notifier<TreeType<NodeData>> {
  @override
  TreeType<NodeData> build() {
    final components = ref.watch(componentsProvider);
    return parse(components);
  }

  Future<void> toggle(TreeType<NodeData> node) async {
    if (!node.isLeaf) {
      node.data.isExpanded = !node.data.isExpanded;
      state = state;
      ref.notifyListeners();
    }
  }

  @override
  bool updateShouldNotify(
    Tree previous,
    Tree next,
  ) {
    return true;
  }
}

class Node extends Notifier<Tree?> {
  Node(this.id);

  final String? id;

  @override
  Tree? build() {
    final tree = ref.watch(componentTreeNotifierProvider);
    if (id == null) return tree;

    return findTreeWithId(tree, id);
  }

  @override
  bool updateShouldNotify(Tree? previous, Tree? next) {
    return true;
  }
}

class TreeNode extends Notifier<Tree?> {
  TreeNode(this.id);

  final String? id;

  @override
  Tree? build() {
    final tree = ref.watch(filteredTreeProvider);
    if (id == null) return tree;
    if (tree == null) return tree;

    return findTreeWithId(tree, id);
  }

  @override
  bool updateShouldNotify(Tree? previous, Tree? next) {
    return true;
  }
}

class SearchQuery extends Notifier<String> {
  @override
  String build() {
    return '';
  }

  void update(String value) {
    state = value;
    ref.notifyListeners();
  }
}

Tree? filteredTree(Ref ref) {
  final tree = ref.watch(componentTreeNotifierProvider);
  final query = ref.watch(searchQueryProvider);
  final selectedTags = ref.watch(tagFilterProvider);

  if (query.isEmpty && selectedTags.isEmpty) return tree;

  return filterTree(
    tree,
    (node) {
      bool condition = true;
      if (selectedTags.isNotEmpty) {
        switch (node.data.data) {
          case StoryNode(story: Story(:final tags)):
          case ComponentNode(component: Component(meta: Meta(:final tags))):
            condition = tags.isNotEmpty &&
                tags.toSet().intersection(selectedTags).isNotEmpty;

          default:
            condition = true;
        }
      }

      if (query.trim().isNotEmpty) {
        condition &= node.data.title //
            .toLowerCase()
            .contains(query.toLowerCase());
      }

      return condition;
    },
  );
}

Tree? filterTree(Tree tree, bool Function(Tree node) predicate) {
  if (tree.data.data is StoryNode) {
    if (predicate(tree)) {
      return tree;
    } else {
      return null;
    }
  }

  final children = [
    for (final node in tree.children) //
      if (filterTree(node, predicate) case Tree node) //
        node
  ];

  if (children.isEmpty) {
    if (tree.data.data is ComponentNode) {
      if (predicate(tree)) {
        return tree;
      }
    }

    return null;
  }

  return TreeType(
    data: tree.data,
    children: children,
    parent: tree.parent,
  );
}

List<TreeViewNode<ElementNode>> tree2(Ref ref) {
  final node = ref.watch(componentTreeNotifierProvider);
  List<TreeViewNode<ElementNode>> getNodes(List<Tree> tree) {
    return [
      for (final node in tree)
        TreeViewNode(
          node.data.data,
          children: getNodes(node.children),
          expanded: node.data.isExpanded,
        ),
    ];
  }

  return getNodes(node.children);
}

List<TreeViewNode<ElementNode>> filteredTree2(Ref ref) {
  final tree = ref.watch(tree2Provider);
  final originalTree = ref.watch(componentTreeNotifierProvider);
  final query = ref.watch(searchQueryProvider);
  final selectedTags = ref.watch(tagFilterProvider);

  if (query.isEmpty && selectedTags.isEmpty) return tree;

  final root = filterTree(
    originalTree,
    (node) {
      bool condition = true;
      if (selectedTags.isNotEmpty) {
        switch (node.data.data) {
          case StoryNode(story: Story(:final tags)):
          case ComponentNode(component: Component(meta: Meta(:final tags))):
            condition = tags.isNotEmpty &&
                tags.toSet().intersection(selectedTags).isNotEmpty;

          default:
            condition = true;
        }
      }

      if (query.trim().isNotEmpty) {
        condition &= node.data.title //
            .toLowerCase()
            .contains(query.toLowerCase());
      }

      return condition;
    },
  );

  List<TreeViewNode<ElementNode>> getNodes(List<Tree> tree) {
    return [
      for (final node in tree)
        TreeViewNode(
          node.data.data,
          children: getNodes(node.children),
          expanded: node.data.isExpanded,
        ),
    ];
  }

  return getNodes(root?.children ?? []);
}

TreeViewNode<ElementNode> largestNode(Ref ref) {
  final tree = ref.watch(tree2Provider);

  double maxWeight = 0;
  TreeViewNode<ElementNode> maxNode = tree.first;
  for (final node in flatten(tree)) {
    var weight = (node.depth ?? 0) * 16 +
        node.content.title.length +
        switch (node.content) {
          ComponentNode component => component.component.meta.tags
              .fold(0, (acc, tag) => acc + tag.length),
          StoryNode story =>
            story.story.tags.fold(0, (acc, tag) => acc + tag.length),
          _ => 0
        };

    if (weight > maxWeight) {
      maxNode = node;
      maxWeight = weight.toDouble();
    }
  }

  return maxNode;
}

Iterable<TreeViewNode<ElementNode>> flatten(
    List<TreeViewNode<ElementNode>> roots) sync* {
  for (final root in roots) {
    yield root;
    yield* flatten(root.children);
  }
}
