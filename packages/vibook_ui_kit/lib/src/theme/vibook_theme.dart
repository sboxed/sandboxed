import 'package:flutter/material.dart';

class VibookTheme extends ThemeExtension<VibookTheme> {
  static VibookTheme of(BuildContext context) {
    return Theme.of(context).extension<VibookTheme>()!;
  }

  final Color brandColor;
  final TextStyle? codeStyle;

  VibookTheme({
    required this.brandColor,
    this.codeStyle,
  });

  @override
  VibookTheme copyWith({
    Color? brandColor,
    TextStyle? codeStyle,
  }) {
    return VibookTheme(
      brandColor: brandColor ?? this.brandColor,
      codeStyle: codeStyle ?? this.codeStyle,
    );
  }

  @override
  VibookTheme lerp(covariant VibookTheme? other, double t) {
    if (other == null) return this;

    return VibookTheme(
      brandColor: Color.lerp(brandColor, other.brandColor, t) ?? brandColor,
      codeStyle: TextStyle.lerp(codeStyle, other.codeStyle, t) ?? codeStyle,
    );
  }
}
