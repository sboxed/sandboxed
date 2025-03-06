// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:vibook/pages/document_page.dart' as _i1;
import 'package:vibook/pages/index_page.dart' as _i2;
import 'package:vibook/pages/story_page.dart' as _i3;

/// generated route for
/// [_i1.DocumentPage]
class DocumentRoute extends _i4.PageRouteInfo<DocumentRouteArgs> {
  DocumentRoute({
    _i5.Key? key,
    required String id,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          DocumentRoute.name,
          args: DocumentRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'DocumentRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<DocumentRouteArgs>(
          orElse: () => DocumentRouteArgs(id: pathParams.getString('id')));
      return _i1.DocumentPage(
        key: args.key,
        id: args.id,
      );
    },
  );
}

class DocumentRouteArgs {
  const DocumentRouteArgs({
    this.key,
    required this.id,
  });

  final _i5.Key? key;

  final String id;

  @override
  String toString() {
    return 'DocumentRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i2.IndexPage]
class IndexRoute extends _i4.PageRouteInfo<void> {
  const IndexRoute({List<_i4.PageRouteInfo>? children})
      : super(
          IndexRoute.name,
          initialChildren: children,
        );

  static const String name = 'IndexRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.IndexPage();
    },
  );
}

/// generated route for
/// [_i3.StoryPage]
class StoryRoute extends _i4.PageRouteInfo<StoryRouteArgs> {
  StoryRoute({
    _i5.Key? key,
    required String? id,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          StoryRoute.name,
          args: StoryRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'StoryRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<StoryRouteArgs>(
          orElse: () => StoryRouteArgs(id: pathParams.optString('id')));
      return _i3.StoryPage(
        key: args.key,
        id: args.id,
      );
    },
  );
}

class StoryRouteArgs {
  const StoryRouteArgs({
    this.key,
    required this.id,
  });

  final _i5.Key? key;

  final String? id;

  @override
  String toString() {
    return 'StoryRouteArgs{key: $key, id: $id}';
  }
}
