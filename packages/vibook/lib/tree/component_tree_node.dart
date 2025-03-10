// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:recursive_tree_flutter/recursive_tree_flutter.dart';
// import 'package:vibook/addons/mixins/editor_addon.dart';
// import 'package:vibook/provider/addons.dart';
// import 'package:vibook/vibook.dart';

import 'package:recursive_tree_flutter/models/tree_type.dart';
import 'package:vibook/tree/component_tree_node_2.dart';

export 'package:vibook/tree/component_tree_node_2.dart';

typedef Tree = TreeType<NodeData>;

// sealed class AbstractComponentNode extends AbsNodeType {
//   int get level;
//   int get index;

//   AbstractComponentNode({
//     required super.id,
//     required super.title,
//   });

//   Widget? buildLeading(BuildContext context, WidgetRef ref);

//   Widget buildTitle(BuildContext context, WidgetRef ref);
// }

// final class RootNode extends AbstractComponentNode {
//   RootNode({required super.id, required super.title});

//   @override
//   int get level => 0;

//   @override
//   int get index => 0;

//   int depth = 0;

//   @override
//   bool get isShowedInSearching => false;

//   @override
//   bool get isExpanded => true;

//   @override
//   T clone<T extends AbsNodeType>() {
//     // TODO: implement clone
//     throw UnimplementedError();
//   }

//   @override
//   Widget buildLeading(BuildContext context, WidgetRef ref) {
//     return const SizedBox.shrink();
//   }

//   @override
//   Widget buildTitle(BuildContext context, WidgetRef ref) {
//     return const SizedBox.shrink();
//   }
// }

// final class ModuleNode extends AbstractComponentNode {
//   @override
//   final int level;

//   @override
//   final int index;

//   ModuleNode({
//     required super.id,
//     required super.title,
//     required this.level,
//     required this.index,
//   });



// final class FolderNode extends AbstractComponentNode {
//   @override
//   final int level;

//   @override
//   final int index;

//   FolderNode({
//     required super.id,
//     required super.title,
//     required this.level,
//     required this.index,
//   });

//   @override
//   T clone<T extends AbsNodeType>() {
//     // TODO: implement clone
//     throw UnimplementedError();
//   }


//   @override
//   Widget buildTitle(BuildContext context, WidgetRef ref) {
//     return Text(title);
//   }
// }

// final class ComponentNode extends AbstractComponentNode {
//   @override
//   final int level;
//   final Component component;

//   @override
//   final int index;

//   final bool _isInner;

//   ComponentNode({
//     required super.id,
//     required super.title,
//     required this.level,
//     required this.index,
//     required this.component,
//     bool isLeaf = false,
//   }) : _isInner = !isLeaf;

//   @override
//   bool get isExpanded => true;

//   @override
//   bool get isInner => _isInner;

//   @override
//   T clone<T extends AbsNodeType>() {
//     // TODO: implement clone
//     throw UnimplementedError();
//   }



//   @override
//   Widget buildTitle(BuildContext context, WidgetRef ref) {
//     Widget titleWidget = Text(title);

//     for (final addon in ref.watch(addonsProvider).whereType<EditorAddon>()) {
//       titleWidget =
//           addon.visitComponentTitle(context, component, titleWidget) ?? //
//               titleWidget;
//     }

//     return titleWidget;
//   }
// }

// final class DocumentationNode extends AbstractComponentNode {
//   @override
//   final int level;

//   @override
//   final int index;

//   final Component component;
//   final DocumentEntry entry;

//   DocumentationNode({
//     required super.id,
//     required super.title,
//     required this.level,
//     required this.index,
//     required this.component,
//     required this.entry,
//   });

//   @override
//   bool get isInner => false;

//   @override
//   T clone<T extends AbsNodeType>() {
//     // TODO: implement clone
//     throw UnimplementedError();
//   }



//   @override
//   Widget buildTitle(BuildContext context, WidgetRef ref) {
//     return Text(title);
//   }
// }

// final class StoryNode extends AbstractComponentNode {
//   @override
//   final int level;

//   @override
//   final int index;

//   final Component component;
//   final Story story;

//   StoryNode({
//     required super.id,
//     required super.title,
//     required this.level,
//     required this.index,
//     required this.component,
//     required this.story,
//   });

//   @override
//   bool get isInner => false;

//   @override
//   T clone<T extends AbsNodeType>() {
//     // TODO: implement clone
//     throw UnimplementedError();
//   }


//   @override
//   Widget buildTitle(BuildContext context, WidgetRef ref) {
//     Widget titleWidget = Text(title);

//     for (final addon in ref.watch(addonsProvider).whereType<EditorAddon>()) {
//       titleWidget =
//           addon.visitStoryTitle(context, component, story, titleWidget) ?? //
//               titleWidget;
//     }

//     return titleWidget;
//   }
// }
