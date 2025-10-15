import 'package:flutter/material.dart';

enum SandboxButtonSize { small, medium }

class SandboxButton extends StatelessWidget {
  final String title;
  final Widget? icon;
  final Color? color;
  final SandboxButtonSize size;
  final VoidCallback? onPressed;

  const SandboxButton({
    super.key,
    required this.title,
    required this.color,
    this.size = SandboxButtonSize.small,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: switch (size) {
        SandboxButtonSize.small => 32,
        SandboxButtonSize.medium => 48,
      },
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Colors.green,
          foregroundColor: Colors.white,
        ),
        child: Row(
          children: [
            if (icon case Widget icon) ...[icon, const SizedBox(width: 8)],
            Text(title),
          ],
        ),
      ),
    );
  }
}
