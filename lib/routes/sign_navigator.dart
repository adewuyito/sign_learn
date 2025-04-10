import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SignNavigator {
  SignNavigator._(this.context);

  factory SignNavigator.of(BuildContext context) {
    return SignNavigator._(context);
  }

  BuildContext context;

  void push(PageRouteInfo route) {
    context.router.push(route);
  }

  void replace(PageRouteInfo route) {
    context.router.replace(route);
  }

  void replaceAll(List<PageRouteInfo> routes) {
    context.router.replaceAll(routes);
  }

  void pop<T>([T? result]) {
    context.router.maybePop(result);
  }
}

class SignNavigatorObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    debugPrint('New route pushed: ${route.settings.name}');
  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    debugPrint('Tab route visited: ${route.name} ${route.path}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    debugPrint('Tab route re-visited: ${route.name} ${route.path}');
  }
}
