import 'package:flutter/material.dart';
import 'package:vibook_sandbox/widgets/button.dart';

class AutomaticGeneration extends StatelessWidget {
  final String text;
  final Color color;
  final bool hasIcon;
  final VoidCallback? unsupported;

  const AutomaticGeneration({
    super.key,
    required this.text,
    this.hasIcon = true,
    this.color = Colors.yellow,
    this.unsupported,
  });

  @override
  Widget build(BuildContext context) {
    return ViButton(
      title: text,
      color: color,
      onPressed: unsupported,
      icon: hasIcon ? const Icon(Icons.ac_unit) : null,
    );
  }
}
