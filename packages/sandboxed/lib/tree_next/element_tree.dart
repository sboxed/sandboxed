import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandboxed/provider/component_tree.dart';
import 'package:sandboxed/provider/selected.dart';
import 'package:sandboxed/sandboxed.dart';
import 'package:sandboxed/tree/component_tree_node.dart';
import 'package:sandboxed/widgets/search_bar.dart';

class ElementTree extends ConsumerStatefulWidget {
  const ElementTree({super.key});

  @override
  ConsumerState<ElementTree> createState() => _ElementTreeState();
}

class _ElementTreeState extends ConsumerState<ElementTree>
    with SingleTickerProviderStateMixin {
  late final controller = AnimationController(vsync: this, value: 1);
  final treeController = TreeViewController();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final tree = ref.watch(filteredTree2Provider);
        final largest = ref.watch(largestNodeProvider);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 16,
                top: 16.0,
                right: 16.0,
                bottom: 8.0,
              ),
              child: SBSearchBar(),
            ),
            Flexible(
              child: SBTreeView<ElementNode>(
                tree: tree,
                controller: treeController,
                prototype: largest,
                spanBuilder: (TreeViewNode<ElementNode> node) {
                  return Span(
                      extent: FixedSpanExtent(
                    switch (node.content) {
                      ModuleNode data => switch (data.level) {
                          1 => 80,
                          _ => switch (data.index) {
                              0 => 48,
                              _ => 64,
                            }
                        },
                      _ => 48,
                    },
                  ));
                },
                nodeBuilder: (node) {
                  ref.watch(componentTreeNotifierProvider);
                  final leading = node.content.buildLeading(context, ref);
                  final title = node.content.buildTitle(context, ref);

                  return SizedBox(
                    height: switch (node.content) {
                      ModuleNode data => switch (data.level) {
                          1 => 80,
                          _ => switch (data.index) {
                              0 => 48,
                              _ => 64,
                            }
                        },
                      _ => 48,
                    },
                    child: ElementTile(
                      icon: leading,
                      title: title,
                      depth: node.content.level,
                      selected: ref.watch(selectedElementNotifierProvider) ==
                          node.content.id,
                      onPressed: () {
                        final isLeaf = node.content is StoryNode ||
                            node.content is DocumentationNode ||
                            (node.content is ComponentNode &&
                                [
                                      ...(node.content as ComponentNode)
                                          .component
                                          .stories,
                                      ...(node.content as ComponentNode)
                                          .component
                                          .meta
                                          .documentation
                                    ].length <=
                                    1);
                        if (isLeaf) {
                          ref
                              .read(selectedElementNotifierProvider.notifier)
                              .select(node.content.id);
                        } else {
                          treeController.toggleNode(node);
                        }
                      },
                      size: switch (node.content) {
                        ModuleNode data => switch (data.level) {
                            1 => ElementTileSize.large,
                            _ => switch (data.index) {
                                0 => ElementTileSize.small,
                                _ => ElementTileSize.medium,
                              }
                          },
                        _ => ElementTileSize.small,
                      },
                    ),
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
