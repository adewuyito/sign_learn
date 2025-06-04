import 'package:riverpod/riverpod.dart';
import 'package:sign_learn/common/typedefs.dart';
import 'package:sign_learn/features/shared/network_provider.dart';
import '../data.dart';

final profileRepositoryProvider = Provider<IProfileRepository>((ref) {
  return ProfileRepository(
    ref,
    ref.watch(profileLocalSourceProvider),
    ref.watch(profileRemoteSourceProvider),
  );
});

abstract class IProfileRepository {
  Future<UserInfoModel?> getUserData({required UserId userId});
  Future<bool> saveUserInfo({
    required UserId userId,
    required String? fullname,
    required String? email,
  });
  Future<bool> isUser({required UserId userId});
}

class ProfileRepository implements IProfileRepository {
  Ref ref;
  final IProfileLocalSource localSource;
  final IProfileRemoteSource remoteSource;

  ProfileRepository(this.ref, this.localSource, this.remoteSource);

  @override
  Future<UserInfoModel?> getUserData({required UserId userId}) async {
    if (await ref.watch(isConnectedNetworkInfoProvider.future)) {
      final remote = await remoteSource.getUser(userId);
      // await localSource.saveUser(remote);
      return remote;
    } else {
      return await localSource.getUser();
    }
  }

  @override
  Future<bool> saveUserInfo({
    required UserId userId,
    required String? fullname,
    required String? email,
  }) async {
    final user = UserInfoModel(
      userId: userId,
      displayName: fullname,
      email: email,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    if (await ref.watch(isConnectedNetworkInfoProvider.future)) {
      await remoteSource.createUser(user);
      return true;
    }
    try {
      await localSource.saveUser(user);
    } catch (_) {
      return false;
    }

    return true;
  }

  @override
  Future<bool> isUser({required UserId userId}) async {
    if (await ref.watch(isConnectedNetworkInfoProvider.future)) {
      return remoteSource.userExist(userId);
    } else {
      final localUser = await localSource.getUser();
      return localUser != null;
    }
  }
}
