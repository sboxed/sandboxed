// ignore_for_file: scoped_providers_should_specify_dependencies
library vibook;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:vibook/addons/addon.dart';
import 'package:vibook/addons/param_builders/base_param_builders_addon.dart';
import 'package:vibook/addons/reload/reload_addon.dart';
import 'package:vibook/provider/addons.dart';
import 'package:vibook/provider/brand_color.dart';
import 'package:vibook/provider/component_tree.dart';
import 'package:vibook/provider/params.dart';
import 'package:vibook/provider/selected.dart';
import 'package:vibook/provider/theme_mode.dart';
import 'package:vibook/provider/title.dart';
import 'package:vibook/router.dart';
import 'package:vibook/theme.dart';
import 'package:vibook/widgets/vi_notification_listener.dart';
import 'package:vibook_core/component.dart';
import 'package:vibook_ui_kit/vibook_ui_kit.dart';

export 'package:vibook_core/vibook_core.dart';
export 'package:vibook_ui_kit/vibook_ui_kit.dart';

class Vibook extends StatefulWidget {
  final Widget title;
  final Color brandColor;

  final ThemeData? theme;
  final ThemeData? darkTheme;

  final List<Component> components;
  final List<Addon> addons;

  const Vibook({
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

  @override
  void initState() {
    usePathUrlStrategy();
    super.initState();
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

    return ViNotificationListener(
      child: ProviderScope(
        overrides: [
          titleProvider.overrideWithValue(widget.title),
          brandColorProvider.overrideWithValue(widget.brandColor),
          componentsProvider.overrideWithValue(widget.components),
          addonListProvider.overrideWith(
            (ref) => [
              ReloadAddon(),
              ...widget.addons,
              BaseParamBuildersAddon(),
            ],
          ),
        ],
        child: Consumer(
          builder: (context, ref, child) {
            return MaterialApp.router(
              themeMode: ref.watch(themeModeNotifierProvider),
              theme: widget.theme?.copyWith(
                    extensions: [
                      VibookTheme(brandColor: widget.brandColor),
                    ],
                  ) ??
                  buildLightTheme(context, ref),
              darkTheme: widget.darkTheme?.copyWith(
                    extensions: [
                      VibookTheme(brandColor: widget.brandColor),
                    ],
                  ) ??
                  buildDarkTheme(context, ref),
              builder: (context, child) {
                return GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus,
                  child: child,
                );
              },
              routerConfig: router.config(
                deepLinkBuilder: (deepLink) async {
                  await Future.microtask(() {
                    if (deepLink.isValid) {
                      if (deepLink.uri.queryParameters['path'] case String id) {
                        ref
                            .read(selectedElementNotifierProvider.notifier)
                            .select(id);

                        if (deepLink.uri.queryParameters['params']
                            case String params) {
                          ref
                              .read(paramsQueryProvider(id).notifier)
                              .applyDeeplink(params);
                        }
                      }

                      if (deepLink.uri.queryParameters['global']
                          case String global) {
                        ref
                            .read(addonQueryProvider.notifier)
                            .applyDeeplink(global);
                      }
                    }
                  });

                  return deepLink;
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
