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
    this.selected = false,
  });

  final Widget child;
  final bool selected;
  final ToolbarTooltip? tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    // TODO(@melvspace): 03/09/25 use chips for toggleable buttons?
    final button = TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: const Size.square(28),
        maximumSize: const Size.fromHeight(28),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        backgroundColor: selected //
            ? Theme.of(context).colorScheme.primary.withOpacity(.5)
            : null,
        alignment: Alignment.center,
      ).copyWith(
        iconColor: WidgetStateColor.resolveWith(
          (states) => switch (states) {
            _ when states.contains(WidgetState.pressed) => colors.primary,
            _ => theme.iconTheme.color ?? Colors.black,
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
