import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/features/auth/data/data.dart';

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return AuthRepository(ref);
});

abstract class IAuthRepository {}

class AuthRepository implements IAuthRepository {
  AuthRepository(this.ref)
      : authRemoteSource = ref.watch(authRemoteSourceProvider),
        authLocalSource = ref.watch(authLocalSourceProvider);

  final Ref ref;

  IAuthRemoteSource authRemoteSource;
  IAuthLocalSource authLocalSource;
}
