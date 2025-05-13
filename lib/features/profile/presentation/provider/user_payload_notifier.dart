// Notifier to manage the user state
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/commons.dart' show UserId;
import '../../../../core/core.dart';
import '../../../auth/auth.dart';
import '../../profile.dart'
    show UserInfoModel, getProfileProvider, setProfileProvider;

class UserPayloadNotifier extends Notifier<UserInfoModel> {
  @override
  build() {
    return UserInfoModel.unknown();
  }

  UserInfoModel get user => state;

  // Getters for all user variables
  UserId? get userId => state.userId;
  String get fullname => state.fullname;
  String? get email => state.email;
  String? get displayImage => state.displayImage;

  void setUser(UserInfoModel user) {
    state = user;
  }

  Future<void> updateUser({
    required UserId id,
    String? name,
    String? email,
    String? displayImage,
  }) async {
    try {
      final userdata = await ref.read(setProfileProvider).call(
            userId: id,
            fullname: name,
            email: email,
          );

      if (userdata) {
        state = state.copyWith(
          userId: id,
          email: email ?? state.email,
          fullname: name ?? state.fullname,
          displayImage: displayImage ?? state.displayImage,
        );
      }
    } catch (e) {
      throw Exception('Unable to update user information');
    }
  }

  void clearUser() {
    state = const UserInfoModel.unknown();
  }

  void initUser() async {
    if (ref.watch(isLoggedInProvider)) {
      final authUser = ref.watch(authNotifierProvider);
      final _user = await ref.read(getProfileProvider).call(authUser.userId!);
      // ~ Set the user lesson lock
      final asllessonLock =
          await ref.read(sharedPrefStorageProvider).get(lessonLock);
      if (asllessonLock == null) {
        await ref
            .read(sharedPrefStorageProvider)
            .set(lessonLock, ['open', 'lock', 'lock', 'lock']);
      }

      state = _user ?? UserInfoModel.unknown();
    }
  }
}
