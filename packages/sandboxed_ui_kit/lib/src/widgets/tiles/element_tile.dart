import 'package:flutter/material.dart';

enum ElementTileSize {
  large,
  medium,
  small,
}

class ElementTile extends StatelessWidget {
  final bool selected;
  final int depth;

  final Widget? icon;
  final Widget title;
  final String tooltip;

  final ElementTileSize size;
  final VoidCallback? onPressed;

  const ElementTile({
    super.key,
    this.depth = 1,
    this.onPressed,
    this.tooltip = '',
    this.selected = false,
    this.size = ElementTileSize.small,
    this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      child: ListTile(
        onTap: onPressed,
        selected: selected,
        contentPadding: EdgeInsets.only(
          left: 16.0 * depth,
          top: switch (size) {
            ElementTileSize.large => 32,
            ElementTileSize.medium => 16,
            ElementTileSize.small => 0,
          },
        ),
        leading: tooltip.isNotEmpty
            ? Tooltip(
                message: tooltip,
                waitDuration: const Duration(milliseconds: 240),
                child: icon,
              )
            : icon,
        title: title,
      ),
    );
  }
}
