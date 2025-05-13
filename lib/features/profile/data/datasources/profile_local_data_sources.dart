import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/core/services/services.dart';

import '../../../../common/commons.dart';
import '../model/model.dart';

const String profileLocation = 'user_profile';

final profileLocalSourceProvider = Provider<IProfileLocalSource>((ref) {
  final _ppref = ref.watch(sharedPrefStorageProvider);

  return ProfileLocalSource(ref, _ppref);
});

abstract class IProfileLocalSource {
  Future<UserInfoModel> getUserData({
    required UserId userId,
  });

  Future<bool> saveUserInfo({
    required UserId userId,
    required String? fullname,
    required String? email,
  });

  Future<bool> isUser({
    required UserId userId,
  });
}

class ProfileLocalSource implements IProfileLocalSource {
  Ref ref;
  StorageService prefProvider;
  ProfileLocalSource(this.ref, this.prefProvider);

  @override
  Future<UserInfoModel> getUserData({required userId}) {
    // TODO: implement getUserData
    throw UnimplementedError();
  }

  @override
  Future<bool> isUser({required userId}) async {
    try {
      final rp = await prefProvider.get(profileLocation);
      // TODO: Unimplimented error
      return true;
    } catch (e) {
      throw Exception('');
    }
  }

  @override
  Future<bool> saveUserInfo({
    required userId,
    required String? fullname,
    required String? email,
  }) async {
    try {
      await prefProvider.set(
        profileLocation,
        UserInfoPayload(
          userId: userId,
          email: email,
          fullname: fullname,
        ),
      );
      final rp = await prefProvider.get(profileLocation);
      if (!rp) {
        return false;
      }
      return true;
    } catch (e) {
      throw Exception('Unable to save user information');
    }
  }
}
