library vibook;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibook/addons/addon.dart';
import 'package:vibook/layout/mobile_layout.dart';
import 'package:vibook/layout/tablet_layout.dart';
import 'package:vibook/provider/addons.dart';
import 'package:vibook/provider/brand_color.dart';
import 'package:vibook/provider/component_tree.dart';
import 'package:vibook/provider/theme_mode.dart';
import 'package:vibook/theme.dart';
import 'package:vibook_core/component.dart';
import 'package:vibook_core/story.dart';

export 'package:vibook_core/vibook_core.dart';

class Vibook extends StatefulWidget {
  final Color brandColor;

  final ThemeData? theme;
  final ThemeData? darkTheme;

  final List<Component> components;
  final List<Addon> addons;

  const Vibook({
    super.key,
    required this.components,
    this.addons = const [],
    this.brandColor = Colors.green,
    this.theme,
    this.darkTheme,
  });

  @override
  State<Vibook> createState() => _VibookState();
}

class _VibookState extends State<Vibook> {
  Component? component;
  Story? story;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        componentsProvider.overrideWithValue(widget.components),
        addonsProvider.overrideWithValue(widget.addons),
        brandColorProvider.overrideWithValue(widget.brandColor),
      ],
      child: Consumer(
        builder: (context, ref, child) {
          return MaterialApp(
            themeMode: ref.watch(themeModeNotifierProvider),
            theme: widget.theme ?? buildLightTheme(context, ref),
            darkTheme: widget.darkTheme ?? buildDarkTheme(context, ref),
            home: LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth <= 900;

                if (isMobile) {
                  return MobileLayout(components: widget.components);
                } else {
                  return TabletLayout(components: widget.components);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
