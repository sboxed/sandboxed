import 'package:flutter/material.dart';
import 'package:vibook/addons/param_builders/base_param_builders/single_chips_param_builder.dart';
import 'package:vibook_core/decorator.dart';
import 'package:vibook_core/meta.dart';
import 'package:vibook_core/story.dart';
import 'package:vibook_sandbox/widgets/button.dart';

Meta get meta => Meta<ViButton>(
      name: '01. Button', // optional
      module: 'Features / 01. Core',
      component: ViButton, // optional
      documentation: '''
A Material Design "elevated button".

Use elevated buttons to add dimension to otherwise mostly flat
layouts, e.g. in long busy lists of content, or in wide
spaces. Avoid using elevated buttons on already-elevated content
such as dialogs or cards.

An elevated button is a label [child] displayed on a [Material]
widget whose [Material.elevation] increases when the button is
pressed. The label's [Text] and [Icon] widgets are displayed in
[style]'s [ButtonStyle.foregroundColor] and the button's filled
background is the [ButtonStyle.backgroundColor].

The elevated button's default style is defined by
[defaultStyleOf]. The style of this elevated button can be
overridden with its [style] parameter. The style of all elevated
buttons in a subtree can be overridden with the
[ElevatedButtonTheme], and the style of all of the elevated
buttons in an app can be overridden with the [Theme]'s
[ThemeData.elevatedButtonTheme] property.

The static [styleFrom] method is a convenient way to create a
elevated button [ButtonStyle] from simple values.

If [onPressed] and [onLongPress] callbacks are null, then the
button will be disabled.

{@tool dartpad}
This sample produces an enabled and a disabled ElevatedButton.

** See code in examples/api/lib/material/elevated_button/elevated_button.0.dart **
{@end-tool}

See also:

 * [FilledButton], a filled button that doesn't elevate when pressed.
 * [FilledButton.tonal], a filled button variant that uses a secondary fill color.
 * [OutlinedButton], a button with an outlined border and no fill color.
 * [TextButton], a button with no outline or fill color.
 * <https://material.io/design/components/buttons.html>
 * <https://m3.material.io/components/buttons>
''',
      parameters: {
        "golden": true,
        "fullpage": false,
      },
      decorators: [
        Decorator(
          (context, story) => Padding(
            padding: const EdgeInsets.all(16),
            child: story,
          ),
        ),
      ],
    );

Story get $Green => Story(
      name: 'Green',
      builder: (context, params) {
        return ViButton(
          title: params.string('title', "Lorem"),
          color: params.color('color', Colors.green),
          size: params.single(
            'size',
            ViButtonSize.small,
            ViButtonSize.values,
            ChipsType(),
          ),
        );
      },
    );

Story get $Blue => Story(
      name: 'Blue',
      builder: (context, params) {
        return ViButton(
          title: params.string('title', "Lorem"),
          color: params.color('color', Colors.blue),
          icon: params.boolean('has_icon', false)
              ? const Icon(Icons.check, color: Colors.white)
              : null,
        );
      },
    );
