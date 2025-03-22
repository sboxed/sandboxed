import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandboxed/provider/addons.dart';
import 'package:sandboxed/toolbar/toolbar_addon_mixin.dart';

class Toolbar extends StatelessWidget {
  const Toolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 48 + 4,
        minWidth: double.infinity,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Consumer(
          builder: (context, ref, child) {
            return Wrap(
              spacing: 4,
              runAlignment: WrapAlignment.center,
              children: [
                for (final addon in ref.watch(addonsProvider))
                  if (addon is ToolbarAddonMixin) //
                    ...addon.actions,
              ],
            );
          },
        ),
      ),
    );
  }
}
