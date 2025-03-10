import 'dart:math';

import 'package:collection/collection.dart';
import 'package:vibook/tree/component_tree_node.dart';
import 'package:vibook_core/component.dart';

Tree parse(List<ViElement> components) {
  var root = Tree(
    children: [],
    parent: null,
    data: NodeData(
      const RootNode(
        id: 'root',
        title: 'VIBOOK',
        level: 0,
        index: 0,
        isExpanded: true,
      ),
    ),
  );

  var nodes = <String, Tree>{};

  for (final component in components) {
    if (component is! Component) continue;
    switch (component) {
      case Component component:
        final parts = [
          ...?component.module?.split('/').map((e) => '[${e.trim()}]'),
          ...component.meta.name.split('/'),
        ];

        Tree parent = root;
        root.data.depth = max(root.data.depth, parts.length);

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
                return Tree(
                  data: NodeData(
                    ModuleNode(
                      id: id,
                      title: part.replaceAll(RegExp(r'(^\[|\]$)'), '').trim(),
                      level: level,
                      index: childIndex,
                      isExpanded: true,
                    ),
                  ),
                  children: [],
                  parent: parent,
                );
              }

              return Tree(
                data: NodeData(
                  part == parts.last
                      ? ComponentNode(
                          id: id,
                          title: part.trim(),
                          level: level,
                          index: childIndex,
                          component: component,
                          isExpanded: true,
                        )
                      : FolderNode(
                          id: id,
                          title: part.trim(),
                          level: level,
                          index: childIndex,
                          isExpanded: true,
                        ),
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
          var node = Tree(
            data: NodeData(
              DocumentationNode(
                id: [...parts, name.trim()].join('/'),
                component: component,
                title: name,
                level: parts.length + 1,
                index: parent.children.length,
                document: document,
              ),
            ),
            children: [],
            parent: parent,
          );

          parent.children.add(node);
        }

        for (final (index, story) in component.stories.indexed) {
          final name = story.name ?? 'Story $index';
          var node = Tree(
            data: NodeData(
              StoryNode(
                id: [...parts, name.trim()].join('/'),
                component: component,
                story: story,
                title: name,
                level: parts.length + 1,
                index: parent.children.length,
              ),
            ),
            children: [],
            parent: parent,
          );

          parent.children.add(node);
        }
    }
  }

  sort(root);

  return root;
}

void sort(Tree tree) {
  tree.children.sortBy((element) => element.data.title);
  tree.children.sortBy<num>(
    (element) => switch (element.data.data) {
      ModuleNode _ => 0,
      FolderNode _ => 10,
      DocumentationNode _ => 50,
      _ => 1000,
    },
  );

  for (final child in tree.children) {
    sort(child);
  }
}
