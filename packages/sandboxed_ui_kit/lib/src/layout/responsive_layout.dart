import 'package:flutter/material.dart';
import 'package:sandboxed_ui_kit/src/layout/layout.dart';
import 'package:sandboxed_ui_kit/src/widgets/widgets.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget drawer;
  final Widget viewport;
  final Widget? sidebar;

  const ResponsiveLayout({
    super.key,
    required this.drawer,
    required this.viewport,
    this.sidebar,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 900 + kDividerWidth * 2;
        if (isMobile) {
          return MobileLayout(
            drawer: drawer,
            viewport: viewport,
          );
        } else {
          return TabletLayout(
            drawer: drawer,
            viewport: viewport,
            sidebar: sidebar,
          );
        }
      },
    );
  }
}
