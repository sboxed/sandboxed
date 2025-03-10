import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  final Widget tag;
  final Color? color;

  const TagChip({
    super.key,
    required this.tag,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? Theme.of(context).colorScheme.surface;
    final hsvColor = HSVColor.fromColor(color);
    BorderSide border = getBorder(color);

    return DecoratedBox(
      decoration: ShapeDecoration(
        color: color,
        shape: StadiumBorder(
          side: border,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        child: DefaultTextStyle.merge(
          style: Theme.of(context).textTheme.labelMedium,
          child: DefaultTextStyle.merge(
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: color.computeLuminance() > .4 //
                  ? hsvColor.withValue(.25).toColor()
                  : Colors.white,
            ),
            child: tag,
          ),
        ),
      ),
    );
  }

  BorderSide getBorder(Color color) {
    final hsvColor = HSVColor.fromColor(color);
    final borderValue = hsvColor.value > .5 //
        ? hsvColor.value - .15
        : hsvColor.value + .15;

    return BorderSide(
      width: 2,
      color: hsvColor //
          .withValue(borderValue.clamp(0, 1))
          .toColor(),
    );
  }
}
