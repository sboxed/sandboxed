import 'package:flutter/material.dart';
import 'package:vibook/addons/typed_addons/flag_addon.dart';
import 'package:vibook/toolbar/toolbar_addon_mixin.dart';
import 'package:vibook/toolbar/toolbar_button.dart';

final class KeyboardAddon extends FlagAddon with ToolbarAddonMixin {
  KeyboardAddon();

  @override
  String get id => 'keyboard';

  @override
  String get name => 'Keyboard';

  @override
  List<Widget> get actions {
    return [
      ListenableBuilder(
        listenable: this,
        builder: (context, _) {
          final isEnabled = value;

          return ToolbarButton(
            selected: value,
            onPressed: () => value = !value,
            tooltip: ToolbarTooltip(
              message: !value //
                  ? 'Enable Keyboard'
                  : 'Disable Keyboard',
            ),
            child: Icon(
              isEnabled ? Icons.keyboard : Icons.keyboard_outlined,
            ),
          );
        },
      ),
    ];
  }
}
