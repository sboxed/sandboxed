import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandboxed/pages/index_page.dart';
import 'package:sandboxed/pages/settings/settings_pages.dart';
import 'package:sandboxed/provider/addons.dart';
import 'package:sandboxed/provider/params.dart';
import 'package:sandboxed/provider/selected.dart';
import 'package:sandboxed/routing/sandboxed_route.dart';
import 'package:sandboxed_ui_kit/sandboxed_ui_kit.dart';

/// Custom page with fade transition
class FadePage<T> extends Page<T> {
  final Widget child;
  final Duration duration;

  const FadePage({
    required this.child,
    this.duration = const Duration(milliseconds: 200),
    super.key,
    super.name,
    super.arguments,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return PageRouteBuilder<T>(
      settings: this,
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurvedAnimation(parent: animation, curve: Curves.ease),
          child: child,
        );
      },
    );
  }
}

/// Custom page for responsive settings dialog/modal
class ResponsiveDialogPage<T> extends Page<T> {
  final Widget child;

  const ResponsiveDialogPage({
    required this.child,
    super.key,
    super.name,
    super.arguments,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    final breakpoint = context.breakpoint;

    if (breakpoint == Breakpoints.mobile) {
      return MaterialPageRoute<T>(
        settings: this,
        builder: (context) => child,
      );
    } else {
      return DialogRoute<T>(
        context: context,
        settings: this,
        builder: (context) {
          return LayoutBuilder(
            builder: (context, constraints) => Dialog(
              constraints: (constraints / 2).enforce(
                const BoxConstraints(
                  minHeight: 500,
                  minWidth: 450,
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: child,
            ),
          );
        },
      );
    }
  }
}

/// Router delegate for Sandboxed application
class SandboxedRouterDelegate extends RouterDelegate<SandboxedRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<SandboxedRoute> {
  final WidgetRef ref;

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  bool _showSettings = false;

  SandboxedRouterDelegate({required this.ref})
      : navigatorKey = GlobalKey<NavigatorState>();

  @override
  SandboxedRoute? get currentConfiguration {
    if (_showSettings) {
      return const SandboxedRoute.settings();
    }

    final selected = ref.read(selectedElementProvider);
    final id = ref.read(selectedElementNotifierProvider);

    if (selected == null || id == null) {
      final global = ref.read(addonQueryProvider);
      return SandboxedRoute.nothing(
        queryParameters: global != null ? {'global': global} : {},
      );
    }

    final global = ref.read(addonQueryProvider);
    final queryParams = <String, String>{
      'path': id,
      if (global != null) 'global': global,
    };

    return switch (selected) {
      StorySelection() => () {
          final params = ref.read(paramsQueryProvider(id));
          if (params != null) {
            queryParams['params'] = params;
          }
          return SandboxedRoute.story(id: id, queryParameters: queryParams);
        }(),
      DocumentSelection() => SandboxedRoute.document(
          id: id,
          queryParameters: queryParams,
        ),
    };
  }

  @override
  Future<void> setNewRoutePath(SandboxedRoute configuration) async {
    if (configuration.type == RouteType.settings) {
      _showSettings = true;
      notifyListeners();
      return;
    }

    _showSettings = false;

    // Apply deep link state
    if (configuration.queryParameters['path'] case String id) {
      ref.read(selectedElementNotifierProvider.notifier).select(id);

      if (configuration.queryParameters['params'] case String params) {
        ref.read(paramsQueryProvider(id).notifier).applyDeeplink(params);
      }
    }

    if (configuration.queryParameters['global'] case String global) {
      ref.read(addonQueryProvider.notifier).applyDeeplink(global);
    }

    notifyListeners();
  }

  void showSettings() {
    _showSettings = true;
    notifyListeners();
  }

  void hideSettings() {
    _showSettings = false;
    notifyListeners();
  }

  /// Notify that the route configuration has changed
  void updateConfiguration() {
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Page>[
      const MaterialPage(
        key: ValueKey('index'),
        child: IndexPage(),
      ),
    ];

    // Add settings page if shown
    if (_showSettings) {
      pages.add(
        const ResponsiveDialogPage(
          key: ValueKey('settings'),
          child: SettingsPage(),
        ),
      );
    }

    return Navigator(
      key: navigatorKey,
      pages: pages,
      onDidRemovePage: (page) {
        if (_showSettings && page.key == const ValueKey('settings')) {
          hideSettings();
        }
      },
    );
  }
}
