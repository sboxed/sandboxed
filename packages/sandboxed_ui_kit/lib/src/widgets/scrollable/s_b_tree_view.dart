import 'package:flutter/material.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

export 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

// TODO(@melvspace): 03/23/25 fix nested nodes toggle animation, now it is clunky when nested nodes are expanded/collapsed.
// TODO(@melvspace): 03/23/25 fix null exception on last node collapsed - https://github.com/flutter/flutter/issues/164981.
class SBTreeView<T> extends StatefulWidget {
  final List<TreeViewNode<T>> tree;
  final TreeViewController? controller;

  final TreeViewNode<T> prototype;

  final Span Function(TreeViewNode<T> node) spanBuilder;
  final Widget Function(TreeViewNode<T> node) nodeBuilder;

  const SBTreeView({
    super.key,
    this.controller,
    required this.tree,
    required this.nodeBuilder,
    required this.spanBuilder,
    required this.prototype,
  });

  @override
  State<SBTreeView<T>> createState() => _SBTreeViewState();
}

class _SBTreeViewState<T> extends State<SBTreeView<T>> {
  /// The [TreeViewController] associated with this [TreeView].
  final TreeViewController treeController = TreeViewController();
  final ScrollController horizontalController = ScrollController();
  final ScrollController _verticalController = ScrollController();

  double? _crossAxisExtent;
  double? get crossAxisExtent => _crossAxisExtent;
  set crossAxisExtent(double? value) {
    if (mounted && _crossAxisExtent != value) {
      setState(() => _crossAxisExtent = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            if (widget.prototype case TreeViewNode<T> node)
              Positioned(
                left: 0,
                top: 0,
                child: OverflowBox(
                  minWidth: 0,
                  maxWidth: double.infinity,
                  child: IntrinsicWidth(
                    child: Builder(
                      builder: (context) {
                        Future.microtask(
                          () {
                            if (!context.mounted) return;

                            final padding = ((node.depth ?? 0) + 1) * 16;
                            final width =
                                (context.findRenderObject() as RenderBox)
                                    .size
                                    .width;

                            if (width + padding < constraints.maxWidth) {
                              crossAxisExtent = constraints.maxWidth;
                            } else {
                              crossAxisExtent = width + padding;
                            }
                          },
                        );

                        return widget.nodeBuilder(node);
                      },
                    ),
                  ),
                ),
              ),
            Scrollbar(
              controller: horizontalController,
              thumbVisibility: true,
              scrollbarOrientation: ScrollbarOrientation.bottom,
              child: Scrollbar(
                controller: _verticalController,
                thumbVisibility: true,
                scrollbarOrientation: ScrollbarOrientation.right,
                child: TreeView(
                  tree: widget.tree,
                  controller: widget.controller ?? treeController,
                  indentation: TreeViewIndentationType.none,
                  verticalDetails: ScrollableDetails.vertical(
                    controller: _verticalController,
                  ),
                  horizontalDetails: ScrollableDetails.horizontal(
                    controller: horizontalController,
                  ),
                  treeNodeBuilder: (context, node, toggleAnimationStyle) {
                    if (crossAxisExtent != null) {
                      return SizedBox(
                        width: crossAxisExtent,
                        child: widget.nodeBuilder(node),
                      );
                    }

                    return IntrinsicWidth(
                      child: widget.nodeBuilder(node),
                    );
                  },
                  treeRowBuilder: (node) => widget.spanBuilder(node),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
