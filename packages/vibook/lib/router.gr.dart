// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:vibook/pages/document/document_page.dart' as _i1;
import 'package:vibook/pages/index_page.dart' as _i2;
import 'package:vibook/pages/nothing/nothing_page.dart' as _i3;
import 'package:vibook/pages/story/story_page.dart' as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    DocumentRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<DocumentRouteArgs>(
          orElse: () => DocumentRouteArgs(id: queryParams.optString('path')));
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DocumentPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    IndexRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.IndexPage(),
      );
    },
    NothingRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.NothingPage(),
      );
    },
    StoryRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<StoryRouteArgs>(
          orElse: () => StoryRouteArgs(id: queryParams.optString('path')));
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.StoryPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.DocumentPage]
class DocumentRoute extends _i5.PageRouteInfo<DocumentRouteArgs> {
  DocumentRoute({
    _i6.Key? key,
    String? id,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          DocumentRoute.name,
          args: DocumentRouteArgs(
            key: key,
            id: id,
          ),
          rawQueryParams: {'path': id},
          initialChildren: children,
        );

  static const String name = 'DocumentRoute';

  static const _i5.PageInfo<DocumentRouteArgs> page =
      _i5.PageInfo<DocumentRouteArgs>(name);
}

class DocumentRouteArgs {
  const DocumentRouteArgs({
    this.key,
    this.id,
  });

  final _i6.Key? key;

  final String? id;

  @override
  String toString() {
    return 'DocumentRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i2.IndexPage]
class IndexRoute extends _i5.PageRouteInfo<void> {
  const IndexRoute({List<_i5.PageRouteInfo>? children})
      : super(
          IndexRoute.name,
          initialChildren: children,
        );

  static const String name = 'IndexRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.NothingPage]
class NothingRoute extends _i5.PageRouteInfo<void> {
  const NothingRoute({List<_i5.PageRouteInfo>? children})
      : super(
          NothingRoute.name,
          initialChildren: children,
        );

  static const String name = 'NothingRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.StoryPage]
class StoryRoute extends _i5.PageRouteInfo<StoryRouteArgs> {
  StoryRoute({
    _i6.Key? key,
    String? id,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          StoryRoute.name,
          args: StoryRouteArgs(
            key: key,
            id: id,
          ),
          rawQueryParams: {'path': id},
          initialChildren: children,
        );

  static const String name = 'StoryRoute';

  static const _i5.PageInfo<StoryRouteArgs> page =
      _i5.PageInfo<StoryRouteArgs>(name);
}

class StoryRouteArgs {
  const StoryRouteArgs({
    this.key,
    this.id,
  });

  final _i6.Key? key;

  final String? id;

  @override
  String toString() {
    return 'StoryRouteArgs{key: $key, id: $id}';
  }
}
