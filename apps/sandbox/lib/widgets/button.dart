import 'package:flutter/material.dart';

enum ViButtonSize {
  small,
  medium,
}

class ViButton extends StatelessWidget {
  final String title;
  final Widget? icon;
  final Color? color;
  final ViButtonSize size;
  final VoidCallback? onPressed;

  const ViButton({
    super.key,
    required this.title,
    required this.color,
    this.size = ViButtonSize.small,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: switch (size) {
        ViButtonSize.small => 32,
        ViButtonSize.medium => 48,
      },
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Colors.green,
          foregroundColor: Colors.white,
        ),
        child: Row(
          children: [
            if (icon case Widget icon) ...[
              icon,
              const SizedBox(width: 8),
            ],
            Text(title),
          ],
        ),
      ),
    );
  }
}
