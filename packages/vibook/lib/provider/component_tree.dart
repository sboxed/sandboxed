import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recursive_tree_flutter/recursive_tree_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vibook/tree/component_tree_node.dart';
import 'package:vibook/tree/component_tree_parser.dart';
import 'package:vibook_core/component.dart';

part 'component_tree.g.dart';

@riverpod
List<ViElement> components(Ref ref) {
  return [];
}

@Riverpod(keepAlive: true, dependencies: [components])
class ComponentTreeNotifier extends _$ComponentTreeNotifier {
  @override
  TreeType<AbstractComponentTreeNode> build() {
    final components = ref.watch(componentsProvider);
    return parse(components);
  }

  Future<void> toggle(TreeType<AbstractComponentTreeNode> node) async {
    if (!node.isLeaf) {
      node.data.isExpanded = !node.data.isExpanded;
      state = state;
      ref.notifyListeners();
    }
  }

  @override
  bool updateShouldNotify(
    TreeType<AbstractComponentTreeNode> previous,
    TreeType<AbstractComponentTreeNode> next,
  ) {
    return true;
  }
}

@riverpod
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
