import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibook/addons/decorator_addon.dart';
import 'package:vibook/provider/addons.dart';

class AddonsInspector extends ConsumerWidget {
  const AddonsInspector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTextStyle.merge(
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            for (final addon in ref.watch(addonsProvider))
              if (addon case DecoratorAddon addon)
                if (addon.buildEditor(context) case Widget editor)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: KeyedSubtree(
                        key: Key(addon.id),
                        child: editor,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
