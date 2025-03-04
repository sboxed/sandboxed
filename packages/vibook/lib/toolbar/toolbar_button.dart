import 'package:flutter/material.dart';

class ToolbarTooltip {
  const ToolbarTooltip({this.message, this.richMessage})
      : assert(
          message != null || richMessage != null,
          'One of [message] or [richMessage] should be provided',
        );

  final String? message;
  final InlineSpan? richMessage;
}

class ToolbarButton extends StatelessWidget {
  const ToolbarButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.tooltip,
  });

  final Widget child;
  final ToolbarTooltip? tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final button = TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: const Size.square(28),
        maximumSize: const Size.fromHeight(28),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        alignment: Alignment.center,
      ).copyWith(
        iconColor: MaterialStateColor.resolveWith(
          (states) => switch (states) {
            _ when states.contains(MaterialState.pressed) =>
              Theme.of(context).colorScheme.primary,
            _ => Theme.of(context).iconTheme.color ?? Colors.black,
          },
        ),
      ),
      child: Builder(
        builder: (context) {
          return IconTheme(
            data: IconTheme.of(context).copyWith(size: 16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 28,
                maxHeight: 28,
                minWidth: 28,
              ),
              child: child,
            ),
          );
        },
      ),
    );

    if (tooltip != null) {
      return Tooltip(
        message: tooltip?.message,
        richMessage: tooltip?.richMessage,
        waitDuration: const Duration(milliseconds: 500),
        child: button,
      );
    }

    return button;
  }
}
