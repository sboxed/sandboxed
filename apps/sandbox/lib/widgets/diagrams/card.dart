import 'package:flutter/material.dart';

class ViDiagramCard extends StatelessWidget {
  final String title;
  final Color? color;

  const ViDiagramCard({
    super.key,
    required this.title,
    required this.color,
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
        ],
      ),
    );
  }
}
