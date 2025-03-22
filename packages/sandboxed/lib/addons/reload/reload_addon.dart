import 'package:flutter/material.dart';
import 'package:sandboxed/addons/addon.dart';
import 'package:sandboxed/addons/mixins/decorator_addon.dart';
import 'package:sandboxed/toolbar/toolbar_addon_mixin.dart';
import 'package:sandboxed/toolbar/toolbar_button.dart';
import 'package:sandboxed_core/decorator.dart';

final class ReloadAddon extends Addon
    with DecoratorAddon<int>, ToolbarAddonMixin {
  @override
  String get id => 'reload';

  @override
  int get initialValue => 0;

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
            listenable: this,
            builder: (context, child) => KeyedSubtree(
              key: ValueKey(value),
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
          onPressed: () => value++,
        )
      ];
}
