import 'package:auto_route/auto_route.dart';
import 'package:vibook/router.gr.dart';

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
            ),
            AutoRoute(
              path: 'document/:id',
              page: DocumentRoute.page,
            ),
          ],
        ),
      ];
}
