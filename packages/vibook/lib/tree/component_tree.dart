import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibook/provider/component_tree.dart';
import 'package:vibook/provider/selected.dart';
import 'package:vibook/tree/component_tree_node.dart';
import 'package:vibook/tree/component_tree_x.dart';
import 'package:vibook/vibook.dart';
import 'package:vibook/widgets/search_bar.dart';

class ComponentTree extends ConsumerStatefulWidget {
  final String? id;
  final Duration animationDuration;

  const ComponentTree({
    super.key,
    this.id,
    this.animationDuration = const Duration(milliseconds: 80),
  });

  @override
  ConsumerState<ComponentTree> createState() => _ComponentTreeState();
}

class _ComponentTreeState extends ConsumerState<ComponentTree>
    with SingleTickerProviderStateMixin {
  late final controller = AnimationController(vsync: this, value: 1);

  void toggle(WidgetRef ref) {
    final node = ref.read(treeNodeProvider(widget.id));
    if (node == null) return;

    controller.duration = Duration(
      milliseconds:
          (widget.animationDuration.inMilliseconds * sqrt(node.children.length))
              .round(),
    );

    if (node.data.isExpanded) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  void initState() {
    final node = ref.read(treeNodeProvider(widget.id));
    if (node != null) {
      controller.value = node.data.isExpanded ? 1 : 0;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final node = ref.watch(treeNodeProvider(widget.id));

        ref.listen(
          componentTreeNotifierProvider,
          (previous, next) => toggle(ref),
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.id == null) //
              const Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  top: 16.0,
                  right: 16.0,
                  bottom: 8.0,
                ),
                child: ViSearchBar(),
              ),
            if (widget.id == null)
              Flexible(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (node == null) {
                      return const Center(
                        child: Text("Nothing found"),
                      );
                    }

                    final parent = buildNode(ref, node);
                    final children = generateChildrenNodesWidget(node.children);

                    return InteractiveViewer(
                      constrained: false,
                      scaleEnabled: false,
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.sizeOf(context).height / 3,
                        ),
                        child: ConstrainedBox(
                          constraints: constraints.copyWith(
                            maxWidth: constraints.maxWidth +
                                node.root.data.depth * 16,
                            maxHeight: double.infinity,
                          ),
                          child: Column(
                            children: [
                              if (parent case Widget node) //
                                node,
                              if (node.children.isNotEmpty) //
                                buildChildrenNodes(node, children),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            else
              Builder(
                builder: (context) {
                  if (node == null) {
                    return const Center(
                      child: Text("Nothing found"),
                    );
                  }

                  final parent = buildNode(ref, node);
                  final children = generateChildrenNodesWidget(node.children);

                  if (node.children.isNotEmpty && children.isEmpty) {
                    return const SizedBox();
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (parent case Widget node) //
                        node,
                      if (node.children.isNotEmpty) //
                        buildChildrenNodes(node, children),
                    ],
                  );
                },
              ),
          ],
        );
      },
    );
  }

  Widget? buildNode(WidgetRef ref, Tree node) {
    if (!node.data.isShowedInSearching) {
      return null;
    }

    final leading = node.data.data.buildLeading(context, ref);
    final title = node.data.data.buildTitle(context, ref);

    return ElementTile(
      icon: leading,
      title: title,
      depth: node.data.data.level,
      selected: ref.watch(selectedElementNotifierProvider) == node.data.id,
      onPressed: () {
        if (node.isLeaf) {
          ref
              .read(selectedElementNotifierProvider.notifier)
              .select(node.data.id);
        } else {
          ref.read(componentTreeNotifierProvider.notifier).toggle(node);
        }
      },
      size: switch (node.data) {
        ModuleNode data => switch (data.level) {
            1 => ElementTileSize.large,
            _ => switch (data.index) {
                0 => ElementTileSize.small,
                _ => ElementTileSize.medium,
              }
          },
        _ => ElementTileSize.small,
      },
    );
  }

  Widget buildChildrenNodes(Tree node, List<Widget> items) {
    return ClipRect(
      child: SizeTransition(
        axisAlignment: 1,
        sizeFactor: CurvedAnimation(parent: controller, curve: Curves.easeOut),
        child: Column(
          children: items,
        ),
      ),
    );
  }

  List<Widget> generateChildrenNodesWidget(
    List<Tree> list,
  ) {
    final items = [
      for (final child in list) //
        child,
    ];

    return List.generate(
      items.length,
      (index) => ComponentTree(
        id: items[index].data.id,
      ),
    );
  }
}
