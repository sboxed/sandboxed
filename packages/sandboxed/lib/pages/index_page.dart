import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandboxed/layout/sandboxed_viewport.dart';
import 'package:sandboxed/provider/settings.dart';
import 'package:sandboxed/widgets/sandboxed_drawer.dart';
import 'package:sandboxed/widgets/sandboxed_sidebar.dart';
import 'package:sandboxed_ui_kit/sandboxed_ui_kit.dart';

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
          final positions = ref.watch(
            settingStorageProvider.select((value) => value.positions),
          );

          return TabletLayout(
            drawer: SandboxedDrawer(),
            viewport: SandboxedViewport(),
            sidebar: positions.values.contains(PanelPosition.right) //
                ? SandboxedSidebar()
                : null,
          );
        }
      },
    );
  }
}
