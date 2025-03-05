import 'package:flutter/material.dart';

enum ButtonSize { small, medium, large }

class Button extends StatelessWidget {
  final String text;
  final Color color;
  final ButtonSize size;
  final Widget? icon;

  const Button({
    super.key,
    required this.text,
    this.size = ButtonSize.medium,
    this.color = Colors.green,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: switch (size) {
        ButtonSize.small => 24,
        ButtonSize.medium => 32,
        ButtonSize.large => 42,
      },
      child: FilledButton.icon(
        onPressed: () {},
        icon: icon,
        label: Text('sdf'),
        style: FilledButton.styleFrom(backgroundColor: color),
      ),
    );
  }
}
