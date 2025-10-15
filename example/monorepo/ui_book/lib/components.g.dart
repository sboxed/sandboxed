// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_visible_for_testing_member, unused_import, duplicate_import, unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ui_kit/button.stories.dart' as _i1;
import 'package:ui_kit/stories/config.dart' as _i2;
import 'package:ui_kit/button.dart' as _i3;
import 'package:flutter/src/widgets/framework.dart' as _i4;
import 'package:products/favorite_button.stories.dart' as _i5;
import 'package:products/favorite_button.dart' as _i6;
import 'package:ui_kit/heading.stories.dart' as _i7;
import 'package:ui_kit/heading.dart' as _i8;
import 'package:products/product_card.stories.dart' as _i9;
import 'package:products/product_card.dart' as _i10;
import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:flutter/material.dart';

List<Component> get components => <Component>[
  Component(
    meta: _i1.meta,
    config: _i2.config,
    stories: [
      _i1.$Blue.applyGenerated(
        name: 'Blue',
        builder: (context, params) => _i3.Button.new(
          key: null,
          text: params.string(r'text').required('Text'),
          size: params
              .single(r'size', _i3.ButtonSize.values)
              .required(_i3.ButtonSize.medium),
          color: params.color(r'color').required(Colors.green),
          icon: params
              .any<_i4.Widget>(r'icon')
              .editor(ParamEditor<_i4.Widget>())
              .optional(null),
        ),
      ),
      _i1.$Green.applyGenerated(
        name: 'Green',
        builder: (context, params) => _i3.Button.new(
          key: null,
          text: params.string(r'text').required('Text'),
          size: params
              .single(r'size', _i3.ButtonSize.values)
              .required(_i3.ButtonSize.medium),
          color: params.color(r'color').required(Colors.green),
          icon: params
              .any<_i4.Widget>(r'icon')
              .editor(ParamEditor<_i4.Widget>())
              .optional(null),
        ),
      ),
    ],
  ),
  Component(
    meta: _i5.meta,
    config: Config(module: 'Features/Products'),
    stories: [
      _i5.$Default.applyGenerated(
        name: 'Default',
        builder: (context, params) => _i6.FavoriteButton.new(key: null),
      ),
    ],
  ),
  Component(
    meta: _i7.meta,
    config: _i2.config,
    stories: [
      _i7.$Default.applyGenerated(
        name: 'Default',
        builder: (context, params) => _i8.Heading.new(key: null),
      ),
    ],
  ),
  Component(
    meta: _i9.meta,
    config: Config(module: 'Features/Products'),
    stories: [
      _i9.$Default.applyGenerated(
        name: 'Default',
        builder: (context, params) => _i10.ProductCard.new(key: null),
      ),
    ],
  ),
];
