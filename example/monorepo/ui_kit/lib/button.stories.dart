import 'package:flutter/material.dart';
import 'package:ui_kit/button.dart';
import 'package:vibook_core/decorator.dart';
import 'package:vibook_core/document_entry.dart';
import 'package:vibook_core/meta.dart';
import 'package:vibook_core/story.dart';

Meta get meta => Meta<Button>(
  name: '01. Button', // optional
  module: 'Features / 01. Core',
  component: Button, // optional
  documentation: [
    DocumentEntry(
      name: 'Docs',
      content: '''
A Material Design filled button.

Filled buttons have the most visual impact after the [FloatingActionButton],
and should be used for important, final actions that complete a flow,
like **Save**, **Join now**, or **Confirm**.

A filled button is a label [child] displayed on a [Material]
widget. The label's [Text] and [Icon] widgets are displayed in
[style]'s [ButtonStyle.foregroundColor] and the button's filled
background is the [ButtonStyle.backgroundColor].

The filled button's default style is defined by
[defaultStyleOf]. The style of this filled button can be
overridden with its [style] parameter. The style of all filled
buttons in a subtree can be overridden with the
[FilledButtonTheme], and the style of all of the filled
buttons in an app can be overridden with the [Theme]'s
[ThemeData.filledButtonTheme] property.

The static [styleFrom] method is a convenient way to create a
filled button [ButtonStyle] from simple values.

If [onPressed] and [onLongPress] callbacks are null, then the
button will be disabled.

To create a 'filled tonal' button, use [FilledButton.tonal].

{@tool dartpad}
This sample produces enabled and disabled filled and filled tonal
buttons.

** See code in examples/api/lib/material/filled_button/filled_button.0.dart **
{@end-tool}

See also:

 * [ElevatedButton], a filled button whose material elevates when pressed.
 * [OutlinedButton], a button with an outlined border and no fill color.
 * [TextButton], a button with no outline or fill color.
 * <https://material.io/design/components/buttons.html>
 * <https://m3.material.io/components/buttons>
''',
    ),
  ],
  parameters: {"golden": true, "fullpage": false},
  decorators: [
    Decorator(
      (context, story) =>
          Padding(padding: const EdgeInsets.all(16), child: story),
    ),
  ],
);

Story get $Green => Story(
  name: 'Green',
  builder: (context, params) {
    return Button(
      text: params.string('title', "Lorem"),
      color: params.color('color', Colors.green),
      size: params.single(
        'size',
        ButtonSize.small,
        ButtonSize.values,
        // ChipsType(),
      ),
    );
  },
);

Story get $Blue => Story(
  name: 'Blue',
  builder: (context, params) {
    return Button(
      text: params.string('title', "Lorem"),
      color: params.color('color', Colors.blue),
      icon:
          params.boolean('has_icon', false)
              ? const Icon(Icons.check, color: Colors.white)
              : null,
    );
  },
);
