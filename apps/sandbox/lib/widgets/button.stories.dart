import 'package:flutter/material.dart';
import 'package:vibook/addons/param_builders/base_param_builders/single_chips_param_builder.dart';
import 'package:vibook_core/decorator.dart';
import 'package:vibook_core/meta.dart';
import 'package:vibook_core/story.dart';
import 'package:vibook_sandbox/widgets/button.dart';

Meta get meta => Meta<ViButton>(
      name: '01. Button', // optional
      module: 'Features / 01. Core',
      component: ViButton, // optional
      parameters: {
        "golden": true,
        "fullpage": false,
      },
      decorators: [
        Decorator(
          (context, story) => Padding(
            padding: const EdgeInsets.all(16),
            child: story,
          ),
        ),
      ],
    );

Story get $Green => Story(
      name: 'Green',
      builder: (context, params) {
        return ViButton(
          title: params.string('title', "Lorem"),
          color: params.color('color', Colors.green),
          size: params.single(
            'size',
            ViButtonSize.small,
            ViButtonSize.values,
            ChipsType(),
          ),
        );
      },
    );

Story get $Blue => Story(
      name: 'Blue',
      builder: (context, params) {
        return ViButton(
          title: params.string('title', "Lorem"),
          color: params.color('color', Colors.blue),
          icon: params.boolean('has_icon', false)
              ? const Icon(Icons.check, color: Colors.white)
              : null,
        );
      },
    );
