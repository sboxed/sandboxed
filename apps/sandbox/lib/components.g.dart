// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_visible_for_testing_member, unused_import, duplicate_import, unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

import 'package:vibook_core/vibook_core.dart';
import 'package:flutter/material.dart';
import 'package:vibook_sandbox/widgets/button.stories.dart' as widgets_button;
import 'package:vibook_sandbox/widgets/button.dart';
import 'package:vibook_sandbox/widgets/header.stories.dart' as widgets_header;
import 'package:vibook_sandbox/widgets/header.dart';
import 'package:vibook_sandbox/widgets/diagrams/button.stories.dart'
    as widgets_diagrams_button;
import 'package:vibook_sandbox/widgets/diagrams/card.stories.dart'
    as widgets_diagrams_card;
import 'package:vibook_sandbox/widgets/other_format.stories.dart'
    as widgets_other_format;
import 'package:vibook_sandbox/widgets/button.dart';
import 'package:vibook_sandbox/widgets/automatic/automatic_generation.stories.dart'
    as widgets_automatic_automatic_generation;
import 'package:vibook_sandbox/widgets/automatic/automatic_generation.dart';
import 'package:vibook_sandbox/widgets/automatic/unsupported_parameters.stories.dart'
    as widgets_automatic_unsupported_parameters;
import 'package:vibook_sandbox/widgets/automatic/unsupported_parameters.dart';

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
        stories: [
          widgets_button.$Green.applyGenerated(
            name: 'Green',
            builder: (context, params) => DefaultTextStyle(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 24,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Component has unsupported parameters and can\'t be built automatically'),
                      Text('Parameter `size` of type [ViButtonSize]'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          widgets_button.$Blue.applyGenerated(
            name: 'Blue',
            builder: (context, params) => DefaultTextStyle(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 24,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Component has unsupported parameters and can\'t be built automatically'),
                      Text('Parameter `size` of type [ViButtonSize]'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      Component(
        meta: widgets_header.meta,
        stories: [
          widgets_header.$Default.applyGenerated(
            name: 'Default',
            builder: (context, params) => Header(
              key: params.dynamic$('key', null),
            ),
          ),
        ],
      ),
      Component(
        meta: widgets_diagrams_button.meta,
        stories: [
          widgets_diagrams_button.$Green.applyGenerated(
            name: 'Green',
          ),
          widgets_diagrams_button.$Blue.applyGenerated(
            name: 'Blue',
          ),
        ],
      ),
      Component(
        meta: widgets_diagrams_card.meta,
        stories: [
          widgets_diagrams_card.$Green.applyGenerated(
            name: 'Green',
          ),
          widgets_diagrams_card.$Blue.applyGenerated(
            name: 'Blue',
          ),
        ],
      ),
      Component(
        meta: widgets_other_format.meta2,
        stories: [
          widgets_other_format.$Green.applyGenerated(
            name: 'Green',
            builder: (context, params) => DefaultTextStyle(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 24,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Component has unsupported parameters and can\'t be built automatically'),
                      Text('Parameter `size` of type [ViButtonSize]'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          widgets_other_format.$Blue.applyGenerated(
            name: 'Blue',
            builder: (context, params) => DefaultTextStyle(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 24,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Component has unsupported parameters and can\'t be built automatically'),
                      Text('Parameter `size` of type [ViButtonSize]'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      Component(
        meta: widgets_automatic_automatic_generation.meta,
        stories: [
          widgets_automatic_automatic_generation.$Default.applyGenerated(
            name: 'Default',
            builder: (context, params) => AutomaticGeneration(
              key: params.dynamic$('key', null),
              text: params.string('text', 'Text'),
              hasIcon: params.boolean('hasIcon', true),
              color: params.color('color', Colors.yellow),
              unsupported: params.dynamic$('unsupported', null),
            ),
          ),
          widgets_automatic_automatic_generation.$Enabled.applyGenerated(
            name: 'Enabled',
            builder: (context, params) => AutomaticGeneration(
              key: params.dynamic$('key', null),
              text: params.string('text', 'Text'),
              hasIcon: params.boolean('hasIcon', true),
              color: params.color('color', Colors.yellow),
              unsupported: params.dynamic$('unsupported', null),
            ),
          ),
        ],
      ),
      Component(
        meta: widgets_automatic_unsupported_parameters.meta,
        stories: [
          widgets_automatic_unsupported_parameters.$Default.applyGenerated(
            name: 'Default',
            builder: (context, params) => DefaultTextStyle(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 24,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Component has unsupported parameters and can\'t be built automatically'),
                      Text('Parameter `padding` of type [EdgeInsets]'),
                      Text('Parameter `style` of type [TextStyle]'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          widgets_automatic_unsupported_parameters.$WithParams.applyGenerated(
            name: 'With Params',
            builder: (context, params) => DefaultTextStyle(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 24,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Component has unsupported parameters and can\'t be built automatically'),
                      Text('Parameter `padding` of type [EdgeInsets]'),
                      Text('Parameter `style` of type [TextStyle]'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          widgets_automatic_unsupported_parameters.$WithBuilder.applyGenerated(
            name: 'With Builder',
            builder: (context, params) => DefaultTextStyle(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 24,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Component has unsupported parameters and can\'t be built automatically'),
                      Text('Parameter `padding` of type [EdgeInsets]'),
                      Text('Parameter `style` of type [TextStyle]'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ];
