import 'package:flutter/material.dart';

class SandboxDiagramButton extends StatelessWidget {
  final String title;
  final Color? color;

  const SandboxDiagramButton({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(backgroundColor: color ?? Colors.green, foregroundColor: Colors.white),
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
