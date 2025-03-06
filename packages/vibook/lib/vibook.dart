// ignore_for_file: scoped_providers_should_specify_dependencies
library vibook;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibook/addons/addon.dart';
import 'package:vibook/addons/param_builders/base_param_builders_addon.dart';
import 'package:vibook/addons/reload/reload_addon.dart';
import 'package:vibook/provider/addons.dart';
import 'package:vibook/provider/brand_color.dart';
import 'package:vibook/provider/component_tree.dart';
import 'package:vibook/provider/theme_mode.dart';
import 'package:vibook/provider/title.dart';
import 'package:vibook/router.dart';
import 'package:vibook/theme.dart';
import 'package:vibook_core/component.dart';

export 'package:vibook_core/vibook_core.dart';

class Vibook extends StatefulWidget {
  final Widget title;
  final Color brandColor;

  final ThemeData? theme;
  final ThemeData? darkTheme;

  final List<Component> components;
  final List<Addon> addons;

  Vibook({
    super.key,
    required this.components,
    this.title = const Text('VIBOOK'),
    this.brandColor = Colors.green,
    this.theme,
    this.darkTheme,
    this.addons = const [],
  });

  @override
  State<Vibook> createState() => _VibookState();
}

class _VibookState extends State<Vibook> {
  final router = AppRouter();

  // ValueKey generation = const ValueKey(0);

  @override
  void didUpdateWidget(covariant Vibook oldWidget) {
    // if (!const ListEquality().equals(oldWidget.components, widget.components)) {
    //   generation = ValueKey(generation.value + 1);
    // }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    assert(
      () {
        try {
          ProviderScope.containerOf(context);
        } on StateError catch (_) {
          return true;
        }

        return false;
      }(),
      'Vibook should be used in context with root ProviderScope',
    );

    return ProviderScope(
      // key: generation,
      overrides: [
        titleProvider.overrideWithValue(widget.title),
        brandColorProvider.overrideWithValue(widget.brandColor),
        componentsProvider.overrideWithValue(widget.components),
        addonListProvider.overrideWithValue([
          ReloadAddon(),
          ...widget.addons,
          BaseParamBuildersAddon(),
        ]),
      ],
      child: Consumer(
        builder: (context, ref, child) {
          return MaterialApp.router(
            themeMode: ref.watch(themeModeNotifierProvider),
            theme: widget.theme ?? buildLightTheme(context, ref),
            darkTheme: widget.darkTheme ?? buildDarkTheme(context, ref),
            routerConfig: router.config(),
          );
        },
      ),
    );
  }
}
