import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibook/layout/mobile_layout.dart';
import 'package:vibook/layout/tablet_layout.dart';
import 'package:vibook/provider/component_tree.dart';
import 'package:vibook/widgets/resizable_divider.dart';

@RoutePage()
class IndexPage extends ConsumerWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final components = ref.watch(componentsProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 900 + kDividerWidth * 2;
        if (isMobile) {
          return MobileLayout(components: components);
        } else {
          return TabletLayout(components: components);
        }
      },
    );
  }
}
