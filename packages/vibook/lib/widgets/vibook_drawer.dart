import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibook/feature_flags.dart';
import 'package:vibook/provider/theme_mode.dart';
import 'package:vibook/provider/title.dart';
import 'package:vibook/src/provider/feature_flags.dart';
import 'package:vibook/tree/component_tree.dart';
import 'package:vibook/tree_next/element_tree.dart';
import 'package:vibook_ui_kit/vibook_ui_kit.dart';

class VibookDrawer extends StatelessWidget {
  const VibookDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return ViDrawer(
          title: ref.watch(titleProvider),
          actions: [
            ViThemeButton(
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
