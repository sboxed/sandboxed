import 'dart:math';

import 'package:recursive_tree_flutter/recursive_tree_flutter.dart';
import 'package:vibook/tree/component_tree_node.dart';
import 'package:vibook_core/component.dart';

TreeType<AbstractComponentTreeNode> parse(List<ViElement> components) {
  var root = TreeType<AbstractComponentTreeNode>(
    children: [],
    parent: null,
    data: RootTreeNode(id: 'root', title: 'VIBOOK'),
  );

  var nodes = <String, Tree>{};

  for (final component in components) {
    if (component is! Component) continue;
    switch (component) {
      case Component component:
        final parts = [
          ...?component.meta.module?.split('/').map((e) => '[${e.trim()}]'),
          ...component.meta.name.split('/'),
        ];

        TreeType<AbstractComponentTreeNode> parent = root;
        (root.data as RootTreeNode).depth =
            max((root.data as RootTreeNode).depth, parts.length);

        for (final (index, part) in parts.indexed) {
          final key = parts.take(index + 1).join('/');
          final wasProcessed = nodes.containsKey(key);
          var node = nodes.putIfAbsent(
            key,
            () {
              final id = [key, part.trim()].join('/');
              final level = index + 1;
              final childIndex = parent.children.length;

              if (part.startsWith('[') && part.endsWith(']')) {
                return TreeType<AbstractComponentTreeNode>(
                  data: ModuleTreeNode(
                    id: id,
                    title: part.replaceAll(RegExp(r'(^\[|\]$)'), '').trim(),
                    level: level,
                    index: childIndex,
                  ),
                  children: [],
                  parent: parent,
                );
              }

              return TreeType<AbstractComponentTreeNode>(
                // key: part.trim(), data: part == parts.last ? component : null);
                data: part == parts.last
                    ? ComponentTreeNode(
                        id: id,
                        title: part.trim(),
                        level: level,
                        index: childIndex,
                        isLeaf: component.stories.length == 1,
                        component: component,
                      )
                    : FolderTreeNode(
                        id: id,
                        title: part.trim(),
                        level: level,
                        index: childIndex,
                      ),
                children: [],
                parent: parent,
              );
            },
          );

          if (!wasProcessed) {
            parent.children.add(node);
          }

          parent = node;
        }

        // Skip building stories for single story components.
        if (component.stories.length <= 1 &&
            component.meta.documentation.isEmpty == true) {
          continue;
        }

        for (final document in component.meta.documentation) {
          final name = document.name;
          var node = TreeType<AbstractComponentTreeNode>(
            // key: part.trim(), data: part == parts.last ? component : null);
            data: DocumentationTreeNode(
              id: [...parts, name.trim()].join('/'),
              component: component,
              title: name,
              level: parts.length + 1,
              index: parent.children.length,
              entry: document,
            ),
            children: [],
            parent: parent,
          );
          // var node = TreeNode(key: name, data: (component, story()));
          parent.children.add(node);
        }

        for (final (index, story) in component.stories.indexed) {
          final name = story.name ?? 'Story $index';
          var node = TreeType<AbstractComponentTreeNode>(
            // key: part.trim(), data: part == parts.last ? component : null);
            data: StoryTreeNode(
              id: [...parts, name.trim()].join('/'),
              component: component,
              story: story,
              title: name,
              level: parts.length + 1,
              index: parent.children.length,
            ),
            children: [],
            parent: parent,
          );
          // var node = TreeNode(key: name, data: (component, story()));
          parent.children.add(node);
        }
    }
  }

  return root;
}
