import 'package:flutter/material.dart';

class SandboxedTheme extends ThemeExtension<SandboxedTheme> {
  static SandboxedTheme of(BuildContext context) {
    return Theme.of(context).extension<SandboxedTheme>()!;
  }

  final Color brandColor;
  final TextStyle? codeStyle;

  SandboxedTheme({
    required this.brandColor,
    this.codeStyle,
  });

  @override
  SandboxedTheme copyWith({
    Color? brandColor,
    TextStyle? codeStyle,
  }) {
    return SandboxedTheme(
      brandColor: brandColor ?? this.brandColor,
      codeStyle: codeStyle ?? this.codeStyle,
    );
  }

  @override
  SandboxedTheme lerp(covariant SandboxedTheme? other, double t) {
    if (other == null) return this;

    return SandboxedTheme(
      brandColor: Color.lerp(brandColor, other.brandColor, t) ?? brandColor,
      codeStyle: TextStyle.lerp(codeStyle, other.codeStyle, t) ?? codeStyle,
    );
  }
}
