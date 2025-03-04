import 'package:flutter/material.dart';
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
      builder: (context, knobs) {
        return ViButton(
          title: knobs.string('title', "Lorem"),
          color: knobs.color('color', Colors.green),
        );
      },
    );

Story get $Blue => Story(
      name: 'Blue',
      builder: (context, knobs) {
        return ViButton(
          title: knobs.string('title', "Lorem"),
          color: knobs.color('color', Colors.blue),
        );
      },
    );
