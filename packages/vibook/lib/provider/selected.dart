import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vibook/provider/component_tree.dart';
import 'package:vibook/tree/component_tree_node.dart';
import 'package:vibook_core/component.dart';
import 'package:vibook_core/document_entry.dart';
import 'package:vibook_core/story.dart';

part 'selected.g.dart';

sealed class Selection {
  Component get component;

  const Selection();
}

final class DocumentSelection extends Selection with EquatableMixin {
  @override
  final Component component;
  final DocumentEntry document;

  const DocumentSelection(this.component, this.document);

  @override
  List<Object?> get props => [component, document];
}

final class StorySelection extends Selection with EquatableMixin {
  @override
  final Component component;
  final Story story;

  const StorySelection(this.component, this.story);

  @override
  List<Object?> get props => [component, story];
}

@riverpod
class SelectedElementNotifier extends _$SelectedElementNotifier {
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
Selection? selection(Ref ref, String id) {
  final node = ref.watch(nodeProvider(id));
  if (node == null) return null;

  switch (node.data) {
    case ComponentTreeNode data:
      return StorySelection(
        data.component,
        data.component.stories.first,
      );

    case StoryTreeNode data:
      return StorySelection(
        data.component,
        data.story,
      );

    case DocumentationTreeNode data:
      return DocumentSelection(
        data.component,
        data.entry,
      );

    default:
      return null;
  }
}

@riverpod
Selection? selectedElement(Ref ref) {
  final selected = ref.watch(selectedElementNotifierProvider);
  if (selected == null) return null;

  return ref.watch(selectionProvider(selected));
}
