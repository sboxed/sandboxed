// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_visible_for_testing_member, unused_import, duplicate_import, unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:sandboxed_ui_kit/src/widgets/tags/tag_chip.stories.dart' as _i1;
import 'package:sandboxed_ui_kit/stories/config.dart' as _i2;
import 'package:sandboxed_ui_kit/src/widgets/tags/tag_chip.dart' as _i3;
import 'package:flutter/src/foundation/key.dart' as _i4;
import 'package:flutter/src/widgets/framework.dart' as _i5;
import 'package:sandboxed_ui_kit/src/widgets/tiles/element_tile.stories.dart'
    as _i6;
import 'package:sandboxed_ui_kit/src/widgets/tiles/element_tile.dart' as _i7;
import 'dart:ui' as _i8;
import 'package:sandboxed_ui_kit/src/widgets/layout/sb_drawer.stories.dart'
    as _i9;
import 'package:sandboxed_ui_kit/src/widgets/layout/sb_drawer.dart' as _i10;
import 'package:sandboxed_ui_kit/src/layout/responsive_layout.stories.dart'
    as _i11;
import 'package:sandboxed_ui_kit/src/layout/responsive_layout.dart' as _i12;
import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:flutter/material.dart';

List<Component> get components => <Component>[
      Component(
        meta: _i1.meta,
        config: _i2.config,
        stories: [
          _i1.$Default.applyGenerated(
            name: 'Default',
            builder: (
              context,
              params,
            ) =>
                _i3.TagChip(
              key: params.dynamic$<_i4.Key>(r'key').optional(null),
              tag: params
                  .dynamic$<_i5.Widget>(r'tag')
                  .required(const SizedBox.shrink()),
              color: params.color(r'color').optional(null),
            ),
          ),
          _i1.$InTile.applyGenerated(
            name: 'In Tile',
            builder: (
              context,
              params,
            ) =>
                _i3.TagChip(
              key: params.dynamic$<_i4.Key>(r'key').optional(null),
              tag: params
                  .dynamic$<_i5.Widget>(r'tag')
                  .required(const SizedBox.shrink()),
              color: params.color(r'color').optional(null),
            ),
          ),
        ],
      ),
      Component(
        meta: _i6.meta,
        config: _i2.config,
        stories: [
          _i6.$Default.applyGenerated(
            name: 'Default',
            builder: (
              context,
              params,
            ) =>
                _i7.ElementTile(
              key: params.dynamic$<_i4.Key>(r'key').optional(null),
              depth: params.integer(r'depth').required(1),
              onPressed: params
                  .dynamic$<_i8.VoidCallback>(r'onPressed')
                  .optional(null),
              tooltip: params.string(r'tooltip').required(''),
              selected: params.boolean(r'selected').required(false),
              size: params
                  .single(
                    r'size',
                    _i7.ElementTileSize.values,
                  )
                  .required(_i7.ElementTileSize.small),
              icon: params.dynamic$<_i5.Widget>(r'icon').optional(null),
              title: params
                  .dynamic$<_i5.Widget>(r'title')
                  .required(const SizedBox.shrink()),
            ),
          ),
          _i6.$Tree.applyGenerated(
            name: 'Tree',
            builder: (
              context,
              params,
            ) =>
                _i7.ElementTile(
              key: params.dynamic$<_i4.Key>(r'key').optional(null),
              depth: params.integer(r'depth').required(1),
              onPressed: params
                  .dynamic$<_i8.VoidCallback>(r'onPressed')
                  .optional(null),
              tooltip: params.string(r'tooltip').required(''),
              selected: params.boolean(r'selected').required(false),
              size: params
                  .single(
                    r'size',
                    _i7.ElementTileSize.values,
                  )
                  .required(_i7.ElementTileSize.small),
              icon: params.dynamic$<_i5.Widget>(r'icon').optional(null),
              title: params
                  .dynamic$<_i5.Widget>(r'title')
                  .required(const SizedBox.shrink()),
            ),
          ),
        ],
      ),
      Component(
        meta: _i9.meta,
        config: _i2.config,
        stories: [
          _i9.$Drawer.applyGenerated(
            name: 'Drawer',
            builder: (
              context,
              params,
            ) =>
                _i10.SBDrawer(
              key: params.dynamic$<_i4.Key>(r'key').optional(null),
              title: params
                  .dynamic$<_i5.Widget>(r'title')
                  .required(const SizedBox.shrink()),
              actions: params.dynamic$<List<Widget>>(r'actions').required([]),
              body: params
                  .dynamic$<_i5.Widget>(r'body')
                  .required(const SizedBox.shrink()),
            ),
          )
        ],
      ),
      Component(
        meta: _i11.meta,
        config: _i2.config,
        stories: [
          _i11.$Default.applyGenerated(
            name: 'Default',
            builder: (
              context,
              params,
            ) =>
                _i12.ResponsiveLayout(
              key: params.dynamic$<_i4.Key>(r'key').optional(null),
              drawer: params
                  .dynamic$<_i5.Widget>(r'drawer')
                  .required(const SizedBox.shrink()),
              viewport: params
                  .dynamic$<_i5.Widget>(r'viewport')
                  .required(const SizedBox.shrink()),
              sidebar: params.dynamic$<_i5.Widget>(r'sidebar').optional(null),
            ),
          )
        ],
      ),
    ];
