import 'package:flutter/material.dart';
import 'package:vibook_core/decorator.dart';
import 'package:vibook_core/meta.dart';
import 'package:vibook_core/story.dart';
import 'package:vibook_sandbox/widgets/diagrams/button.dart';

final meta = Meta<ViDiagramButton>(
  name: 'Buttons / 01. Diagram Button', // optional
  module: 'Features / 02. Diagrams',
  component: ViDiagramButton, // optional
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
        return ViDiagramButton(
          title: params.string('title', "Lorem"),
          color: params.color('color', Colors.green),
        );
      },
    );

Story get $Blue => Story(
      name: 'Blue',
      builder: (context, params) {
        return ViDiagramButton(
          title: params.string('title', "Lorem"),
          color: params.color('color', Colors.blue),
        );
      },
    );
