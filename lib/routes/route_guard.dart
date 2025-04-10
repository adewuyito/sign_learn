import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/routes/sign_learn_router.gr.dart';

import '../features/auth/domain/providers/is_logged_provider.dart';

final authGuardProvider = Provider<AuthGuard>((ref) {
  return AuthGuard(ref);
});

class AuthGuard extends AutoRouteGuard {
  AuthGuard(Ref ref) : _ref = ref;

  // ignore: prefer_final_fields
  Ref _ref;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    switch (_ref.watch(isLoggedInProvider)) {
      case true:
        resolver.next(true);
        break;
      case false:
        final result = await router.push<bool>(LoginRoute());

        switch (result) {
          case true:
            resolver.next(true);
            break;
          case false:
            resolver.next(false);
            break;
          case null:
            // TODO: Handle this case.
            throw UnimplementedError(
              'You have gotten a null type from implementation of guard',
            );
        }
        break;
    }
  }
}
