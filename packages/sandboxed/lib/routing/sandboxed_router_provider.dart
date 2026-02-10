import 'package:flutter/widgets.dart';
import 'package:sandboxed/routing/sandboxed_router_delegate.dart';

/// Helper to safely access the SandboxedRouterDelegate from context
extension SandboxedRouterExtension on BuildContext {
  /// Get the current router delegate
  SandboxedRouterDelegate? get sandboxedRouter {
    final router = Router.maybeOf(this);
    return router?.routerDelegate as SandboxedRouterDelegate?;
  }

  /// Get the current URL from the router
  String? get currentUrl {
    return sandboxedRouter?.currentConfiguration?.url;
  }
}
