import 'package:flutter/material.dart';
import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:sandboxed_sandbox/widgets/header.dart';

Meta get meta => Meta<Header>(
      name: '02. Very long component name for Header component', // optional
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
