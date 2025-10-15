import 'package:flutter/material.dart';
import 'package:sandboxed_ui_kit/src/widgets/tiles/element_tile.dart';

class SandboxedTheme extends ThemeExtension<SandboxedTheme> {
  static SandboxedTheme of(BuildContext context) {
    return Theme.of(context).extension<SandboxedTheme>()!;
  }

  final Color brandColor;
  final TextStyle? codeStyle;
  final ElementTileThemeData tileTheme;

  SandboxedTheme({
    required this.brandColor,
    this.codeStyle,
    this.tileTheme = const ElementTileThemeData(),
  });

  @override
  SandboxedTheme copyWith({
    Color? brandColor,
    TextStyle? codeStyle,
    ElementTileThemeData? tileTheme,
  }) {
    return SandboxedTheme(
      brandColor: brandColor ?? this.brandColor,
      codeStyle: codeStyle ?? this.codeStyle,
      tileTheme: tileTheme ?? this.tileTheme,
    );
  }

  @override
  SandboxedTheme lerp(covariant SandboxedTheme? other, double t) {
    if (other == null) return this;

    return SandboxedTheme(
      brandColor: Color.lerp(brandColor, other.brandColor, t) ?? brandColor,
      codeStyle: TextStyle.lerp(codeStyle, other.codeStyle, t) ?? codeStyle,
      tileTheme: tileTheme.lerp(other.tileTheme, t),
    );
  }
}
