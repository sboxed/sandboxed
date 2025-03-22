import 'package:flutter/material.dart';
import 'package:sandboxed_core/decorator.dart';
import 'package:sandboxed_core/meta.dart';
import 'package:sandboxed_core/story.dart';
import 'package:sandboxed_sandbox/widgets/button.dart';

Meta get meta => Meta<SandboxButton>(
      name: '01. Button', // optional
      module: 'Features / 01. Core',
      component: SandboxButton, // optional
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
        return SandboxButton(
          onPressed: () {},
          title: params.string('title').required("Lorem"),
          color: params.color('color').required(Colors.green),
          size: params
              .single('size', SandboxButtonSize.values)
              .required(SandboxButtonSize.small),
        );
      },
    );

Story get $Blue => Story(
      name: 'Blue',
      builder: (context, params) {
        return SandboxButton(
          onPressed: () {},
          title: params.string('title').required("Lorem"),
          color: params.color('color').required(Colors.blue),
          icon: params.boolean('has_icon').required(false)
              ? const Icon(Icons.check, color: Colors.white)
              : null,
        );
      },
    );

Story get $Yellow => Story(
      name: 'Yellow',
      builder: (context, params) {
        return SandboxButton(
          onPressed: () {},
          title: params.string('title').required("Lorem"),
          color: params.color('color').required(Colors.yellow),
          icon: params.boolean('has_icon').required(false)
              ? const Icon(Icons.check, color: Colors.white)
              : null,
          size: params
                  .multi('size', SandboxButtonSize.values)
                  .required([SandboxButtonSize.small]).firstOrNull ??
              SandboxButtonSize.small,
        );
      },
    );
