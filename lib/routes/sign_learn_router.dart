import 'package:sign_learn/features/quiz/presentation/presentation.dart';
import 'package:sign_learn/features/quiz/presentation/example_multi_choice_view.dart';
import 'package:sign_learn/features/quiz/presentation/quiz_score_view.dart';
import 'package:sign_learn/routes/sign_learn_router.gr.dart';

import 'route_guard.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// part 'sign_learn_router.gr.dart';

final signRouteProvider = Provider<SignRouter>((ref) {
  return SignRouter(
      signAuthGuard: ref.watch(authGuardProvider),
      connectionGuard: ref.watch(connectionGuardProvider));
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
  SignRouter({required this.signAuthGuard, required this.connectionGuard});
  AuthGuard signAuthGuard;
  ConnectionGuard connectionGuard;

  @override
  List<AutoRoute> get routes => [
        // ~ Initial routes
        routeWithTransition(
          initial: true,
          page: AuthInitRoute.page,
          path: '/auth-init',
        ),

        routeWithTransition(
          page: SignSplashRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),

        routeWithTransition(
          page: SignIntroRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),

        // ~ Login Routes
        routeWithTransition(
          initial: false,
          page: LoginRoute.page,
        ),
        routeWithTransition(
          initial: false,
          page: SignupRoute.page,
        ),

        //  ~ Home Routes
        routeWithTransition(
          page: SkeletonTabRoute.page,
          children: [
            routeWithTransition(page: HomeRoute.page),
            routeWithTransition(page: DictionaryRoute.page),
            routeWithTransition(page: ProfileRoute.page),
          ],
          guards: [
            connectionGuard,
            signAuthGuard,
          ],
        ),

        routeWithTransition(page: QuizDetailRoute.page),

        // ~ Quiz Score View
        routeWithTransition(
          page: QuizScoreRoute.page,
          transitionsBuilder: TransitionsBuilder.cupertino,
        ),

        // ~ Example Multi-Choice View
        routeWithTransition(
          page: ExampleMultiChoiceRoute.page,
          transitionsBuilder: TransitionsBuilder.cupertino,
        ),

        // ~ Settings Routes
        routeWithTransition(
          initial: false,
          page: SettingsRoute.page,
          guards: [connectionGuard],
        ),

        // ~ Lesson Routes
        routeWithTransition(
          initial: false,
          page: LessonListRoute.page,
          transitionsBuilder: TransitionsBuilder.cupertino,
          guards: [connectionGuard],
        ),

        // ~ Dictionary View
        routeWithTransition(
          page: DictionaryEntryDetailRoute.page,
          transitionsBuilder: TransitionsBuilder.cupertino,
          guards: [connectionGuard],
        ),

        //  ~ Profile EditView
        routeWithTransition(
          page: ProfileEditRoute.page,
          guards: [connectionGuard],
        ),

        // ~ No Connection View
        routeWithTransition(page: NoConnectionRoute.page),

        // ~ Exess routes
        // ~ Firebase Firestore Upload
        routeWithTransition(page: FirebaseFirestoreUpload.page),

        // ~ Advanced Video Player
        routeWithTransition(page: LessonListWidget.page),

        // ~ GPT Lesson View
        routeWithTransition(page: LessonRoute.page),

        // ~
        routeWithTransition(page: SecondLessonDetailRoute.page),

        // ~
        routeWithTransition(page: LessonsByLevelRoute.page),
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
