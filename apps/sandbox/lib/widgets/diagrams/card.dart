import 'dart:math';

import 'package:flutter/material.dart';

enum SandboxDiagramCardStats {
  max,
  total,
}

class SandboxDiagramCard extends StatelessWidget {
  final String title;
  final Color? color;
  final List<SandboxDiagramCardStats> stats;

  const SandboxDiagramCard({
    super.key,
    required this.title,
    required this.color,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ?? Colors.green,
      child: Row(
        children: [
          const Icon(Icons.touch_app),
          const SizedBox(width: 8),
          Text(title),
          for (final stat in stats) //
            Text('${stat.name}: ${Random().nextDouble() * 1000}')
        ],
      ),
    );
  }
}
