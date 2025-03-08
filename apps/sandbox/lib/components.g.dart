// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_visible_for_testing_member, unused_import, duplicate_import, unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vibook_sandbox/widgets/button.stories.dart' as _i1;
import 'package:vibook_sandbox/widgets/header.stories.dart' as _i2;
import 'package:vibook_sandbox/widgets/header.dart' as _i3;
import 'package:vibook_sandbox/widgets/diagrams/button.stories.dart' as _i4;
import 'package:vibook_sandbox/widgets/diagrams/card.stories.dart' as _i5;
import 'package:vibook_sandbox/widgets/other_format.stories.dart' as _i6;
import 'package:vibook_sandbox/widgets/automatic/automatic_generation.stories.dart'
    as _i7;
import 'package:vibook_sandbox/widgets/automatic/automatic_generation.dart'
    as _i8;
import 'package:vibook_sandbox/widgets/automatic/unsupported_parameters.stories.dart'
    as _i9;
import 'package:vibook_core/vibook_core.dart';
import 'package:flutter/material.dart';

List<Component> get components => <Component>[
      Component(
        meta: _i1.meta.copyWith(documentation: [
          ..._i1.meta.documentation,
          DocumentEntry(
            name: 'Docs',
            content:
                'A Material Design "elevated button".\n\nUse elevated buttons to add dimension to otherwise mostly flat\nlayouts, e.g. in long busy lists of content, or in wide\nspaces. Avoid using elevated buttons on already-elevated content\nsuch as dialogs or cards.\n\nAn elevated button is a label [child] displayed on a [Material]\nwidget whose [Material.elevation] increases when the button is\npressed. The label\'s [Text] and [Icon] widgets are displayed in\n[style]\'s [ButtonStyle.foregroundColor] and the button\'s filled\nbackground is the [ButtonStyle.backgroundColor].\n\nThe elevated button\'s default style is defined by\n[defaultStyleOf]. The style of this elevated button can be\noverridden with its [style] parameter. The style of all elevated\nbuttons in a subtree can be overridden with the\n[ElevatedButtonTheme], and the style of all of the elevated\nbuttons in an app can be overridden with the [Theme]\'s\n[ThemeData.elevatedButtonTheme] property.\n\nThe static [styleFrom] method is a convenient way to create a\nelevated button [ButtonStyle] from simple values.\n\nIf [onPressed] and [onLongPress] callbacks are null, then the\nbutton will be disabled.\n\n{@tool dartpad}\nThis sample produces an enabled and a disabled ElevatedButton.\n\n** See code in examples/api/lib/material/elevated_button/elevated_button.0.dart **\n{@end-tool}\n\nSee also:\n\n * [FilledButton], a filled button that doesn\'t elevate when pressed.\n * [FilledButton.tonal], a filled button variant that uses a secondary fill color.\n * [OutlinedButton], a button with an outlined border and no fill color.\n * [TextButton], a button with no outline or fill color.\n * <https://material.io/design/components/buttons.html>\n * <https://m3.material.io/components/buttons>\n',
          ),
        ]),
        stories: [
          _i1.$Green.applyGenerated(
            name: 'Green',
            builder: (
              context,
              params,
            ) =>
                DefaultTextStyle(
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
          _i1.$Blue.applyGenerated(
            name: 'Blue',
            builder: (
              context,
              params,
            ) =>
                DefaultTextStyle(
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
        meta: _i2.meta,
        stories: [
          _i2.$Default.applyGenerated(
            name: 'Default',
            builder: (
              context,
              params,
            ) =>
                _i3.Header(
                    key: params.dynamic$(
              'key',
              null,
            )),
          )
        ],
      ),
      Component(
        meta: _i4.meta,
        stories: [
          _i4.$Green.applyGenerated(name: 'Green'),
          _i4.$Blue.applyGenerated(name: 'Blue'),
        ],
      ),
      Component(
        meta: _i5.meta,
        stories: [
          _i5.$Green.applyGenerated(name: 'Green'),
          _i5.$Blue.applyGenerated(name: 'Blue'),
        ],
      ),
      Component(
        meta: _i6.meta2,
        stories: [
          _i6.$Green.applyGenerated(
            name: 'Green',
            builder: (
              context,
              params,
            ) =>
                DefaultTextStyle(
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
          _i6.$Blue.applyGenerated(
            name: 'Blue',
            builder: (
              context,
              params,
            ) =>
                DefaultTextStyle(
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
        meta: _i7.meta,
        stories: [
          _i7.$Default.applyGenerated(
            name: 'Default',
            builder: (
              context,
              params,
            ) =>
                _i8.AutomaticGeneration(
              key: params.dynamic$(
                'key',
                null,
              ),
              text: params.string(
                'text',
                'Text',
              ),
              hasIcon: params.boolean(
                'hasIcon',
                true,
              ),
              color: params.color(
                'color',
                Colors.yellow,
              ),
              unsupported: params.dynamic$(
                'unsupported',
                null,
              ),
            ),
          ),
          _i7.$Enabled.applyGenerated(
            name: 'Enabled',
            builder: (
              context,
              params,
            ) =>
                _i8.AutomaticGeneration(
              key: params.dynamic$(
                'key',
                null,
              ),
              text: params.string(
                'text',
                'Text',
              ),
              hasIcon: params.boolean(
                'hasIcon',
                true,
              ),
              color: params.color(
                'color',
                Colors.yellow,
              ),
              unsupported: params.dynamic$(
                'unsupported',
                null,
              ),
            ),
          ),
        ],
      ),
      Component(
        meta: _i9.meta,
        stories: [
          _i9.$Default.applyGenerated(
            name: 'Default',
            builder: (
              context,
              params,
            ) =>
                DefaultTextStyle(
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
          _i9.$WithParams.applyGenerated(
            name: 'With Params',
            builder: (
              context,
              params,
            ) =>
                DefaultTextStyle(
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
          _i9.$WithBuilder.applyGenerated(
            name: 'With Builder',
            builder: (
              context,
              params,
            ) =>
                DefaultTextStyle(
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
