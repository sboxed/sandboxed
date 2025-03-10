import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recursive_tree_flutter/recursive_tree_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vibook/tree/component_tree_node.dart';
import 'package:vibook/tree/component_tree_node_2.dart';
import 'package:vibook/tree/component_tree_parser.dart';
import 'package:vibook_core/component.dart';

part 'component_tree.g.dart';

@Riverpod(dependencies: [])
List<ViElement> components(Ref ref) {
  return [];
}

@Riverpod(keepAlive: true, dependencies: [components])
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

  if (query.isEmpty) return tree;

  return filterTree(
    tree,
    (node) => node.data.title.toLowerCase().contains(query.toLowerCase()),
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
