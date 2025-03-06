import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recursive_tree_flutter/recursive_tree_flutter.dart';
import 'package:vibook/provider/component_tree.dart';
import 'package:vibook/provider/selected.dart';
import 'package:vibook/tree/component_tree_node.dart';
import 'package:vibook/tree/component_tree_x.dart';
import 'package:vibook/widgets/search_bar.dart';

class ComponentTree extends ConsumerStatefulWidget {
  final String? id;
  final Duration animationDuration;

  const ComponentTree({
    super.key,
    this.id,
    this.animationDuration = const Duration(milliseconds: 240),
  });

  @override
  ConsumerState<ComponentTree> createState() => _ComponentTreeState();
}

class _ComponentTreeState extends ConsumerState<ComponentTree>
    with SingleTickerProviderStateMixin {
  late final controller = AnimationController(vsync: this, value: 1);

  void toggle(WidgetRef ref) {
    final node = ref.read(nodeProvider(widget.id));
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
    final node = ref.read(nodeProvider(widget.id));
    if (node != null) {
      controller.value = node.data.isExpanded ? 1 : 0;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final node = ref.watch(nodeProvider(widget.id))!;
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
                    return InteractiveViewer(
                      constrained: false,
                      scaleEnabled: false,
                      child: ConstrainedBox(
                        constraints: constraints.copyWith(
                          maxWidth: constraints.maxWidth +
                              (node.root.data as RootTreeNode).depth * 16,
                          maxHeight: double.infinity,
                        ),
                        child: Column(
                          children: [
                            if (buildNode(ref, node) case Widget node) //
                              node,
                            if (node.children.isNotEmpty) //
                              buildChildrenNodes(node),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (buildNode(ref, node) case Widget node) //
                    node,
                  if (node.children.isNotEmpty) //
                    buildChildrenNodes(node),
                ],
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

    final isDense = node.data is! ModuleTreeNode;
    final leadingSize = isDense ? 20.0 : null;

    return IconTheme.merge(
      data: IconThemeData(size: leadingSize),
      child: Material(
        color: Theme.of(context).colorScheme.surfaceContainerLow,
        child: ListTile(
          dense: isDense,
          minLeadingWidth: leadingSize,
          contentPadding: EdgeInsets.only(
            left: 16.0 * node.data.level,
            top: switch (node.data) {
              ModuleTreeNode data => switch (data.level) {
                  1 => 32,
                  _ => switch (data.index) {
                      0 => 0,
                      _ => 16,
                    }
                },
              _ => 0,
            },
          ),
          leading: node.data.buildLeading(context),
          title: node.data.buildTitle(context),
          selected: ref.watch(selectedElementNotifierProvider) == node.data.id,
          onTap: () {
            if (node.isLeaf) {
              ref
                  .read(selectedElementNotifierProvider.notifier)
                  .select(node.data.id);
            } else {
              ref.read(componentTreeNotifierProvider.notifier).toggle(node);
            }
          },
        ),
      ),
    );
  }

  Widget buildChildrenNodes(Tree node) {
    return ClipRect(
      child: SizeTransition(
        axisAlignment: 1,
        sizeFactor: CurvedAnimation(parent: controller, curve: Curves.ease),
        child: Column(
          children: generateChildrenNodesWidget(node.children),
        ),
      ),
    );
  }

  List<Widget> generateChildrenNodesWidget(
    List<TreeType<AbstractComponentTreeNode>> list,
  ) =>
      List.generate(
        list.length,
        (int index) => ComponentTree(id: list[index].data.id),
      );
}
