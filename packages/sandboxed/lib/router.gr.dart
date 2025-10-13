// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:sandboxed/pages/document/document_page.dart' as _i1;
import 'package:sandboxed/pages/index_page.dart' as _i2;
import 'package:sandboxed/pages/nothing/nothing_page.dart' as _i3;
import 'package:sandboxed/pages/settings/settings_pages.dart' as _i4;
import 'package:sandboxed/pages/story/story_page.dart' as _i5;

/// generated route for
/// [_i1.DocumentPage]
class DocumentRoute extends _i6.PageRouteInfo<DocumentRouteArgs> {
  DocumentRoute({
    _i7.Key? key,
    String? id,
    String? global,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          DocumentRoute.name,
          args: DocumentRouteArgs(key: key, id: id, global: global),
          rawQueryParams: {'path': id, 'global': global},
          initialChildren: children,
        );

  static const String name = 'DocumentRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<DocumentRouteArgs>(
        orElse: () => DocumentRouteArgs(
          id: queryParams.optString('path'),
          global: queryParams.optString('global'),
        ),
      );
      return _i1.DocumentPage(key: args.key, id: args.id, global: args.global);
    },
  );
}

class DocumentRouteArgs {
  const DocumentRouteArgs({this.key, this.id, this.global});

  final _i7.Key? key;

  final String? id;

  final String? global;

  @override
  String toString() {
    return 'DocumentRouteArgs{key: $key, id: $id, global: $global}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DocumentRouteArgs) return false;
    return key == other.key && id == other.id && global == other.global;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode ^ global.hashCode;
}

/// generated route for
/// [_i2.IndexPage]
class IndexRoute extends _i6.PageRouteInfo<void> {
  const IndexRoute({List<_i6.PageRouteInfo>? children})
      : super(IndexRoute.name, initialChildren: children);

  static const String name = 'IndexRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.IndexPage();
    },
  );
}

/// generated route for
/// [_i3.NothingPage]
class NothingRoute extends _i6.PageRouteInfo<NothingRouteArgs> {
  NothingRoute({
    _i7.Key? key,
    String? global,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          NothingRoute.name,
          args: NothingRouteArgs(key: key, global: global),
          rawQueryParams: {'global': global},
          initialChildren: children,
        );

  static const String name = 'NothingRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<NothingRouteArgs>(
        orElse: () => NothingRouteArgs(global: queryParams.optString('global')),
      );
      return _i3.NothingPage(key: args.key, global: args.global);
    },
  );
}

class NothingRouteArgs {
  const NothingRouteArgs({this.key, this.global});

  final _i7.Key? key;

  final String? global;

  @override
  String toString() {
    return 'NothingRouteArgs{key: $key, global: $global}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NothingRouteArgs) return false;
    return key == other.key && global == other.global;
  }

  @override
  int get hashCode => key.hashCode ^ global.hashCode;
}

/// generated route for
/// [_i4.SettingsPage]
class SettingsRoute extends _i6.PageRouteInfo<void> {
  const SettingsRoute({List<_i6.PageRouteInfo>? children})
      : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.SettingsPage();
    },
  );
}

/// generated route for
/// [_i5.StoryPage]
class StoryRoute extends _i6.PageRouteInfo<StoryRouteArgs> {
  StoryRoute({
    _i7.Key? key,
    String? id,
    String? params,
    String? global,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          StoryRoute.name,
          args:
              StoryRouteArgs(key: key, id: id, params: params, global: global),
          rawQueryParams: {'path': id, 'params': params, 'global': global},
          initialChildren: children,
        );

  static const String name = 'StoryRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<StoryRouteArgs>(
        orElse: () => StoryRouteArgs(
          id: queryParams.optString('path'),
          params: queryParams.optString('params'),
          global: queryParams.optString('global'),
        ),
      );
      return _i5.StoryPage(
        key: args.key,
        id: args.id,
        params: args.params,
        global: args.global,
      );
    },
  );
}

class StoryRouteArgs {
  const StoryRouteArgs({this.key, this.id, this.params, this.global});

  final _i7.Key? key;

  final String? id;

  final String? params;

  final String? global;

  @override
  String toString() {
    return 'StoryRouteArgs{key: $key, id: $id, params: $params, global: $global}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! StoryRouteArgs) return false;
    return key == other.key &&
        id == other.id &&
        params == other.params &&
        global == other.global;
  }

  @override
  int get hashCode =>
      key.hashCode ^ id.hashCode ^ params.hashCode ^ global.hashCode;
}
