// ignore_for_file: implementation_imports

import 'package:auto_route/auto_route.dart';
import 'package:flutter/src/widgets/navigator.dart';

class DelegateRouteObserver extends AutoRouteObserver {
  final void Function(Route route, Route? previousRoute)? onDidPush;
  final void Function(Route route, Route? previousRoute)? onDidPop;
  final void Function(Route route, Route? previousRoute)? onDidRemove;
  final void Function({Route? newRoute, Route? oldRoute})? onDidReplace;
  final void Function()? onChange;

  DelegateRouteObserver({
    this.onDidPush,
    this.onDidPop,
    this.onDidRemove,
    this.onDidReplace,
    this.onChange,
  });

  @override
  void didPush(Route route, Route? previousRoute) {
    onDidPush?.call(route, previousRoute);
    onChange?.call();

    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    onDidPop?.call(route, previousRoute);
    onChange?.call();

    super.didPop(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    onDidRemove?.call(route, previousRoute);
    onChange?.call();

    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    onDidReplace?.call(newRoute: newRoute, oldRoute: oldRoute);
    onChange?.call();

    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
}
