import 'package:vibook_core/vibook_core.dart';
import 'package:vibook_sandbox/widgets/button.stories.dart' as widgets_button;
import 'package:vibook_sandbox/widgets/header.stories.dart' as widgets_header;
import 'package:vibook_sandbox/widgets/diagrams/button.stories.dart'
    as widgets_diagrams_button;
import 'package:vibook_sandbox/widgets/diagrams/card.stories.dart'
    as widgets_diagrams_card;
import 'package:vibook_sandbox/widgets/other_format.stories.dart'
    as widgets_other_format;

List<Component> get components => <Component>[
      Component(
        meta: widgets_button.meta.copyWith(
          documentation: [
            ...widgets_button.meta.documentation,
            DocumentEntry(
                name: 'Docs', content: '''A Material Design "elevated button".

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
'''),
          ],
        ),
        stories: [widgets_button.$Green, widgets_button.$Blue],
      ),
      Component(
        meta: widgets_header.meta,
        stories: [widgets_header.$Default],
      ),
      Component(
        meta: widgets_diagrams_button.meta,
        stories: [
          widgets_diagrams_button.$Green,
          widgets_diagrams_button.$Blue
        ],
      ),
      Component(
        meta: widgets_diagrams_card.meta,
        stories: [widgets_diagrams_card.$Green, widgets_diagrams_card.$Blue],
      ),
      Component(
        meta: widgets_other_format.meta2,
        stories: [widgets_other_format.$Green, widgets_other_format.$Blue],
      ),
    ];
