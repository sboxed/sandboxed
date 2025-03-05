import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';
import 'package:recursive_tree_flutter/recursive_tree_flutter.dart';
import 'package:vibook/widgets/vi_icon.dart';
import 'package:vibook_core/component.dart';
import 'package:vibook_core/document_entry.dart';
import 'package:vibook_core/story.dart';

typedef Tree = TreeType<AbstractComponentTreeNode>;

sealed class AbstractComponentTreeNode extends AbsNodeType {
  int get level;
  int get index;

  AbstractComponentTreeNode({
    required super.id,
    required super.title,
  });

  Widget? buildLeading(BuildContext context);

  Widget buildTitle(BuildContext context);
}

final class RootTreeNode extends AbstractComponentTreeNode {
  RootTreeNode({required super.id, required super.title});

  @override
  int get level => 0;

  @override
  int get index => 0;

  int depth = 0;

  @override
  bool get isShowedInSearching => false;

  @override
  bool get isExpanded => true;

  @override
  T clone<T extends AbsNodeType>() {
    // TODO: implement clone
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return const SizedBox.shrink();
  }

  @override
  Widget buildTitle(BuildContext context) {
    return const SizedBox.shrink();
  }
}

final class ModuleTreeNode extends AbstractComponentTreeNode {
  @override
  final int level;

  @override
  final int index;

  ModuleTreeNode({
    required super.id,
    required super.title,
    required this.level,
    required this.index,
  });

  @override
  T clone<T extends AbsNodeType>() {
    // TODO: implement clone
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const ViIcon(Mdi.cube);
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Text(title);
  }
}

final class FolderTreeNode extends AbstractComponentTreeNode {
  @override
  final int level;

  @override
  final int index;

  FolderTreeNode({
    required super.id,
    required super.title,
    required this.level,
    required this.index,
  });

  @override
  T clone<T extends AbsNodeType>() {
    // TODO: implement clone
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return ViIcon(isExpanded ? Mdi.folder_open : Mdi.folder);
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Text(title);
  }
}

final class ComponentTreeNode extends AbstractComponentTreeNode {
  @override
  final int level;
  final Component component;

  @override
  final int index;

  final bool _isInner;

  ComponentTreeNode({
    required super.id,
    required super.title,
    required this.level,
    required this.index,
    required this.component,
    bool isLeaf = false,
  }) : _isInner = !isLeaf;

  @override
  bool get isExpanded => true;

  @override
  bool get isInner => _isInner;

  @override
  T clone<T extends AbsNodeType>() {
    // TODO: implement clone
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return const ViIcon(Mdi.rhombus_split);
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Text(title);
  }
}

final class DocumentationTreeNode extends AbstractComponentTreeNode {
  @override
  final int level;

  @override
  final int index;

  final Component component;
  final DocumentEntry entry;

  DocumentationTreeNode(
      {required super.id,
      required super.title,
      required this.level,
      required this.index,
      required this.component,
      required this.entry});

  @override
  bool get isInner => false;

  @override
  T clone<T extends AbsNodeType>() {
    // TODO: implement clone
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return const ViIcon(Mdi.file_certificate);
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Text(title);
  }
}

final class StoryTreeNode extends AbstractComponentTreeNode {
  @override
  final int level;

  @override
  final int index;

  final Component component;
  final Story story;

  StoryTreeNode({
    required super.id,
    required super.title,
    required this.level,
    required this.index,
    required this.component,
    required this.story,
  });

  @override
  bool get isInner => false;

  @override
  T clone<T extends AbsNodeType>() {
    // TODO: implement clone
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return const ViIcon(Mdi.rhombus);
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Text(title);
  }
}
