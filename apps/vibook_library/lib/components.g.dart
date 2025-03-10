// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_visible_for_testing_member, unused_import, duplicate_import, unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vibook_ui_kit/src/widgets/tags/tag_chip.stories.dart' as _i1;
import 'package:vibook_ui_kit/stories/config.dart' as _i2;
import 'package:vibook_ui_kit/src/widgets/tags/tag_chip.dart' as _i3;
import 'package:vibook_ui_kit/src/widgets/tiles/element_tile.stories.dart'
    as _i4;
import 'package:vibook_ui_kit/src/widgets/tiles/element_tile.dart' as _i5;
import 'package:vibook_core/vibook_core.dart';
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
              key: params.dynamic$<Key>(r'key').optional(null),
              tag: params
                  .dynamic$<Widget>(r'tag')
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
        meta: _i4.meta,
        config: _i2.config,
        stories: [
          _i4.$Default.applyGenerated(
            name: 'Default',
            builder: (
              context,
              params,
            ) =>
                _i5.ElementTile(
              key: params.dynamic$<Key>(r'key').optional(null),
              depth: params.integer(r'depth').required(1),
              onPressed:
                  params.dynamic$<void Function()>(r'onPressed').optional(null),
              tooltip: params.string(r'tooltip').required(''),
              selected: params.boolean(r'selected').required(false),
              size: params
                  .single(
                    r'size',
                    _i5.ElementTileSize.values,
                  )
                  .required(_i5.ElementTileSize.small),
              icon: params.dynamic$<Widget>(r'icon').optional(null),
              title: params
                  .dynamic$<Widget>(r'title')
                  .required(const SizedBox.shrink()),
            ),
          ),
          _i4.$Tree.applyGenerated(
            name: 'Tree',
            builder: (
              context,
              params,
            ) =>
                _i5.ElementTile(
              key: params.dynamic$<Key>(r'key').optional(null),
              depth: params.integer(r'depth').required(1),
              onPressed:
                  params.dynamic$<void Function()>(r'onPressed').optional(null),
              tooltip: params.string(r'tooltip').required(''),
              selected: params.boolean(r'selected').required(false),
              size: params
                  .single(
                    r'size',
                    _i5.ElementTileSize.values,
                  )
                  .required(_i5.ElementTileSize.small),
              icon: params.dynamic$<Widget>(r'icon').optional(null),
              title: params
                  .dynamic$<Widget>(r'title')
                  .required(const SizedBox.shrink()),
            ),
          ),
        ],
      ),
    ];
