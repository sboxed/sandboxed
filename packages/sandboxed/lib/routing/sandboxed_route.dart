import 'package:flutter/foundation.dart';

/// Represents the different types of routes in Sandboxed
enum RouteType {
  nothing,
  story,
  document,
  settings,
}

/// Route configuration for Sandboxed application
@immutable
class SandboxedRoute {
  final RouteType type;
  final String? id;
  final Map<String, String> queryParameters;

  const SandboxedRoute({
    required this.type,
    this.id,
    this.queryParameters = const {},
  });

  const SandboxedRoute.nothing({Map<String, String>? queryParameters})
      : type = RouteType.nothing,
        id = null,
        queryParameters = queryParameters ?? const {};

  const SandboxedRoute.story({
    required this.id,
    Map<String, String>? queryParameters,
  })  : type = RouteType.story,
        queryParameters = queryParameters ?? const {};

  const SandboxedRoute.document({
    required this.id,
    Map<String, String>? queryParameters,
  })  : type = RouteType.document,
        queryParameters = queryParameters ?? const {};

  const SandboxedRoute.settings()
      : type = RouteType.settings,
        id = null,
        queryParameters = const {};

  /// Get the URL path for this route
  String get path {
    return switch (type) {
      RouteType.nothing => '/nothing',
      RouteType.story => '/story',
      RouteType.document => '/document',
      RouteType.settings => '/settings',
    };
  }

  /// Get the full URL including query parameters
  String get url {
    final uri = Uri(
        path: path,
        queryParameters: queryParameters.isEmpty ? null : queryParameters);
    return uri.toString();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SandboxedRoute &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          id == other.id &&
          mapEquals(queryParameters, other.queryParameters);

  @override
  int get hashCode =>
      Object.hash(type, id, Object.hashAll(queryParameters.entries));

  @override
  String toString() =>
      'SandboxedRoute(type: $type, id: $id, queryParameters: $queryParameters)';
}
