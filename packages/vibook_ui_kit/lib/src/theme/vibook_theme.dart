import 'package:flutter/material.dart';

class VibookTheme extends ThemeExtension<VibookTheme> {
  final Color brandColor;

  VibookTheme({required this.brandColor});

  @override
  VibookTheme copyWith({
    Color? brandColor,
  }) {
    return VibookTheme(
      brandColor: brandColor ?? this.brandColor,
    );
  }

  @override
  VibookTheme lerp(covariant VibookTheme? other, double t) {
    if (other == null) return this;

    return VibookTheme(
      brandColor: Color.lerp(brandColor, other.brandColor, t) ?? brandColor,
    );
  }
}
