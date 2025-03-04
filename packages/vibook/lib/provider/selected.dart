import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vibook/provider/component_tree.dart';
import 'package:vibook/tree/component_tree_node.dart';
import 'package:vibook_core/component.dart';
import 'package:vibook_core/story.dart';

part 'selected.g.dart';

@riverpod
class SelectedStoryNotifier extends _$SelectedStoryNotifier {
  @override
  String? build() {
    return null;
  }

  void select(String id) {
    state = id;
    ref.notifyListeners();
  }
}

@riverpod
(Component, Story)? selectedStory(Ref ref) {
  final selected = ref.watch(selectedStoryNotifierProvider);
  if (selected == null) return null;

  final node = ref.watch(nodeProvider(selected));
  if (node == null) return null;

  switch (node.data) {
    case ComponentTreeNode data:
      return (data.component, data.component.stories.first());

    case StoryTreeNode data:
      return (data.component, data.story);

    default:
      return null;
  }
}
