import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recursive_tree_flutter/recursive_tree_flutter.dart';
import 'package:vibook/addons/mixins/editor_addon.dart';
import 'package:vibook/provider/addons.dart';
import 'package:vibook/vibook.dart';

part 'component_tree_node.freezed.dart';

typedef Tree = TreeType<NodeData>;

// ignore: must_be_immutable
class NodeData with EquatableMixin implements AbsNodeType {
  ElementNode data;

  NodeData(this.data);

  @override
  dynamic get id => data.id;

  @override
  set id(dynamic value) => data = data.copyWith(id: value);

  @override
  String get title => data.title;

  @override
  set title(String value) {
    data = data.copyWith(title: title);
  }

  int get depth => data.level;

  set depth(int value) {
    data = data.copyWith(level: value);
  }

  @override
  bool get isExpanded => data.isExpanded;

  @override
  set isExpanded(bool value) => data = data.copyWith(isExpanded: value);

  @override
  bool get isInner {
    return switch (data) {
      ComponentNode node => node.component.stories.length > 1,
      StoryNode _ => false,
      DocumentationNode _ => false,
      _ => true,
    };
  }

  bool get isLeaf => !isInner;

// #region Unused
  @override
  set isInner(bool value) {}

  @override
  bool get isBlurred => false;

  @override
  set isBlurred(bool value) {}

  @override
  bool? get isChosen => false;

  @override
  set isChosen(bool? value) {}

  @override
  bool get isFavorite => false;

  @override
  set isFavorite(bool value) {}

  @override
  bool get isShowedInSearching => data is! RootNode;

  @override
  set isShowedInSearching(bool value) {}

  @override
  bool get isUnavailable => false;

  @override
  set isUnavailable(bool value) {}
// #endregion

  @override
  T clone<T extends AbsNodeType>() {
    return NodeData(data.copyWith()) as T;
  }

  @override
  List<Object?> get props => [data];
}

@freezed
sealed class ElementNode with _$ElementNode {
  const ElementNode._();

  const factory ElementNode.root({
    required int level,
    required int index,
    required String id,
    required String title,
    required bool isExpanded,
  }) = RootNode;

  const factory ElementNode.module({
    required int level,
    required int index,
    required String id,
    required String title,
    required bool isExpanded,
  }) = ModuleNode;

  const factory ElementNode.folder({
    required int level,
    required int index,
    required String id,
    required String title,
    required bool isExpanded,
  }) = FolderNode;

  const factory ElementNode.component({
    required int level,
    required int index,
    required String id,
    required String title,
    @Default(true) bool isExpanded,
    required Component component,
  }) = ComponentNode;

  const factory ElementNode.documentation({
    required int level,
    required int index,
    required String id,
    required String title,
    @Default(false) bool isExpanded,
    required Component component,
    required DocumentEntry document,
  }) = DocumentationNode;

  const factory ElementNode.story({
    required int level,
    required int index,
    required String id,
    required String title,
    @Default(false) bool isExpanded,
    required Component component,
    required Story story,
  }) = StoryNode;

  Widget buildLeading(BuildContext context, WidgetRef ref) {
    switch (this) {
      case ModuleNode():
        return Tooltip(
          message: 'Module',
          waitDuration: const Duration(milliseconds: 240),
          child: ElementTileIcons.module.icon,
        );

      case FolderNode():
        return (isExpanded
                ? ElementTileIcons.folderOpen
                : ElementTileIcons.folder)
            .icon;

      case ComponentNode(:final component):
        Widget icon = Tooltip(
          message: [
            'Component',
            if (!kReleaseMode && component.meta.warnings.isNotEmpty)
              ...component.meta.warnings.map((e) => '• $e'),
          ].join('\n'),
          waitDuration: const Duration(milliseconds: 240),
          child: !kReleaseMode && component.meta.warnings.isNotEmpty
              ? ElementTileIcons.warning.icon
              : ElementTileIcons.component.icon,
        );

        for (final addon
            in ref.watch(addonsProvider).whereType<EditorAddon>()) {
          icon = addon.visitComponentIcon(context, component, icon) ?? icon;
        }

        return icon;

      case DocumentationNode():
        return Tooltip(
          message: 'Documentation Entry',
          waitDuration: const Duration(milliseconds: 240),
          child: ElementTileIcons.document.icon,
        );

      case StoryNode(:final component, :final story):
        Widget icon = Tooltip(
          message: 'Component Story or Scenario',
          waitDuration: const Duration(milliseconds: 240),
          child: ElementTileIcons.story.icon,
        );

        for (final addon
            in ref.watch(addonsProvider).whereType<EditorAddon>()) {
          icon = addon.visitStoryIcon(context, component, story, icon) ?? icon;
        }

        return icon;

      default:
        return const SizedBox.shrink();
    }
  }

  Widget buildTitle(BuildContext context, WidgetRef ref) {
    switch (this) {
      case ComponentNode(:final component):
        Widget titleWidget = Text(title);

        for (final addon
            in ref.watch(addonsProvider).whereType<EditorAddon>()) {
          titleWidget =
              addon.visitComponentTitle(context, component, titleWidget) ?? //
                  titleWidget;
        }

        return titleWidget;

      case StoryNode(:final component, :final story):
        Widget titleWidget = Text(title);

        for (final addon
            in ref.watch(addonsProvider).whereType<EditorAddon>()) {
          titleWidget = addon.visitStoryTitle(
                  context, component, story, titleWidget) ?? //
              titleWidget;
        }

        return titleWidget;

      default:
        return Text(title);
    }
  }
}
