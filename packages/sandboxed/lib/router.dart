import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sandboxed/router.gr.dart';
import 'package:sandboxed/sandboxed.dart';

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
      AutoRoute(
        path: "/settings",
        type: CustomRouteType(
          customRouteBuilder: <T>(context, child, page) {
            switch (context.breakpoint) {
              case Breakpoints.mobile:
                return MaterialPageRoute(
                  settings: page,
                  builder: (context) => child,
                );

              case Breakpoints.desktop:
                return DialogRoute(
                  context: context,
                  settings: page,
                  builder: (context) {
                    return LayoutBuilder(
                      builder: (context, constraints) => Dialog(
                        constraints: (constraints / 2).enforce(
                          BoxConstraints(
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
          },
        ),
        page: SettingsRoute.page,
      ),
      RedirectRoute(path: '*', redirectTo: '/'),
    ];
  }
}
