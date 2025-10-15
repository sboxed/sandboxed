import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sandboxed_ui_kit/src/theme/theme.dart';

enum ElementTileSize {
  large,
  medium,
  small,
}

class ElementTileThemeData {
  final bool dense;

  const ElementTileThemeData({this.dense = false});

  ElementTileThemeData lerp(ElementTileThemeData tileTheme, double t) {
    return ElementTileThemeData(dense: tileTheme.dense);
  }
}

class ElementTileComputedSize {
  final ElementTileSize size;
  final bool dense;

  const ElementTileComputedSize({required this.size, required this.dense});

  double getBaseHeight() {
    if (dense) {
      return 24;
    }

    return 32;
  }

  double getIconSize() {
    if (dense) {
      return 16;
    }

    return 24;
  }

  double getIconSpacing() {
    if (dense) {
      return 8;
    }

    return 12;
  }

  EdgeInsets getContentPadding() {
    if (dense) {
      return EdgeInsets.symmetric(horizontal: 16, vertical: 2) +
          switch (size) {
            ElementTileSize.large => EdgeInsets.only(top: 16),
            ElementTileSize.medium => EdgeInsets.only(top: 8),
            ElementTileSize.small => EdgeInsets.only(top: 0),
          };
    }

    return EdgeInsets.symmetric(horizontal: 16, vertical: 8) +
        switch (size) {
          ElementTileSize.large => EdgeInsets.only(top: 32),
          ElementTileSize.medium => EdgeInsets.only(top: 16),
          ElementTileSize.small => EdgeInsets.only(top: 0),
        };
  }

  TextStyle getTitleStyle(BuildContext context) {
    if (dense) {
      return Theme.of(context).textTheme.bodySmall ?? const TextStyle();
    }
    return Theme.of(context).textTheme.bodyLarge ?? const TextStyle();
  }
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

  static Size computeSizeFor(BuildContext context, ElementTileSize size) {
    final theme = SandboxedTheme.of(context).tileTheme;
    final computedSize =
        ElementTileComputedSize(size: size, dense: theme.dense);

    final baseHeight = computedSize.getBaseHeight();
    final padding = computedSize.getContentPadding();

    return Size.fromHeight(baseHeight + padding.vertical);
  }

  @override
  Widget build(BuildContext context) {
    final theme = SandboxedTheme.of(context).tileTheme;
    final listTileTheme = Theme.of(context).listTileTheme;

    final computedSize =
        ElementTileComputedSize(size: size, dense: theme.dense);

    final color = selected
        ? listTileTheme.selectedTileColor
        : Theme.of(context).colorScheme.surfaceContainerLow;

    final foregroundColor = selected
        ? listTileTheme.selectedColor
        : Theme.of(context).textTheme.bodyLarge?.color;

    final baseHeight = computedSize.getBaseHeight();
    final iconSize = computedSize.getIconSize();
    final padding = computedSize.getContentPadding() +
        EdgeInsets.only(left: 16.0 * max(0, depth - 1));

    final titleStyle = computedSize
        .getTitleStyle(context) //
        .copyWith(color: foregroundColor);

    return SizedBox(
      width: double.infinity,
      child: Material(
        color: color,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: padding,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: baseHeight),
              child: IconTheme.merge(
                data: IconThemeData(
                  color: foregroundColor,
                  size: iconSize,
                ),
                child: DefaultTextStyle.merge(
                  style: titleStyle,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: computedSize.getIconSpacing(),
                    children: [
                      if (icon case Widget icon) //
                        buildIcon(icon),
                      Flexible(child: title),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildIcon(Widget icon) {
    if (tooltip.isNotEmpty) {
      return Tooltip(
        message: tooltip,
        waitDuration: const Duration(milliseconds: 240),
        child: icon,
      );
    }

    return icon;
  }
}
