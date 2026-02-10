import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:sandboxed/routing/sandboxed_route.dart';

/// Parses URLs into [SandboxedRoute] objects and vice versa
class SandboxedRouteInformationParser
    extends RouteInformationParser<SandboxedRoute> {
  const SandboxedRouteInformationParser();

  @override
  Future<SandboxedRoute> parseRouteInformation(
      RouteInformation routeInformation) {
    final uri = routeInformation.uri;
    final path = uri.path;
    final queryParams = Map<String, String>.from(uri.queryParameters);

    final route = switch (path) {
      '/story' => SandboxedRoute.story(
          id: queryParams['path'] ?? '',
          queryParameters: queryParams,
        ),
      '/document' => SandboxedRoute.document(
          id: queryParams['path'] ?? '',
          queryParameters: queryParams,
        ),
      '/settings' => const SandboxedRoute.settings(),
      '/nothing' || '/' => SandboxedRoute.nothing(queryParameters: queryParams),
      _ => SandboxedRoute.nothing(queryParameters: queryParams),
    };

    return SynchronousFuture(route);
  }

  @override
  RouteInformation? restoreRouteInformation(SandboxedRoute configuration) {
    return RouteInformation(uri: Uri.parse(configuration.url));
  }
}
