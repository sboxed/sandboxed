import 'package:flutter/material.dart';
import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:sandboxed_sandbox/widgets/button.dart';

Meta get meta2 => Meta<SandboxButton>(
  name: '01. Other Format Examples', // optional
  module: '_Meta',
  component: SandboxButton, // optional
  parameters: {"golden": true, "fullpage": false},
  decorators: [
    Decorator(
      (context, story) => Padding(padding: const EdgeInsets.all(16), child: story),
    ),
  ],
);

final $Green = Story(
  name: 'Green',
  builder: (context, params) {
    return SandboxButton(
      onPressed: () {},
      title: params.string('title').required("Lorem"),
      color: params.color('color').required(Colors.green),
      size: params.single('size', SandboxButtonSize.values).required(SandboxButtonSize.small),
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
      icon: params.boolean('has_icon').required(false) ? const Icon(Icons.check, color: Colors.white) : null,
    );
  },
);
