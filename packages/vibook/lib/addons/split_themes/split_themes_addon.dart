import 'package:flutter/material.dart';
import 'package:vibook/addons/typed_addons/flag_addon.dart';
import 'package:vibook/toolbar/toolbar_addon_mixin.dart';
import 'package:vibook/toolbar/toolbar_button.dart';
import 'package:vibook_core/vibook_core.dart';

class SplittedThemesParams {
  final bool enabled;
  final Axis direction;

  SplittedThemesParams({
    required this.enabled,
    this.direction = Axis.horizontal,
  });
}

final class SplittedThemesAddon extends FlagAddon with ToolbarAddonMixin {
  final ThemeData lightTheme;
  final ThemeData darkTheme;

  @override
  String get id => 'split_themes';

  @override
  String get name => 'Split Viewport with multiple themes';

  SplittedThemesAddon({
    required this.lightTheme,
    required this.darkTheme,
  });

  @override
  List<Decorator> decorate(BuildContext context) {
    return [
      Decorator(
        (context, story) {
          return ListenableBuilder(
            listenable: this,
            builder: (context, child) {
              if (value) {
                return ConstrainedBox(
                  constraints: BoxConstraints.tight(MediaQuery.sizeOf(context)),
                  child: Flex(
                    // TODO(@melvspace): 03/06/25 add direction change support.
                    direction: Axis.horizontal,
                    children: [
                      for (final brightness in Brightness.values) //
                        Expanded(
                          child: MediaQuery(
                            data: MediaQuery.of(context).copyWith(
                              platformBrightness: brightness,
                            ),
                            child: Theme(
                              data: switch (brightness) {
                                Brightness.light => lightTheme,
                                Brightness.dark => darkTheme,
                              },
                              child: child!,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              }

              return child!;
            },
            child: story,
          );
        },
      )
    ];
  }

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
              message:
                  !value ? 'Enable splitted themes' : 'Disable splitted themes',
            ),
            child: Icon(isEnabled ? Icons.domain_disabled : Icons.domain),
          );
        },
      ),
    ];
  }
}
