import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandboxed/feature_flags.dart';
import 'package:sandboxed/provider/theme_mode.dart';
import 'package:sandboxed/provider/title.dart';
import 'package:sandboxed/routing/sandboxed_router_provider.dart';
import 'package:sandboxed/src/provider/feature_flags.dart';
import 'package:sandboxed/tree/component_tree.dart';
import 'package:sandboxed/tree_next/element_tree.dart';
import 'package:sandboxed_ui_kit/sandboxed_ui_kit.dart';

class SandboxedDrawer extends StatelessWidget {
  const SandboxedDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return SBDrawer(
          title: ref.watch(titleProvider),
          actions: [
            IconButton(
              color: Colors.white,
              onPressed: () {
                context.sandboxedRouter?.showSettings();
              },
              icon: Icon(Icons.settings),
            ),
            SBThemeButton(
              value: ref.watch(themeModeNotifierProvider),
              onPressed: () {
                ref.read(themeModeNotifierProvider.notifier).next();
              },
            ),
          ],
          body: ref
                  .watch(featureFlagsProvider)
                  .contains(FeatureFlags.elementTreeNext)
              ? const ElementTree()
              : const ComponentTree(),
        );
      },
    );
  }
}
