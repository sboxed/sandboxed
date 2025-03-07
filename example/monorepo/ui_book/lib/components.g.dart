// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_visible_for_testing_member, unused_import, duplicate_import, unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

import 'package:vibook_core/vibook_core.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/button.stories.dart' as button;
import 'package:ui_kit/button.dart';

List<Component> get components => <Component>[
      Component(
        meta: button.meta,
        stories: [
          button.$Green.applyGenerated(
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
                      Text('Parameter `size` of type [ButtonSize]'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          button.$Blue.applyGenerated(
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
                      Text('Parameter `size` of type [ButtonSize]'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    ];
