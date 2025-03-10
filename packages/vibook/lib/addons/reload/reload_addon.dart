import 'package:flutter/material.dart';
import 'package:vibook/addons/addon.dart';
import 'package:vibook/addons/mixins/decorator_addon.dart';
import 'package:vibook/toolbar/toolbar_addon_mixin.dart';
import 'package:vibook/toolbar/toolbar_button.dart';
import 'package:vibook_core/decorator.dart';

final class ReloadAddon extends Addon
    with DecoratorAddon<int>, ToolbarAddonMixin {
  @override
  String get id => 'reload';

  @override
  final notifier = ValueNotifier(0);

  @override
  Widget? buildEditor(BuildContext context) {
    return null;
  }

  @override
  List<Decorator> decorate(BuildContext context) {
    return [
      Decorator(
        (context, story) {
          return ListenableBuilder(
            listenable: notifier,
            builder: (context, child) => KeyedSubtree(
              key: ValueKey(notifier.value),
              child: story,
            ),
          );
        },
      )
    ];
  }

  @override
  List<Widget> get actions => [
        ToolbarButton(
          child: const Icon(Icons.replay_outlined),
          onPressed: () => notifier.value++,
        )
      ];
}
