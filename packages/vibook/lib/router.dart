import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vibook/router.gr.dart';

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
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: IndexRoute.page,
          children: [
            AutoRoute(
              path: 'story/:id',
              page: StoryRoute.page,
              type: kFadeRouteType,
            ),
            AutoRoute(
              path: 'document/:id',
              page: DocumentRoute.page,
              type: kFadeRouteType,
            ),
          ],
        ),
        RedirectRoute(path: '*', redirectTo: '/'),
      ];
}
