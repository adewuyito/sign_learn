import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/features/auth/domain/domain.dart'
    show AuthResult, authNotifierProvider;

final isLoggedInProvider = Provider<bool>((ref) {
  final authState = ref.watch(authNotifierProvider);
  // final authStateFromProvider = ref.watch(authStateProvider); // TODO: Remove this part if Notifier is working

  return authState.result == AuthResult.success();
  //  || authStateFromProvider.result == AuthResult.success();
});
