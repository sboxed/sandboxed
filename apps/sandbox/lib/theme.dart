// ignore_for_file: depend_on_referenced_packages

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class Themes {
  final Color brandColor;
  final ThemeData light;
  final ThemeData dark;

  const Themes({
    required this.brandColor,
    required this.light,
    required this.dark,
  });

  static Themes build({Color brandColor = Colors.green}) {
    final color = brandColor;

    final sub = FlexSubThemesData(
      // Drawer
      drawerRadius: 0,

      // Input
      inputDecoratorRadius: 12,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,

      // Card
      cardRadius: 0,
      cardElevation: 0,

      // Tile
      listTileSelectedTileSchemeColor: SchemeColor.primary,
      listTileSelectedSchemeColor: SchemeColor.onPrimary,

      // Chips
      chipSelectedSchemeColor: SchemeColor.primaryFixed,

      // Segmented
      segmentedButtonSchemeColor: SchemeColor.primaryFixed,

      // Scaffold
      scaffoldBackgroundBaseColor: FlexScaffoldBaseColor.surface,

      // Snackbar
      snackBarContentTextStyle: GoogleFonts.jetBrainsMono(),
    );

    final theme = FlexThemeData.light(
      useMaterial3: true,
      fontFamily: GoogleFonts.jetBrainsMono().fontFamily,
      subThemesData: sub,
      useMaterial3ErrorColors: true,
      colors: FlexSchemeColor.from(
        // primary
        primary: color,

        // secondary
        secondary: Colors.white,
        secondaryContainer: Colors.grey.shade300,

        // tertiary
        tertiary: Colors.white,
        tertiaryContainer: Colors.grey.shade300,

        // error
        error: Colors.red,
      ),
    );

    final darkTheme = FlexThemeData.dark(
      useMaterial3: true,
      fontFamily: GoogleFonts.jetBrainsMono().fontFamily,
      subThemesData: sub,
      colors: FlexSchemeColor.from(
        // primary
        primary: color,

        // secondary
        secondary: Colors.grey.shade800,
        secondaryContainer: Colors.grey.shade600,

        // tertiary
        tertiary: Colors.grey.shade900,
        tertiaryContainer: Colors.grey.shade800,

        // error
        error: Colors.red,
      ),
    );

    return Themes(
      brandColor: brandColor,
      light: theme.copyWith(
        cardTheme: theme.cardTheme.copyWith(
          margin: EdgeInsets.zero,
        ),
        sliderTheme: theme.sliderTheme.copyWith(
          // ignore: deprecated_member_use
          year2023: false,
        ),
      ),
      dark: darkTheme.copyWith(
        cardTheme: darkTheme.cardTheme.copyWith(
          margin: EdgeInsets.zero,
        ),
        sliderTheme: darkTheme.sliderTheme.copyWith(
          // ignore: deprecated_member_use
          year2023: false,
        ),
      ),
    );
  }
}
