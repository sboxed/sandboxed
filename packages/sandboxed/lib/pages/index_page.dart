import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandboxed/inspector/addons_inspector.dart';
import 'package:sandboxed/layout/sandboxed_viewport.dart';
import 'package:sandboxed/widgets/sandboxed_drawer.dart';
import 'package:sandboxed/widgets/sandboxed_sidebar.dart';
import 'package:sandboxed_ui_kit/sandboxed_ui_kit.dart';

@RoutePage()
class IndexPage extends ConsumerWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 900 + kDividerWidth * 2;
        if (isMobile) {
          return const MobileLayout(
            drawer: SandboxedDrawer(),
            viewport: SandboxedViewport(),
          );
        } else {
          return const TabletLayout(
            drawer: SandboxedDrawer(),
            viewport: SandboxedViewport(),
            sidebar: SandboxedSidebar(
              tabs: [
                (Text('Addons'), AddonsInspector()),
              ],
            ),
          );
        }
      },
    );
  }
}
