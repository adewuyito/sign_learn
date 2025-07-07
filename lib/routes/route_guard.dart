import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/routes/sign_learn_router.gr.dart';
import 'package:sign_learn/features/shared/network_provider.dart';

import '../features/auth/domain/providers/is_logged_provider.dart';
import '../features/profile/profile.dart';

final authGuardProvider = Provider<AuthGuard>((ref) {
  return AuthGuard(ref);
});

class AuthGuard extends AutoRouteGuard {
  AuthGuard(Ref ref) : _ref = ref;

  // ignore: prefer_final_fields
  Ref _ref;
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final isLoggedIn = _ref.watch(isLoggedInProvider);

    if (isLoggedIn) {
      resolver.next();
      _ref.read(userNotiferProvider.notifier).initUser();
    } else {
      final result = await router.replace<bool>(const LoginRoute());
      if (result == true) {
        resolver.next(true);
        // _ref.read(userNotiferProvider.notifier).initUser();
      } else {
        resolver.next(false);
      }
    }
  }
}

final connectionGuardProvider = Provider<ConnectionGuard>((ref) {
  return ConnectionGuard(ref);
});

class ConnectionGuard extends AutoRouteGuard {
  ConnectionGuard(Ref ref) : _ref = ref;

  // ignore: prefer_final_fields
  Ref _ref;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final isConnected = await _ref.watch(isConnectedProvider.future);

    if (isConnected) {
      // debugPrint("There is an active connection");
      resolver.next();
    } else {
      final result = await router.push<bool>(const NoConnectionRoute());
      if (result == true) {
        resolver.next(true);
      } else {
        resolver.next(false);
      }
    }
  }
}
