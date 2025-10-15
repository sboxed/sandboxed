import 'package:flutter/material.dart';
import 'package:sandboxed_core/sandboxed_core.dart';
import 'package:sandboxed_sandbox/widgets/diagrams/card.dart';

final meta = Meta<SandboxDiagramCard>(
  name: '02. Diagram Card', // optional
  module: 'Features / 02. Diagrams',
  component: SandboxDiagramCard, // optional
  parameters: {"golden": true, "fullpage": true},
  decorators: [
    Decorator(
      (context, story) => Padding(padding: const EdgeInsets.all(16), child: story),
    ),
  ],
);

Story get $Green => Story(
  name: 'Green',
  builder: (context, params) {
    return SandboxDiagramCard(
      title: params.string('title').required("Lorem"),
      color: params.color('color').required(Colors.green),
      stats: params.multi('stats', SandboxDiagramCardStats.values).required([]),
    );
  },
);

Story get $Blue => Story(
  name: 'Blue',
  builder: (context, params) {
    return SandboxDiagramCard(
      title: params.string('title').required("Lorem"),
      color: params.color('color').required(Colors.blue),
      stats: params.multi('stats', SandboxDiagramCardStats.values).required([]),
    );
  },
);
