import 'package:flutter/material.dart';
import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:sandboxed_sandbox/widgets/diagrams/button.dart';

final meta = Meta<SandboxDiagramButton>(
  name: 'Buttons / 01. Diagram Button', // optional
  module: 'Features / 02. Diagrams',
  component: SandboxDiagramButton, // optional
  parameters: {
    "golden": true,
    "fullpage": true,
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
        return SandboxDiagramButton(
          title: params.string('title').required("Lorem"),
          color: params.color('color').required(Colors.green),
        );
      },
    );

Story get $Blue => Story(
      name: 'Blue',
      builder: (context, params) {
        return SandboxDiagramButton(
          title: params.string('title').required("Lorem"),
          color: params.color('color').required(Colors.blue),
        );
      },
    );
