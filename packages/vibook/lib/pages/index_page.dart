import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibook/inspector/addons_inspector.dart';
import 'package:vibook/layout/vibook_viewport.dart';
import 'package:vibook/widgets/vibook_drawer.dart';
import 'package:vibook/widgets/vibook_sidebar.dart';
import 'package:vibook_ui_kit/vibook_ui_kit.dart';

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
            drawer: VibookDrawer(),
            viewport: VibookViewport(),
          );
        } else {
          return const TabletLayout(
            drawer: VibookDrawer(),
            viewport: VibookViewport(),
            sidebar: VibookSidebar(
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
