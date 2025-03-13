import 'package:flutter/material.dart';
import 'package:flutter_resizable_container/flutter_resizable_container.dart';
import 'package:vibook_ui_kit/src/widgets/layout/resizable_divider.dart';

class TabletLayout extends StatefulWidget {
  final Widget drawer;
  final Widget viewport;
  final Widget? sidebar;

  const TabletLayout({
    super.key,
    required this.drawer,
    required this.viewport,
    this.sidebar,
  });

  @override
  State<TabletLayout> createState() => _TabletLayoutState();
}

class _TabletLayoutState extends State<TabletLayout> {
  @override
  Widget build(BuildContext context) {
    final divider = buildResizableDivider(context);

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ResizableContainer(
            direction: Axis.horizontal,
            children: [
              ResizableChild(
                divider: divider,
                size: const ResizableSize.pixels(400, min: 300),
                child: widget.drawer,
              ),
              ResizableChild(
                divider: divider,
                size: const ResizableSize.expand(min: 300),
                child: widget.viewport,
              ),
              if (widget.sidebar case Widget sidebar)
                ResizableChild(
                  divider: divider,
                  size: const ResizableSize.pixels(400, min: 300),
                  child: sidebar,
                ),
            ],
          );
        },
      ),
    );
  }
}
