import 'package:sign_learn/routes/sign_learn_router.gr.dart';

import 'route_guard.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// part 'sign_learn_router.gr.dart';

final signRouteProvider = Provider<SignRouter>((ref) {
  return SignRouter(signAuthGuard: ref.watch(authGuardProvider));
});

class TransitionsBuilder {
  static Widget cupertino(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    /// you get an animation object and a widget
    /// make your own transition
    // return FadeTransition(opacity: animation, child: child);
    return CupertinoPageTransition(
      primaryRouteAnimation: animation,
      secondaryRouteAnimation: secondaryAnimation,
      linearTransition: true,
      child: child,
    );
  }
}

@AutoRouterConfig(replaceInRouteName: 'Page|View|Screen,Route')
class SignRouter extends RootStackRouter {
  SignRouter({required this.signAuthGuard});
  AuthGuard signAuthGuard;

  @override
  List<AutoRoute> get routes => [
        // ~ Initial routes
        routeWithTransition(
          initial: true,
          page: AuthInitRoute.page,
          path: '/auth-init',
        ),

        routeWithTransition(page: SignSplashRoute.page),

        routeWithTransition(page: SignIntroRoute.page),

        // ~ Login Routes
        routeWithTransition(
          initial: false,
          // initial: true,
          page: LoginRoute.page,
          // keepInHistory: false,
        ),
        routeWithTransition(
          initial: false,
          page: SignupRoute.page,
          // keepInHistory: false,
        ),

        //  ~ Home Routes
        routeWithTransition(
          initial: false,
          page: SkeletonTabRoute.page,
          children: [
            routeWithTransition(page: HomeRoute.page),
            routeWithTransition(page: DictionaryRoute.page),
            routeWithTransition(page: ProfileRoute.page),
          ],
          guards: [signAuthGuard],
        ),
        // ~ Settings Routes
        routeWithTransition(initial: false, page: SettingsRoute.page),

        // ~ Lesson Routes
        routeWithTransition(
          initial: false,
          page: LessonListRoute.page,
          transitionsBuilder: TransitionsBuilder.cupertino,
        ),

        routeWithTransition(initial: false, page: LessonDetailRoute.page),

        // ~ Dictionary View
        routeWithTransition(
          page: DictionaryEntryDetailRoute.page,
          transitionsBuilder: TransitionsBuilder.cupertino,
        ),

        //  ~ Profile EditView
        routeWithTransition(page: ProfileEditRoute.page),
      ];

  CustomRoute routeWithTransition({
    required PageInfo page,
    bool initial = false,
    String? path,
    Widget Function(
      BuildContext,
      Animation<double>,
      Animation<double>,
      Widget,
    )? transitionsBuilder = TransitionsBuilders.fadeIn,
    List<AutoRoute>? children,
    List<AutoRouteGuard>? guards,
    bool keepInHistory = true,
  }) {
    return CustomRoute(
      path: path,
      page: page,
      initial: initial,
      transitionsBuilder: transitionsBuilder,
      duration: Duration(milliseconds: 400),
      children: children,
      guards: guards ?? [],
      keepHistory: keepInHistory,
    );
  }
}
