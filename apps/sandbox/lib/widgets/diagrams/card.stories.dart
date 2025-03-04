import 'package:flutter/material.dart';
import 'package:vibook/addons/param_builders/base_param_builders/single_chips_param_builder.dart';
import 'package:vibook_core/decorator.dart';
import 'package:vibook_core/meta.dart';
import 'package:vibook_core/story.dart';
import 'package:vibook_sandbox/widgets/diagrams/card.dart';

final meta = Meta<ViDiagramCard>(
  name: '02. Diagram Card', // optional
  module: 'Features / 02. Diagrams',
  component: ViDiagramCard, // optional
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
        return ViDiagramCard(
          title: params.string('title', "Lorem"),
          color: params.color('color', Colors.green),
          stats: params.multi(
            'stats',
            [],
            ViDiagramCardStats.values,
            ChipsType(),
          ),
        );
      },
    );

Story get $Blue => Story(
      name: 'Blue',
      builder: (context, params) {
        return ViDiagramCard(
          title: params.string('title', "Lorem"),
          color: params.color('color', Colors.blue),
          stats: params.multi(
            'stats',
            [],
            ViDiagramCardStats.values,
            ChipsType(),
          ),
        );
      },
    );
