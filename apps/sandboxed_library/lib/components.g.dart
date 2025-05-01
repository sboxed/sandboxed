// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_visible_for_testing_member, unused_import, duplicate_import, unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:sandboxed_ui_kit/src/widgets/tiles/element_tile.stories.dart'
    as _i1;
import 'package:sandboxed_ui_kit/stories/config.dart' as _i2;
import 'package:sandboxed_ui_kit/src/widgets/tiles/element_tile.dart' as _i3;
import 'package:flutter/src/widgets/framework.dart' as _i4;
import 'package:sandboxed_ui_kit/src/layout/responsive_layout.stories.dart'
    as _i5;
import 'package:sandboxed_ui_kit/src/layout/responsive_layout.dart' as _i6;
import 'package:sandboxed_ui_kit/src/widgets/layout/sb_drawer.stories.dart'
    as _i7;
import 'package:sandboxed_ui_kit/src/widgets/layout/sb_drawer.dart' as _i8;
import 'package:sandboxed_ui_kit/src/widgets/tags/tag_chip.stories.dart' as _i9;
import 'package:sandboxed_ui_kit/src/widgets/tags/tag_chip.dart' as _i10;
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
                _i3.ElementTile(
              key: null,
              depth: params.integer(r'depth').required(1),
              onPressed: params
                  .dynamic$<void Function(), void, void>(r'onPressed')
                  .optional(null),
              tooltip: params.string(r'tooltip').required(''),
              selected: params.boolean(r'selected').required(false),
              size: params
                  .single(
                    r'size',
                    _i3.ElementTileSize.values,
                  )
                  .required(_i3.ElementTileSize.small),
              icon: params
                  .dynamic$<_i4.Widget, void, void>(r'icon')
                  .optional(null),
              title: params
                  .dynamic$<_i4.Widget, void, void>(r'title')
                  .required(const SizedBox.shrink()),
            ),
          ),
          _i1.$Tree.applyGenerated(
            name: 'Tree',
            builder: (
              context,
              params,
            ) =>
                _i3.ElementTile(
              key: null,
              depth: params.integer(r'depth').required(1),
              onPressed: params
                  .dynamic$<void Function(), void, void>(r'onPressed')
                  .optional(null),
              tooltip: params.string(r'tooltip').required(''),
              selected: params.boolean(r'selected').required(false),
              size: params
                  .single(
                    r'size',
                    _i3.ElementTileSize.values,
                  )
                  .required(_i3.ElementTileSize.small),
              icon: params
                  .dynamic$<_i4.Widget, void, void>(r'icon')
                  .optional(null),
              title: params
                  .dynamic$<_i4.Widget, void, void>(r'title')
                  .required(const SizedBox.shrink()),
            ),
          ),
        ],
      ),
      Component(
        meta: _i5.meta,
        config: _i2.config,
        stories: [
          _i5.$Default.applyGenerated(
            name: 'Default',
            builder: (
              context,
              params,
            ) =>
                _i6.ResponsiveLayout(
              key: null,
              drawer: params
                  .dynamic$<_i4.Widget, void, void>(r'drawer')
                  .required(const SizedBox.shrink()),
              viewport: params
                  .dynamic$<_i4.Widget, void, void>(r'viewport')
                  .required(const SizedBox.shrink()),
              sidebar: params
                  .dynamic$<_i4.Widget, void, void>(r'sidebar')
                  .optional(null),
            ),
          )
        ],
      ),
      Component(
        meta: _i7.meta,
        config: _i2.config,
        stories: [
          _i7.$Drawer.applyGenerated(
            name: 'Drawer',
            builder: (
              context,
              params,
            ) =>
                _i8.SBDrawer(
              key: null,
              title: params
                  .dynamic$<_i4.Widget, void, void>(r'title')
                  .required(const SizedBox.shrink()),
              actions: params
                  .dynamic$<List<_i4.Widget>, _i4.Widget, void>(r'actions')
                  .required([]),
              body: params
                  .dynamic$<_i4.Widget, void, void>(r'body')
                  .required(const SizedBox.shrink()),
            ),
          )
        ],
      ),
      Component(
        meta: _i9.meta,
        config: _i2.config,
        stories: [
          _i9.$Default.applyGenerated(
            name: 'Default',
            builder: (
              context,
              params,
            ) =>
                _i10.TagChip(
              key: null,
              tag: params
                  .dynamic$<_i4.Widget, void, void>(r'tag')
                  .required(const SizedBox.shrink()),
              color: params.color(r'color').optional(null),
            ),
          ),
          _i9.$InTile.applyGenerated(
            name: 'In Tile',
            builder: (
              context,
              params,
            ) =>
                _i10.TagChip(
              key: null,
              tag: params
                  .dynamic$<_i4.Widget, void, void>(r'tag')
                  .required(const SizedBox.shrink()),
              color: params.color(r'color').optional(null),
            ),
          ),
        ],
      ),
    ];
