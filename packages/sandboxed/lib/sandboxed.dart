// ignore_for_file: scoped_providers_should_specify_dependencies
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:sandboxed/addons/addon.dart';
import 'package:sandboxed/addons/param_builders/default_param_editor_addon.dart';
import 'package:sandboxed/addons/params/params_addon.dart';
import 'package:sandboxed/addons/reload/reload_addon.dart';
import 'package:sandboxed/feature_flags.dart';
import 'package:sandboxed/provider/addons.dart';
import 'package:sandboxed/provider/brand_color.dart';
import 'package:sandboxed/provider/component_tree.dart';
import 'package:sandboxed/provider/persistence.dart';
import 'package:sandboxed/provider/selected.dart';
import 'package:sandboxed/provider/settings.dart';
import 'package:sandboxed/provider/theme_mode.dart';
import 'package:sandboxed/provider/title.dart';
import 'package:sandboxed/routing/sandboxed_route_parser.dart';
import 'package:sandboxed/routing/sandboxed_router_delegate.dart';
import 'package:sandboxed/src/provider/feature_flags.dart';
import 'package:sandboxed/theme.dart';
import 'package:sandboxed/widgets/application_scale.dart';
import 'package:sandboxed/widgets/sb_notification_listener.dart';
import 'package:sandboxed_core/component.dart';

export 'package:sandboxed_core/sandboxed_core.dart';
export 'package:sandboxed_ui_kit/sandboxed_ui_kit.dart';

class Sandboxed extends StatefulWidget {
  final Widget title;
  final Color brandColor;

  final ThemeData? theme;
  final ThemeData? darkTheme;

  final List<Component> components;
  final List<Addon> addons;
  final Set<FeatureFlags> flags;

  const Sandboxed({
    super.key,
    required this.components,
    this.title = const Text('Sandboxed'),
    this.brandColor = Colors.green,
    this.theme,
    this.darkTheme,
    this.addons = const [],
    this.flags = const {},
  });

  @override
  State<Sandboxed> createState() => _SandboxedState();
}

class _SandboxedState extends State<Sandboxed> {
  SandboxedRouterDelegate? _routerDelegate;
  final _routeInformationParser = const SandboxedRouteInformationParser();

  @override
  void initState() {
    usePathUrlStrategy();
    super.initState();
  }

  @override
  void dispose() {
    _routerDelegate?.dispose();
    super.dispose();
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
      'Sandboxed should be used in context with root ProviderScope',
    );

    return SBNotificationListener(
      child: ProviderScope(
        overrides: [
          titleProvider.overrideWithValue(widget.title),
          brandColorProvider.overrideWithValue(widget.brandColor),
          componentsProvider.overrideWithValue(widget.components),
          featureFlagsProvider.overrideWith(
            (ref) => {
              ...widget.flags,
              ...ref.watch(
                settingStorageProvider.select((value) => value.optInFeatures),
              )
            },
          ),
          addonListProvider.overrideWith(
            (ref) => [
              ReloadAddon(),
              ParamsAddon(),
              ...widget.addons,
              DefaultParamEditorAddon(),
            ],
          ),
        ],
        child: Consumer(
          builder: (context, ref, child) {
            final path = ref.watch(pathPersistenceProvider);
            if (path is AsyncLoading) {
              return const SizedBox();
            }

            // Initialize router delegate with ref (only once)
            _routerDelegate ??= SandboxedRouterDelegate(ref: ref);

            // Listen to state changes and update router
            ref.listen(selectedElementProvider, (previous, next) {
              _routerDelegate?.updateConfiguration();
            });
            ref.listen(addonQueryProvider, (previous, next) {
              _routerDelegate?.updateConfiguration();
            });

            return ApplicationScale(
              child: MaterialApp.router(
                debugShowCheckedModeBanner: false,
                themeMode: ref.watch(themeModeNotifierProvider),
                theme: widget.theme?.copyWith(
                      extensions: [
                        buildSandboxedTheme(context, ref),
                      ],
                    ) ??
                    buildLightTheme(context, ref),
                darkTheme: widget.darkTheme?.copyWith(
                      extensions: [
                        buildSandboxedTheme(context, ref),
                      ],
                    ) ??
                    buildDarkTheme(context, ref),
                builder: (context, child) {
                  return GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus,
                    child: child,
                  );
                },
                routerDelegate: _routerDelegate!,
                routeInformationParser: _routeInformationParser,
              ),
            );
          },
        ),
      ),
    );
  }
}
