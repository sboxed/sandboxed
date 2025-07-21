import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sandboxed/provider/brand_color.dart';
import 'package:sandboxed_ui_kit/sandboxed_ui_kit.dart';

const kDrawerTheme = DrawerThemeData(
  shape: Border(),
);

const kCardTheme = CardThemeData(
  shape: LinearBorder(),
  margin: EdgeInsets.zero,
);

final kInputTheme = InputDecorationTheme(
  filled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
  ),
);

final kFilledButtonTheme = FilledButtonThemeData(
  style: FilledButton.styleFrom(
    foregroundColor: Colors.white,
  ),
);

const kOutlinedButtonTheme = OutlinedButtonThemeData();

SandboxedTheme buildSandboxedTheme(BuildContext context, WidgetRef ref) {
  return SandboxedTheme(
    brandColor: ref.watch(brandColorProvider),
    codeStyle: GoogleFonts.jetBrainsMono(),
  );
}

ThemeData buildLightTheme(BuildContext context, WidgetRef ref) => ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: Colors.white,
        primary: ref.watch(brandColorProvider),
      ),

      // shared
      textTheme:
          GoogleFonts.jetBrainsMonoTextTheme(ThemeData.light().textTheme),
      filledButtonTheme: kFilledButtonTheme,
      outlinedButtonTheme: kOutlinedButtonTheme,
      drawerTheme: kDrawerTheme,
      cardTheme: kCardTheme,
      inputDecorationTheme: kInputTheme,
      listTileTheme: ListTileThemeData(
        selectedColor: Colors.white,
        selectedTileColor: ref.watch(brandColorProvider),
      ),
      extensions: [
        buildSandboxedTheme(context, ref),
      ],
    );

ThemeData buildDarkTheme(BuildContext context, WidgetRef ref) => ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: Colors.white,
        primary: ref.watch(brandColorProvider),
      ),

      // shared
      textTheme: GoogleFonts.jetBrainsMonoTextTheme(ThemeData.dark().textTheme),
      filledButtonTheme: kFilledButtonTheme,
      outlinedButtonTheme: kOutlinedButtonTheme,
      drawerTheme: kDrawerTheme,
      cardTheme: kCardTheme,
      inputDecorationTheme: kInputTheme,
      listTileTheme: ListTileThemeData(
        selectedColor: Colors.white,
        selectedTileColor: ref.watch(brandColorProvider),
      ),
      extensions: [
        buildSandboxedTheme(context, ref),
      ],
    );
