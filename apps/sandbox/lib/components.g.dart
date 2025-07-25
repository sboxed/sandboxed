// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_visible_for_testing_member, unused_import, duplicate_import, unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:sandboxed_sandbox/widgets/abstract_widget.stories.dart' as _i1;
import 'package:sandboxed_core/sandboxed_core.dart' as _i2;
import 'package:sandboxed_sandbox/widgets/automatic/automatic_generation.stories.dart'
    as _i3;
import 'package:sandboxed_sandbox/widgets/automatic/automatic_generation.dart'
    as _i4;
import 'package:sandboxed_sandbox/widgets/params/flutter_params.stories.dart'
    as _i5;
import 'package:sandboxed_sandbox/widgets/params/flutter_params.dart' as _i6;
import 'package:flutter/src/painting/alignment.dart' as _i7;
import 'package:flutter/src/painting/edge_insets.dart' as _i8;
import 'package:flutter/src/painting/text_style.dart' as _i9;
import 'package:sandboxed_sandbox/widgets/header.stories.dart' as _i10;
import 'package:sandboxed_sandbox/widgets/header.dart' as _i11;
import 'package:sandboxed_sandbox/cases/navigator_boundary.stories.dart'
    as _i12;
import 'package:sandboxed_sandbox/cases/navigator_boundary.dart' as _i13;
import 'package:sandboxed_sandbox/widgets/nullable_and_required/nullable_and_required_params.stories.dart'
    as _i14;
import 'package:sandboxed_sandbox/widgets/nullable_and_required/nullable_and_required_params.dart'
    as _i15;
import 'package:sandboxed_sandbox/widgets/button.stories.dart' as _i16;
import 'package:sandboxed_sandbox/widgets/button.dart' as _i17;
import 'package:flutter/src/widgets/framework.dart' as _i18;
import 'package:sandboxed_sandbox/widgets/other_format.stories.dart' as _i19;
import 'package:sandboxed_sandbox/widgets/diagrams/button.stories.dart' as _i20;
import 'package:sandboxed_sandbox/widgets/diagrams/button.dart' as _i21;
import 'package:sandboxed_sandbox/widgets/diagrams/card.stories.dart' as _i22;
import 'package:sandboxed_sandbox/widgets/diagrams/card.dart' as _i23;
import 'package:sandboxed_sandbox/widgets/tags/tagged_component.stories.dart'
    as _i24;
import 'package:sandboxed_sandbox/widgets/tags/tagged_component.dart' as _i25;
import 'package:sandboxed_sandbox/widgets/tags/tagged_stories.stories.dart'
    as _i26;
import 'package:sandboxed_sandbox/widgets/tags/tagged_stories.dart' as _i27;
import 'package:sandboxed_sandbox/widgets/markdown/markdown_documentation.stories.dart'
    as _i28;
import 'package:flutter/src/widgets/text.dart' as _i29;
import 'package:flutter/src/painting/strut_style.dart' as _i30;
import 'dart:ui' as _i31;
import 'package:flutter/src/painting/text_painter.dart' as _i32;
import 'package:flutter/src/painting/text_scaler.dart' as _i33;
import 'package:sandboxed_sandbox/widgets/automatic/unsupported_parameters.stories.dart'
    as _i34;
import 'package:sandboxed_sandbox/widgets/automatic/unsupported_parameters.dart'
    as _i35;
import 'package:sandboxed_sandbox/widgets/automatic/with_enum.stories.dart'
    as _i36;
import 'package:sandboxed_sandbox/widgets/automatic/with_enum.dart' as _i37;
import 'package:sandboxed_sandbox/data/some_enum.dart' as _i38;
import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:flutter/material.dart';

List<Component> get components => <Component>[
  Component(
    meta: _i1.meta,
    stories: [
      _i1.$Default.applyGenerated(
        name: 'Default',
        builder: (context, params) => throw _i2.AbstractWidgetClassException(),
      ),
      _i1.$NoBuilder.applyGenerated(
        name: 'No Builder',
        builder: (context, params) => throw _i2.AbstractWidgetClassException(),
      ),
    ],
  ),
  Component(
    meta: _i3.meta,
    stories: [
      _i3.$Default.applyGenerated(
        name: 'Default',
        builder: (context, params) => _i4.AutomaticGeneration(
          key: null,
          text: params.string(r'text').required('Text'),
          hasIcon: params.boolean(r'hasIcon').required(true),
          color: params.color(r'color').required(Colors.yellow),
          unsupported: params
              .dynamic$<void Function(), void, void>(r'unsupported')
              .optional(null),
          gradient: params.gradient(r'gradient').optional(null),
          datetime: params.datetime(r'datetime').optional(null),
          duration: params.duration(r'duration').optional(null),
        ),
      ),
      _i3.$Enabled.applyGenerated(
        name: 'Enabled',
        builder: (context, params) => _i4.AutomaticGeneration(
          key: null,
          text: params.string(r'text').required('Text'),
          hasIcon: params.boolean(r'hasIcon').required(true),
          color: params.color(r'color').required(Colors.yellow),
          unsupported: params
              .dynamic$<void Function(), void, void>(r'unsupported')
              .optional(null),
          gradient: params.gradient(r'gradient').optional(null),
          datetime: params.datetime(r'datetime').optional(null),
          duration: params.duration(r'duration').optional(null),
        ),
      ),
    ],
  ),
  Component(
    meta: _i5.meta,
    stories: [
      _i5.$Default.applyGenerated(
        name: 'Default',
        builder: (context, params) => _i6.FlutterParamsWidget(
          key: null,
          alignment: params
              .dynamic$<_i7.Alignment, void, void>(r'alignment')
              .default$(),
          padding: params
              .dynamic$<_i8.EdgeInsets, void, void>(r'padding')
              .default$(),
          style: params
              .dynamic$<_i9.TextStyle, void, void>(r'style')
              .default$(),
        ),
      ),
    ],
  ),
  Component(
    meta: _i10.meta,
    stories: [
      _i10.$Default.applyGenerated(
        name: 'Default',
        builder: (context, params) => _i11.Header(key: null),
      ),
    ],
  ),
  Component(
    meta: _i12.meta,
    stories: [
      _i12.$Default.applyGenerated(
        name: 'Default',
        builder: (context, params) => _i13.NavigatorBoundaryScenario(key: null),
      ),
    ],
  ),
  Component(
    meta: _i14.meta,
    stories: [
      _i14.$Automatic.applyGenerated(
        name: 'Automatic',
        builder: (context, params) => _i15.NullableAndRequiredParamsWidget(
          key: null,
          text: params.string(r'text').optional(null),
          boolean: params.boolean(r'boolean').optional(null),
          double$: params.number(r'double$').optional(null),
          integer: params.integer(r'integer').optional(null),
          requiredText: params.string(r'requiredText').required('Text'),
          requiredBoolean: params.boolean(r'requiredBoolean').required(false),
          requiredDouble: params.number(r'requiredDouble').required(0.0),
          requiredInteger: params.integer(r'requiredInteger').required(0),
        ),
      ),
      _i14.$Manual.applyGenerated(
        name: 'Manual',
        builder: (context, params) => _i15.NullableAndRequiredParamsWidget(
          key: null,
          text: params.string(r'text').optional(null),
          boolean: params.boolean(r'boolean').optional(null),
          double$: params.number(r'double$').optional(null),
          integer: params.integer(r'integer').optional(null),
          requiredText: params.string(r'requiredText').required('Text'),
          requiredBoolean: params.boolean(r'requiredBoolean').required(false),
          requiredDouble: params.number(r'requiredDouble').required(0.0),
          requiredInteger: params.integer(r'requiredInteger').required(0),
        ),
      ),
    ],
  ),
  Component(
    meta: _i16.meta.copyWith(
      documentation: [
        ..._i16.meta.documentation,
        DocumentEntry(
          name: 'Docs',
          content:
              'A Material Design "elevated button".\n\nUse elevated buttons to add dimension to otherwise mostly flat\nlayouts, e.g. in long busy lists of content, or in wide\nspaces. Avoid using elevated buttons on already-elevated content\nsuch as dialogs or cards.\n\nAn elevated button is a label [child] displayed on a [Material]\nwidget whose [Material.elevation] increases when the button is\npressed. The label\'s [Text] and [Icon] widgets are displayed in\n[style]\'s [ButtonStyle.foregroundColor] and the button\'s filled\nbackground is the [ButtonStyle.backgroundColor].\n\nThe elevated button\'s default style is defined by\n[defaultStyleOf]. The style of this elevated button can be\noverridden with its [style] parameter. The style of all elevated\nbuttons in a subtree can be overridden with the\n[ElevatedButtonTheme], and the style of all of the elevated\nbuttons in an app can be overridden with the [Theme]\'s\n[ThemeData.elevatedButtonTheme] property.\n\nThe static [styleFrom] method is a convenient way to create a\nelevated button [ButtonStyle] from simple values.\n\nIf [onPressed] and [onLongPress] callbacks are null, then the\nbutton will be disabled.\n\n{@tool dartpad}\nThis sample produces an enabled and a disabled ElevatedButton.\n\n** See code in examples/api/lib/material/elevated_button/elevated_button.0.dart **\n{@end-tool}\n\nSee also:\n\n * [FilledButton], a filled button that doesn\'t elevate when pressed.\n * [FilledButton.tonal], a filled button variant that uses a secondary fill color.\n * [OutlinedButton], a button with an outlined border and no fill color.\n * [TextButton], a button with no outline or fill color.\n * <https://material.io/design/components/buttons.html>\n * <https://m3.material.io/components/buttons>\n',
        ),
      ],
    ),
    stories: [
      _i16.$Blue.applyGenerated(
        name: 'Blue',
        builder: (context, params) => _i17.SandboxButton(
          key: null,
          title: params.string(r'title').required('Text'),
          color: params.color(r'color').required(Colors.red),
          size: params
              .single(r'size', _i17.SandboxButtonSize.values)
              .required(_i17.SandboxButtonSize.small),
          icon: params
              .dynamic$<_i18.Widget, void, void>(r'icon')
              .optional(null),
          onPressed: params
              .dynamic$<void Function(), void, void>(r'onPressed')
              .optional(null),
        ),
      ),
      _i16.$Green.applyGenerated(
        name: 'Green',
        builder: (context, params) => _i17.SandboxButton(
          key: null,
          title: params.string(r'title').required('Text'),
          color: params.color(r'color').required(Colors.red),
          size: params
              .single(r'size', _i17.SandboxButtonSize.values)
              .required(_i17.SandboxButtonSize.small),
          icon: params
              .dynamic$<_i18.Widget, void, void>(r'icon')
              .optional(null),
          onPressed: params
              .dynamic$<void Function(), void, void>(r'onPressed')
              .optional(null),
        ),
      ),
      _i16.$Yellow.applyGenerated(
        name: 'Yellow',
        builder: (context, params) => _i17.SandboxButton(
          key: null,
          title: params.string(r'title').required('Text'),
          color: params.color(r'color').required(Colors.red),
          size: params
              .single(r'size', _i17.SandboxButtonSize.values)
              .required(_i17.SandboxButtonSize.small),
          icon: params
              .dynamic$<_i18.Widget, void, void>(r'icon')
              .optional(null),
          onPressed: params
              .dynamic$<void Function(), void, void>(r'onPressed')
              .optional(null),
        ),
      ),
    ],
  ),
  Component(
    meta: _i19.meta2,
    stories: [
      _i19.$Blue.applyGenerated(
        name: 'Blue',
        builder: (context, params) => _i17.SandboxButton(
          key: null,
          title: params.string(r'title').required('Text'),
          color: params.color(r'color').required(Colors.red),
          size: params
              .single(r'size', _i17.SandboxButtonSize.values)
              .required(_i17.SandboxButtonSize.small),
          icon: params
              .dynamic$<_i18.Widget, void, void>(r'icon')
              .optional(null),
          onPressed: params
              .dynamic$<void Function(), void, void>(r'onPressed')
              .optional(null),
        ),
      ),
      _i19.$Green.applyGenerated(
        name: 'Green',
        builder: (context, params) => _i17.SandboxButton(
          key: null,
          title: params.string(r'title').required('Text'),
          color: params.color(r'color').required(Colors.red),
          size: params
              .single(r'size', _i17.SandboxButtonSize.values)
              .required(_i17.SandboxButtonSize.small),
          icon: params
              .dynamic$<_i18.Widget, void, void>(r'icon')
              .optional(null),
          onPressed: params
              .dynamic$<void Function(), void, void>(r'onPressed')
              .optional(null),
        ),
      ),
    ],
  ),
  Component(
    meta: _i20.meta,
    stories: [
      _i20.$Blue.applyGenerated(
        name: 'Blue',
        builder: (context, params) => _i21.SandboxDiagramButton(
          key: null,
          title: params.string(r'title').required('Text'),
          color: params.color(r'color').required(Colors.red),
        ),
      ),
      _i20.$Green.applyGenerated(
        name: 'Green',
        builder: (context, params) => _i21.SandboxDiagramButton(
          key: null,
          title: params.string(r'title').required('Text'),
          color: params.color(r'color').required(Colors.red),
        ),
      ),
    ],
  ),
  Component(
    meta: _i22.meta,
    stories: [
      _i22.$Blue.applyGenerated(
        name: 'Blue',
        builder: (context, params) => _i23.SandboxDiagramCard(
          key: null,
          title: params.string(r'title').required('Text'),
          color: params.color(r'color').required(Colors.red),
          stats: params
              .dynamic$<
                List<_i23.SandboxDiagramCardStats>,
                _i23.SandboxDiagramCardStats,
                void
              >(r'stats')
              .required([]),
          onChanged: params
              .dynamic$<
                void Function(
                  (
                    _i23.SandboxDiagramCardStats,
                    _i23.SandboxDiagramCardStats?, {
                    String name,
                    _i23.SandboxDiagramCardStats next,
                    _i23.SandboxDiagramCardStats? nullable,
                  }),
                ),
                void,
                void
              >(r'onChanged')
              .optional(null),
        ),
      ),
      _i22.$Green.applyGenerated(
        name: 'Green',
        builder: (context, params) => _i23.SandboxDiagramCard(
          key: null,
          title: params.string(r'title').required('Text'),
          color: params.color(r'color').required(Colors.red),
          stats: params
              .dynamic$<
                List<_i23.SandboxDiagramCardStats>,
                _i23.SandboxDiagramCardStats,
                void
              >(r'stats')
              .required([]),
          onChanged: params
              .dynamic$<
                void Function(
                  (
                    _i23.SandboxDiagramCardStats,
                    _i23.SandboxDiagramCardStats?, {
                    String name,
                    _i23.SandboxDiagramCardStats next,
                    _i23.SandboxDiagramCardStats? nullable,
                  }),
                ),
                void,
                void
              >(r'onChanged')
              .optional(null),
        ),
      ),
    ],
  ),
  Component(
    meta: _i24.meta,
    stories: [
      _i24.$Default.applyGenerated(
        name: 'Default',
        builder: (context, params) => _i25.TaggedComponent(key: null),
      ),
    ],
  ),
  Component(
    meta: _i26.meta,
    stories: [
      _i26.$Deprecated.applyGenerated(
        name: 'Deprecated',
        builder: (context, params) => _i27.TaggedStories(key: null),
      ),
      _i26.$New.applyGenerated(
        name: 'New',
        builder: (context, params) => _i27.TaggedStories(key: null),
      ),
    ],
  ),
  Component(
    meta: _i28.meta.copyWith(
      documentation: [
        ..._i28.meta.documentation,
        DocumentEntry(
          name: 'Docs',
          content:
              '# Headers\n\n```\n# h1 Heading 8-)\n## h2 Heading\n### h3 Heading\n#### h4 Heading\n##### h5 Heading\n###### h6 Heading\n\nAlternatively, for H1 and H2, an underline-ish style:\n\nAlt-H1\n======\n\nAlt-H2\n------\n```	\n\n# h1 Heading 8-)\n## h2 Heading\n### h3 Heading\n#### h4 Heading\n##### h5 Heading\n###### h6 Heading\n\nAlternatively, for H1 and H2, an underline-ish style:\n\nAlt-H1\n======\n\nAlt-H2\n------\n\n------\n\n# Emphasis\n\n```\nEmphasis, aka italics, with *asterisks* or _underscores_.\n\nStrong emphasis, aka bold, with **asterisks** or __underscores__.\n\nCombined emphasis with **asterisks and _underscores_**.\n\nStrikethrough uses two tildes. ~~Scratch this.~~\n\n**This is bold text**\n\n__This is bold text__\n\n*This is italic text*\n\n_This is italic text_\n\n~~Strikethrough~~\n```\n\nEmphasis, aka italics, with *asterisks* or _underscores_.\n\nStrong emphasis, aka bold, with **asterisks** or __underscores__.\n\nCombined emphasis with **asterisks and _underscores_**.\n\nStrikethrough uses two tildes. ~~Scratch this.~~\n\n**This is bold text**\n\n__This is bold text__\n\n*This is italic text*\n\n_This is italic text_\n\n~~Strikethrough~~\n\n------\n\n# Lists\n\n```\n1. First ordered list item\n2. Another item\n⋅⋅* Unordered sub-list.\n1. Actual numbers don\'t matter, just that it\'s a number\n⋅⋅1. Ordered sub-list\n4. And another item.\n\n⋅⋅⋅You can have properly indented paragraphs within list items. Notice the blank line above, and the leading spaces (at least one, but we\'ll use three here to also align the raw Markdown).\n\n⋅⋅⋅To have a line break without a paragraph, you will need to use two trailing spaces.⋅⋅\n⋅⋅⋅Note that this line is separate, but within the same paragraph.⋅⋅\n⋅⋅⋅(This is contrary to the typical GFM line break behaviour, where trailing spaces are not required.)\n\n* Unordered list can use asterisks\n- Or minuses\n+ Or pluses\n\n1. Make my changes\n    1. Fix bug\n    2. Improve formatting\n        - Make the headings bigger\n2. Push my commits to GitHub\n3. Open a pull request\n    * Describe my changes\n    * Mention all the members of my team\n        * Ask for feedback\n\n+ Create a list by starting a line with `+`, `-`, or `*`\n+ Sub-lists are made by indenting 2 spaces:\n  - Marker character change forces new list start:\n    * Ac tristique libero volutpat at\n    + Facilisis in pretium nisl aliquet\n    - Nulla volutpat aliquam velit\n+ Very easy!\n```\n\n1. First ordered list item\n2. Another item\n  * Unordered sub-list.\n1. Actual numbers don\'t matter, just that it\'s a number\n  1. Ordered sub-list\n4. And another item.\n\n  You can have properly indented paragraphs within list items. Notice the blank line above, and the leading spaces (at least one, but we\'ll use three here to also align the raw Markdown).\n\n  To have a line break without a paragraph, you will need to use two trailing spaces.⋅⋅\n  Note that this line is separate, but within the same paragraph.⋅⋅\n  (This is contrary to the typical GFM line break behaviour, where trailing spaces are not required.)\n\n* Unordered list can use asterisks\n- Or minuses\n+ Or pluses\n\n1. Make my changes\n    1. Fix bug\n    2. Improve formatting\n        - Make the headings bigger\n2. Push my commits to GitHub\n3. Open a pull request\n    * Describe my changes\n    * Mention all the members of my team\n        * Ask for feedback\n\n+ Create a list by starting a line with `+`, `-`, or `*`\n+ Sub-lists are made by indenting 2 spaces:\n  - Marker character change forces new list start:\n    * Ac tristique libero volutpat at\n    + Facilisis in pretium nisl aliquet\n    - Nulla volutpat aliquam velit\n+ Very easy!\n\n------\n\n# Task lists\n\n```\n- [x] Finish my changes\n- [ ] Push my commits to GitHub\n- [ ] Open a pull request\n- [x] @mentions, #refs, [links](), **formatting**, and <del>tags</del> supported\n- [x] list syntax required (any unordered or ordered list supported)\n- [x] this is a complete item\n- [ ] this is an incomplete item\n```\n\n- [x] Finish my changes\n- [ ] Push my commits to GitHub\n- [ ] Open a pull request\n- [x] @mentions, #refs, [links](), **formatting**, and <del>tags</del> supported\n- [x] list syntax required (any unordered or ordered list supported)\n- [ ] this is a complete item\n- [ ] this is an incomplete item\n\n------\n\n# Ignoring Markdown formatting\n\nYou can tell GitHub to ignore (or escape) Markdown formatting by using \ before the Markdown character.\n\n```\nLet\'s rename \*our-new-project\* to \*our-old-project\*.\n```\n\nLet\'s rename \*our-new-project\* to \*our-old-project\*.\n\n------\n\n# Links\n\n```\n[I\'m an inline-style link](https://www.google.com)\n\n[I\'m an inline-style link with title](https://www.google.com "Google\'s Homepage")\n\n[I\'m a reference-style link][Arbitrary case-insensitive reference text]\n\n[I\'m a relative reference to a repository file](../blob/master/LICENSE)\n\n[You can use numbers for reference-style link definitions][1]\n\nOr leave it empty and use the [link text itself].\n\nURLs and URLs in angle brackets will automatically get turned into links.\nhttp://www.example.com or <http://www.example.com> and sometimes\nexample.com (but not on Github, for example).\n\nSome text to show that the reference links can follow later.\n\n[arbitrary case-insensitive reference text]: https://www.mozilla.org\n[1]: http://slashdot.org\n[link text itself]: http://www.reddit.com\n```\n\n[I\'m an inline-style link](https://www.google.com)\n\n[I\'m an inline-style link with title](https://www.google.com "Google\'s Homepage")\n\n[I\'m a reference-style link][Arbitrary case-insensitive reference text]\n\n[I\'m a relative reference to a repository file](../blob/master/LICENSE)\n\n[You can use numbers for reference-style link definitions][1]\n\nOr leave it empty and use the [link text itself].\n\nURLs and URLs in angle brackets will automatically get turned into links.\nhttp://www.example.com or <http://www.example.com> and sometimes\nexample.com (but not on Github, for example).\n\nSome text to show that the reference links can follow later.\n\n[arbitrary case-insensitive reference text]: https://www.mozilla.org\n[1]: http://slashdot.org\n[link text itself]: http://www.reddit.com\n\n------\n\n# Images\n\n```\nHere\'s our logo (hover to see the title text):\n\nInline-style:\n![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 1")\n\nReference-style:\n![alt text][logo]\n\n[logo]: https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 2"\n\n![Minion](https://octodex.github.com/images/minion.png)\n![Stormtroopocat](https://octodex.github.com/images/stormtroopocat.jpg "The Stormtroopocat")\n\nLike links, Images also have a footnote style syntax\n\n![Alt text][id]\n\nWith a reference later in the document defining the URL location:\n\n[id]: https://octodex.github.com/images/dojocat.jpg  "The Dojocat"\n```\n\nHere\'s our logo (hover to see the title text):\n\nInline-style:\n![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 1")\n\nReference-style:\n![alt text][logo]\n\n[logo]: https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 2"\n\n![Minion](https://octodex.github.com/images/minion.png)\n![Stormtroopocat](https://octodex.github.com/images/stormtroopocat.jpg "The Stormtroopocat")\n\nLike links, Images also have a footnote style syntax\n\n![Alt text][id]\n\nWith a reference later in the document defining the URL location:\n\n[id]: https://octodex.github.com/images/dojocat.jpg  "The Dojocat"\n\n------\n\n# [Footnotes](https://github.com/markdown-it/markdown-it-footnote)\n\n```\nFootnote 1 link[^first].\n\nFootnote 2 link[^second].\n\nInline footnote^[Text of inline footnote] definition.\n\nDuplicated footnote reference[^second].\n\n[^first]: Footnote **can have markup**\n\n    and multiple paragraphs.\n\n[^second]: Footnote text.\n```\n\nFootnote 1 link[^first].\n\nFootnote 2 link[^second].\n\nInline footnote^[Text of inline footnote] definition.\n\nDuplicated footnote reference[^second].\n\n[^first]: Footnote **can have markup**\n\n    and multiple paragraphs.\n\n[^second]: Footnote text.\n\n------\n\n# Code and Syntax Highlighting\n\n```\nInline `code` has `back-ticks around` it.\n```\n\nInline `code` has `back-ticks around` it.\n\n```c#\nusing System.IO.Compression;\n\n#pragma warning disable 414, 3021\n\nnamespace MyApplication\n{\n    [Obsolete("...")]\n    class Program : IInterface\n    {\n        public static List<int> JustDoIt(int count)\n        {\n            Console.WriteLine(\$"Hello {Name}!");\n            return new List<int>(new int[] { 1, 2, 3 })\n        }\n    }\n}\n```\n\n```css\n@font-face {\n  font-family: Chunkfive; src: url(\'Chunkfive.otf\');\n}\n\nbody, .usertext {\n  color: #F0F0F0; background: #600;\n  font-family: Chunkfive, sans;\n}\n\n@import url(print.css);\n@media print {\n  a[href^=http]::after {\n    content: attr(href)\n  }\n}\n```\n\n```javascript\nfunction \$initHighlight(block, cls) {\n  try {\n    if (cls.search(/\bno\-highlight\b/) != -1)\n      return process(block, true, 0x0F) +\n             ` class="\${cls}"`;\n  } catch (e) {\n    /* handle exception */\n  }\n  for (var i = 0 / 2; i < classes.length; i++) {\n    if (checkCondition(classes[i]) === undefined)\n      console.log(\'undefined\');\n  }\n}\n\nexport  \$initHighlight;\n```\n\n```php\nrequire_once \'Zend/Uri/Http.php\';\n\nnamespace Location\Web;\n\ninterface Factory\n{\n    static function _factory();\n}\n\nabstract class URI extends BaseURI implements Factory\n{\n    abstract function test();\n\n    public static \$st1 = 1;\n    const ME = "Yo";\n    var \$list = NULL;\n    private \$var;\n\n    /**\n     * Returns a URI\n     *\n     * @return URI\n     */\n    static public function _factory(\$stats = array(), \$uri = \'http\')\n    {\n        echo __METHOD__;\n        \$uri = explode(\':\', \$uri, 0b10);\n        \$schemeSpecific = isset(\$uri[1]) ? \$uri[1] : \'\';\n        \$desc = \'Multi\nline description\';\n\n        // Security check\n        if (!ctype_alnum(\$scheme)) {\n            throw new Zend_Uri_Exception(\'Illegal scheme\');\n        }\n\n        \$this->var = 0 - self::\$st;\n        \$this->list = list(Array("1"=> 2, 2=>self::ME, 3 => \Location\Web\URI::class));\n\n        return [\n            \'uri\'   => \$uri,\n            \'value\' => null,\n        ];\n    }\n}\n\necho URI::ME . URI::\$st1;\n\n__halt_compiler () ; datahere\ndatahere\ndatahere */\ndatahere\n```\n\n------\n\n# Tables\n\n```\nColons can be used to align columns.\n\n| Tables        | Are           | Cool  |\n| ------------- |:-------------:| -----:|\n| col 3 is      | right-aligned | \$1600 |\n| col 2 is      | centered      |   \$12 |\n| zebra stripes | are neat      |    \$1 |\n\nThere must be at least 3 dashes separating each header cell.\nThe outer pipes (|) are optional, and you don\'t need to make the\nraw Markdown line up prettily. You can also use inline Markdown.\n\nMarkdown | Less | Pretty\n--- | --- | ---\n*Still* | `renders` | **nicely**\n1 | 2 | 3\n\n| First Header  | Second Header |\n| ------------- | ------------- |\n| Content Cell  | Content Cell  |\n| Content Cell  | Content Cell  |\n\n| Command | Description |\n| --- | --- |\n| git status | List all new or modified files |\n| git diff | Show file differences that haven\'t been staged |\n\n| Command | Description |\n| --- | --- |\n| `git status` | List all *new or modified* files |\n| `git diff` | Show file differences that **haven\'t been** staged |\n\n| Left-aligned | Center-aligned | Right-aligned |\n| :---         |     :---:      |          ---: |\n| git status   | git status     | git status    |\n| git diff     | git diff       | git diff      |\n\n| Name     | Character |\n| ---      | ---       |\n| Backtick | `         |\n| Pipe     | \|        |\n```\n\nColons can be used to align columns.\n\n| Tables        | Are           | Cool  |\n| ------------- |:-------------:| -----:|\n| col 3 is      | right-aligned | \$1600 |\n| col 2 is      | centered      |   \$12 |\n| zebra stripes | are neat      |    \$1 |\n\nThere must be at least 3 dashes separating each header cell.\nThe outer pipes (|) are optional, and you don\'t need to make the\nraw Markdown line up prettily. You can also use inline Markdown.\n\nMarkdown | Less | Pretty\n--- | --- | ---\n*Still* | `renders` | **nicely**\n1 | 2 | 3\n\n| First Header  | Second Header |\n| ------------- | ------------- |\n| Content Cell  | Content Cell  |\n| Content Cell  | Content Cell  |\n\n| Command | Description |\n| --- | --- |\n| git status | List all new or modified files |\n| git diff | Show file differences that haven\'t been staged |\n\n| Command | Description |\n| --- | --- |\n| `git status` | List all *new or modified* files |\n| `git diff` | Show file differences that **haven\'t been** staged |\n\n| Left-aligned | Center-aligned | Right-aligned |\n| :---         |     :---:      |          ---: |\n| git status   | git status     | git status    |\n| git diff     | git diff       | git diff      |\n\n| Name     | Character |\n| ---      | ---       |\n| Backtick | `         |\n| Pipe     | \|        |\n\n------\n\n# Blockquotes\n\n```\n> Blockquotes are very handy in email to emulate reply text.\n> This line is part of the same quote.\n\nQuote break.\n\n> This is a very long line that will still be quoted properly when it wraps. Oh boy let\'s keep writing to make sure this is long enough to actually wrap for everyone. Oh, you can *put* **Markdown** into a blockquote.\n\n> Blockquotes can also be nested...\n>> ...by using additional greater-than signs right next to each other...\n> > > ...or with spaces between arrows.\n```\n\n> Blockquotes are very handy in email to emulate reply text.\n> This line is part of the same quote.\n\nQuote break.\n\n> This is a very long line that will still be quoted properly when it wraps. Oh boy let\'s keep writing to make sure this is long enough to actually wrap for everyone. Oh, you can *put* **Markdown** into a blockquote.\n\n> Blockquotes can also be nested...\n>> ...by using additional greater-than signs right next to each other...\n> > > ...or with spaces between arrows.\n\n------\n\n# Horizontal Rules\n\n```\nThree or more...\n\n---\n\nHyphens\n\n***\n\nAsterisks\n\n___\n\nUnderscores\n```\n\nThree or more...\n\n---\n\nHyphens\n\n***\n\nAsterisks\n\n___\n\nUnderscores\n\n------\n\n# YouTube Videos\n\n```\n<a href="http://www.youtube.com/watch?feature=player_embedded&v=YOUTUBE_VIDEO_ID_HERE" target="_blank">\n<img src="http://img.youtube.com/vi/YOUTUBE_VIDEO_ID_HERE/0.jpg" alt="IMAGE ALT TEXT HERE" width="240" height="180" border="10">\n</a>\n```\n\n<a href="http://www.youtube.com/watch?feature=player_embedded&v=YOUTUBE_VIDEO_ID_HERE" target="_blank">\n<img src="http://img.youtube.com/vi/YOUTUBE_VIDEO_ID_HERE/0.jpg" alt="IMAGE ALT TEXT HERE" width="240" height="180" border="10">\n</a>\n\n```\n[![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/YOUTUBE_VIDEO_ID_HERE/0.jpg)](http://www.youtube.com/watch?v=YOUTUBE_VIDEO_ID_HERE)\n```\n\n[![IMAGE ALT TEXT HERE](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/YouTube_logo_2015.svg/1200px-YouTube_logo_2015.svg.png)](https://www.youtube.com/watch?v=ciawICBvQoE)\n\n',
        ),
      ],
    ),
    stories: [
      _i28.$Default.applyGenerated(
        name: 'Default',
        builder: (context, params) => _i29.Text(
          params.string(r'data').required('Text'),
          key: null,
          style: params
              .dynamic$<_i9.TextStyle, void, void>(r'style')
              .optional(null),
          strutStyle: params
              .dynamic$<_i30.StrutStyle, void, void>(r'strutStyle')
              .optional(null),
          textAlign: params
              .single(r'textAlign', _i31.TextAlign.values)
              .optional(null),
          textDirection: params
              .single(r'textDirection', _i31.TextDirection.values)
              .optional(null),
          locale: params
              .dynamic$<_i31.Locale, void, void>(r'locale')
              .optional(null),
          softWrap: params.boolean(r'softWrap').optional(null),
          overflow: params
              .single(r'overflow', _i32.TextOverflow.values)
              .optional(null),
          textScaleFactor: params.number(r'textScaleFactor').optional(null),
          textScaler: params
              .dynamic$<_i33.TextScaler, void, void>(r'textScaler')
              .optional(null),
          maxLines: params.integer(r'maxLines').optional(null),
          semanticsLabel: params.string(r'semanticsLabel').optional(null),
          semanticsIdentifier: params
              .string(r'semanticsIdentifier')
              .optional(null),
          textWidthBasis: params
              .single(r'textWidthBasis', _i32.TextWidthBasis.values)
              .optional(null),
          textHeightBehavior: params
              .dynamic$<_i31.TextHeightBehavior, void, void>(
                r'textHeightBehavior',
              )
              .optional(null),
          selectionColor: params.color(r'selectionColor').optional(null),
        ),
      ),
    ],
  ),
  Component(
    meta: _i34.meta,
    stories: [
      _i34.$Default.applyGenerated(
        name: 'Default',
        builder: (context, params) => _i35.UnsupportedParameters(
          key: null,
          padding: params
              .dynamic$<_i8.EdgeInsets, void, void>(r'padding')
              .default$(),
          style: params
              .dynamic$<_i9.TextStyle, void, void>(r'style')
              .default$(),
        ),
      ),
      _i34.$WithBuilder.applyGenerated(
        name: 'With Builder',
        builder: (context, params) => _i35.UnsupportedParameters(
          key: null,
          padding: params
              .dynamic$<_i8.EdgeInsets, void, void>(r'padding')
              .default$(),
          style: params
              .dynamic$<_i9.TextStyle, void, void>(r'style')
              .default$(),
        ),
      ),
      _i34.$WithParams.applyGenerated(
        name: 'With Params',
        builder: (context, params) => _i35.UnsupportedParameters(
          key: null,
          padding: params
              .dynamic$<_i8.EdgeInsets, void, void>(r'padding')
              .default$(),
          style: params
              .dynamic$<_i9.TextStyle, void, void>(r'style')
              .default$(),
        ),
      ),
    ],
  ),
  Component(
    meta: _i36.meta,
    stories: [
      _i36.$Default.applyGenerated(
        name: 'Default',
        builder: (context, params) => _i37.WithEnum(
          key: null,
          enumValue: params
              .single(r'enumValue', _i38.SomeEnum.values)
              .required(_i38.SomeEnum.values.first),
        ),
      ),
    ],
  ),
];
