import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/core/services/services.dart';

import '../model/model.dart';

const String profileLocation = 'user_profile';

final profileLocalSourceProvider = Provider<IProfileLocalSource>((ref) {
  final _ppref = ref.watch(sharedPrefStorageProvider);

  return ProfileLocalSource(ref, _ppref);
});

abstract class IProfileLocalSource {
  Future<void> saveUser(UserInfoModel user);
  Future<UserInfoModel?> getUser();
  Future<void> deleteUser();
}

class ProfileLocalSource implements IProfileLocalSource {
  Ref ref;
  StorageService prefProvider;
  ProfileLocalSource(this.ref, this.prefProvider);
  static const _key = 'local_user_info';

  @override
  Future<void> saveUser(UserInfoModel user) async {
    final jsonString = jsonEncode(user.toJson());
    await prefProvider.set(_key, jsonString);
  }

  @override
  Future<UserInfoModel?> getUser() async {
    final jsonString = prefProvider.get(_key);
    if (jsonString == null) return null;

    try {
      final Map<String, dynamic> json = jsonDecode(jsonString);
      return UserInfoModel.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> deleteUser() async {
    await prefProvider.remove(_key);
  }
}
