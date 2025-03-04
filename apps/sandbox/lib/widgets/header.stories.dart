import 'package:flutter/material.dart';
import 'package:vibook_core/decorator.dart';
import 'package:vibook_core/meta.dart';
import 'package:vibook_core/story.dart';
import 'package:vibook_sandbox/widgets/header.dart';

Meta get meta => Meta<Header>(
      name: '02. Very Long Name for Header', // optional
      module: 'Features / 01. Core',
      component: Header, // optional
      parameters: {
        "golden": true,
      },
      decorators: [
        Decorator(
          (context, story) => Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceBright,
              borderRadius: BorderRadius.circular(8),
            ),
            child: story,
          ),
        ),
        Decorator(
          (context, story) => Padding(
            padding: const EdgeInsets.all(16),
            child: story,
          ),
        ),
      ],
    );

Story get $Default => Story(
      name: 'Default',
      builder: (context, params) {
        return const Header();
      },
    );
