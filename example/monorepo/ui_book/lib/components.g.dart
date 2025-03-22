// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_visible_for_testing_member, unused_import, duplicate_import, unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:products/product_card.stories.dart' as _i1;
import 'package:products/product_card.dart' as _i2;
import 'package:products/favorite_button.stories.dart' as _i3;
import 'package:products/favorite_button.dart' as _i4;
import 'package:sandboxed_ui_kit/src/widgets/tags/tag_chip.stories.dart' as _i5;
import 'package:sandboxed_ui_kit/stories/config.dart' as _i6;
import 'package:sandboxed_ui_kit/src/widgets/tags/tag_chip.dart' as _i7;
import 'package:sandboxed_ui_kit/src/widgets/tiles/element_tile.stories.dart'
    as _i8;
import 'package:sandboxed_ui_kit/src/widgets/tiles/element_tile.dart' as _i9;
import 'package:sandboxed_ui_kit/src/widgets/layout/sb_drawer.stories.dart'
    as _i10;
import 'package:sandboxed_ui_kit/src/widgets/layout/sb_drawer.dart' as _i11;
import 'package:sandboxed_ui_kit/src/layout/responsive_layout.stories.dart'
    as _i12;
import 'package:sandboxed_ui_kit/src/layout/responsive_layout.dart' as _i13;
import 'package:ui_kit/button.stories.dart' as _i14;
import 'package:ui_kit/stories/config.dart' as _i15;
import 'package:ui_kit/button.dart' as _i16;
import 'package:ui_kit/heading.stories.dart' as _i17;
import 'package:ui_kit/heading.dart' as _i18;
import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:flutter/material.dart';

List<Component> get components => <Component>[
      Component(
        meta: _i1.meta,
        config: Config(module: 'Features/Products'),
        stories: [
          _i1.$Default.applyGenerated(
            name: 'Default',
            builder: (
              context,
              params,
            ) =>
                _i2.ProductCard(
                    key: params.dynamic$<Key>(r'key').optional(null)),
          )
        ],
      ),
      Component(
        meta: _i3.meta,
        config: Config(module: 'Features/Products'),
        stories: [
          _i3.$Default.applyGenerated(
            name: 'Default',
            builder: (
              context,
              params,
            ) =>
                _i4.FavoriteButton(
                    key: params.dynamic$<Key>(r'key').optional(null)),
          )
        ],
      ),
      Component(
        meta: _i5.meta,
        config: _i6.config,
        stories: [
          _i5.$Default.applyGenerated(
            name: 'Default',
            builder: (
              context,
              params,
            ) =>
                _i7.TagChip(
              key: params.dynamic$<Key>(r'key').optional(null),
              tag: params
                  .dynamic$<Widget>(r'tag')
                  .required(const SizedBox.shrink()),
              color: params.color(r'color').optional(null),
            ),
          ),
          _i5.$InTile.applyGenerated(
            name: 'In Tile',
            builder: (
              context,
              params,
            ) =>
                _i7.TagChip(
              key: params.dynamic$<Key>(r'key').optional(null),
              tag: params
                  .dynamic$<Widget>(r'tag')
                  .required(const SizedBox.shrink()),
              color: params.color(r'color').optional(null),
            ),
          ),
        ],
      ),
      Component(
        meta: _i8.meta,
        config: _i6.config,
        stories: [
          _i8.$Default.applyGenerated(
            name: 'Default',
            builder: (
              context,
              params,
            ) =>
                _i9.ElementTile(
              key: params.dynamic$<Key>(r'key').optional(null),
              depth: params.integer(r'depth').required(1),
              onPressed:
                  params.dynamic$<void Function()>(r'onPressed').optional(null),
              tooltip: params.string(r'tooltip').required(''),
              selected: params.boolean(r'selected').required(false),
              size: params
                  .single(
                    r'size',
                    _i9.ElementTileSize.values,
                  )
                  .required(_i9.ElementTileSize.small),
              icon: params.dynamic$<Widget>(r'icon').optional(null),
              title: params
                  .dynamic$<Widget>(r'title')
                  .required(const SizedBox.shrink()),
            ),
          ),
          _i8.$Tree.applyGenerated(
            name: 'Tree',
            builder: (
              context,
              params,
            ) =>
                _i9.ElementTile(
              key: params.dynamic$<Key>(r'key').optional(null),
              depth: params.integer(r'depth').required(1),
              onPressed:
                  params.dynamic$<void Function()>(r'onPressed').optional(null),
              tooltip: params.string(r'tooltip').required(''),
              selected: params.boolean(r'selected').required(false),
              size: params
                  .single(
                    r'size',
                    _i9.ElementTileSize.values,
                  )
                  .required(_i9.ElementTileSize.small),
              icon: params.dynamic$<Widget>(r'icon').optional(null),
              title: params
                  .dynamic$<Widget>(r'title')
                  .required(const SizedBox.shrink()),
            ),
          ),
        ],
      ),
      Component(
        meta: _i10.meta,
        config: _i6.config,
        stories: [
          _i10.$Drawer.applyGenerated(
            name: 'Drawer',
            builder: (
              context,
              params,
            ) =>
                _i11.SBDrawer(
              key: params.dynamic$<Key>(r'key').optional(null),
              title: params
                  .dynamic$<Widget>(r'title')
                  .required(const SizedBox.shrink()),
              actions: params.dynamic$<List<Widget>>(r'actions').required([]),
              body: params
                  .dynamic$<Widget>(r'body')
                  .required(const SizedBox.shrink()),
            ),
          )
        ],
      ),
      Component(
        meta: _i12.meta,
        config: _i6.config,
        stories: [
          _i12.$Default.applyGenerated(
            name: 'Default',
            builder: (
              context,
              params,
            ) =>
                _i13.ResponsiveLayout(
              key: params.dynamic$<Key>(r'key').optional(null),
              drawer: params
                  .dynamic$<Widget>(r'drawer')
                  .required(const SizedBox.shrink()),
              viewport: params
                  .dynamic$<Widget>(r'viewport')
                  .required(const SizedBox.shrink()),
              sidebar: params.dynamic$<Widget>(r'sidebar').optional(null),
            ),
          )
        ],
      ),
      Component(
        meta: _i14.meta,
        config: _i15.config,
        stories: [
          _i14.$Green.applyGenerated(
            name: 'Green',
            builder: (
              context,
              params,
            ) =>
                _i16.Button(
              key: params.dynamic$<Key>(r'key').optional(null),
              text: params.string(r'text').required('Text'),
              size: params
                  .single(
                    r'size',
                    _i16.ButtonSize.values,
                  )
                  .required(_i16.ButtonSize.medium),
              color: params.color(r'color').required(Colors.green),
              icon: params.dynamic$<Widget>(r'icon').optional(null),
            ),
          ),
          _i14.$Blue.applyGenerated(
            name: 'Blue',
            builder: (
              context,
              params,
            ) =>
                _i16.Button(
              key: params.dynamic$<Key>(r'key').optional(null),
              text: params.string(r'text').required('Text'),
              size: params
                  .single(
                    r'size',
                    _i16.ButtonSize.values,
                  )
                  .required(_i16.ButtonSize.medium),
              color: params.color(r'color').required(Colors.green),
              icon: params.dynamic$<Widget>(r'icon').optional(null),
            ),
          ),
        ],
      ),
      Component(
        meta: _i17.meta,
        config: _i15.config,
        stories: [
          _i17.$Default.applyGenerated(
            name: 'Default',
            builder: (
              context,
              params,
            ) =>
                _i18.Heading(key: params.dynamic$<Key>(r'key').optional(null)),
          )
        ],
      ),
    ];
