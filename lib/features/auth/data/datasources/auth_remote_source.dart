import 'package:hooks_riverpod/hooks_riverpod.dart';

final authRemoteSourceProvider = Provider<IAuthRemoteSource>((ref) {
  return AuthRemoteSource(ref);
});

abstract class IAuthRemoteSource {}

class AuthRemoteSource implements IAuthRemoteSource {
  AuthRemoteSource(this.ref);

  final Ref ref;
}
