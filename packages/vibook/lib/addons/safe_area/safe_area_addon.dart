import 'package:flutter/material.dart';
import 'package:vibook/addons/typed_addons/flag_addon.dart';
import 'package:vibook/toolbar/toolbar_addon_mixin.dart';
import 'package:vibook/toolbar/toolbar_button.dart';
import 'package:vibook_core/decorator.dart';

final class SafeAreaAddon extends FlagAddon with ToolbarAddonMixin {
  @override
  String get id => 'safe_area';

  @override
  String get name => 'Safe Area';

  @override
  List<Decorator> decorate(BuildContext context) {
    return [
      Decorator(
        (context, story) => ListenableBuilder(
          listenable: this,
          builder: (context, child) {
            if (value) {
              return SafeArea(child: child!);
            }

            return child!;
          },
          child: story,
        ),
      ),
    ];
  }

  @override
  List<Widget> get actions {
    return [
      ListenableBuilder(
        listenable: this,
        builder: (context, child) {
          return ToolbarButton(
            selected: value,
            onPressed: () => value = !value,
            tooltip: ToolbarTooltip(
              message: '${value ? 'Disable' : 'Enable'} Safe Area',
            ),
            child: Icon(
              value ? Icons.border_top_rounded : Icons.border_clear_rounded,
            ),
          );
        },
      ),
    ];
  }
}
