import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sandboxed/router.gr.dart';

final kFadeRouteType = CustomRouteType(
  durationInMilliseconds: 200,
  transitionsBuilder: (_, animation, __, child) {
    return FadeTransition(
      opacity: CurvedAnimation(parent: animation, curve: Curves.ease),
      child: child,
    );
  },
);

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(
        path: '/',
        page: IndexRoute.page,
        children: [
          AutoRoute(
            path: 'nothing',
            page: NothingRoute.page,
            type: kFadeRouteType,
          ),
          AutoRoute(
            path: 'story',
            page: StoryRoute.page,
            type: kFadeRouteType,
          ),
          AutoRoute(
            path: 'document',
            page: DocumentRoute.page,
            type: kFadeRouteType,
          ),
        ],
      ),
      RedirectRoute(path: '*', redirectTo: '/'),
    ];
  }
}
