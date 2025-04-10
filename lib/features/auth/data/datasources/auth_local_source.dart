import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/core/services/storage/storage.dart';

final authLocalSourceProvider = Provider<IAuthLocalSource>((ref) {
  final sharedPrefStorageService = ref.watch(sharedPrefStorageProvider);

  return AuthLocalSource(sharedPrefStorageService);
});

abstract class IAuthLocalSource {
  /// gets the cached id token of the current firebase user
  String? getIdToken();

  /// store a id token of the current firebase user
  Future<void> cacheIdToken(String idToken);

  /// removes a stored id token
  Future<void> removeIdToken();
}

class AuthLocalSource implements IAuthLocalSource {
  AuthLocalSource(this.storageService);

  final StorageService storageService;

  final tokenStorageKey = 'tokenStorageKey';

  @override
  String? getIdToken() {
    final idToken = storageService.get(tokenStorageKey) as String?;

    return idToken;
  }

  @override
  Future<void> cacheIdToken(String idToken) async {
    await storageService.set(tokenStorageKey, idToken);
  }

  @override
  Future<void> removeIdToken() async {
    await storageService.remove(tokenStorageKey);
  }
}
