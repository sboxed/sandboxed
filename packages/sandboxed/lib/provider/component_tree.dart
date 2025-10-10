import 'package:recursive_tree_flutter/recursive_tree_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sandboxed/provider/tags.dart';
import 'package:sandboxed/tree/component_tree_node.dart';
import 'package:sandboxed/tree/component_tree_parser.dart';
import 'package:sandboxed/sandboxed.dart';

part 'component_tree.g.dart';

@Riverpod(dependencies: [])
List<SandboxedElement> components(Ref ref) {
  return [];
}

@Riverpod(
  keepAlive: true,
  name: 'componentTreeNotifierProvider',
  dependencies: [components],
)
class ComponentTreeNotifier extends _$ComponentTreeNotifier {
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

@Riverpod(dependencies: [ComponentTreeNotifier])
class Node extends _$Node {
  @override
  Tree? build(String? id) {
    final tree = ref.watch(componentTreeNotifierProvider);
    if (id == null) return tree;

    return findTreeWithId(tree, id);
  }

  @override
  bool updateShouldNotify(Tree? previous, Tree? next) {
    return true;
  }
}

@Riverpod(dependencies: [filteredTree])
class TreeNode extends _$TreeNode {
  @override
  Tree? build(String? id) {
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

@Riverpod(keepAlive: true)
class SearchQuery extends _$SearchQuery {
  @override
  String build() {
    return '';
  }

  void update(String value) {
    state = value;
    ref.notifyListeners();
  }
}

@Riverpod(dependencies: [ComponentTreeNotifier])
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

@Riverpod(dependencies: [ComponentTreeNotifier])
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

@Riverpod(dependencies: [tree2, ComponentTreeNotifier])
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

@Riverpod(dependencies: [tree2])
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
