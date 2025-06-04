// Notifier to manage the user state
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/commons.dart' show UserId;
import '../../../../core/core.dart';
import '../../../auth/auth.dart';
import '../../profile.dart';

class UserPayloadNotifier extends Notifier<UserInfoModel> {
  @override
  build() {
    return UserInfoModel.unknown();
  }

  UserInfoModel get user => state;

  // Getters for all user variables
  UserId? get userId => state.userId;
  String? get fullname => state.displayName;
  String? get email => state.email;
  String? get displayImage => state.displayImage;

  void setUser(UserInfoModel user) {
    state = user;
  }

  Future<void> updateUser({
    required UserId id,
    String? displayName,
    String? email,
    String? displayImage,
  }) async {
    try {
      final result = await ref.read(profileRemoteSourceProvider).saveUserInfo(
            userInfo: UserInfoModel(
              userId: id,
              displayName: displayName,
              email: email,
            ),
          );

      if (result) {
        state = state.copyWith(
          userId: id,
          email: email ?? state.email,
          displayName: displayName ?? state.displayName,
          displayImage: displayImage ?? state.displayImage,
        );
      } else {
        debugPrint("unable to cerate user from user_payload_notifier");
      }
    } catch (e) {
      throw Exception('Unable to update user information');
    }
  }

  void clearUser() {
    state = const UserInfoModel.unknown();
  }

  void initUser() async {
    if (!ref.watch(isLoggedInProvider)) return;

    final authUser = ref.watch(authNotifierProvider);
    debugPrint("Auth Result: ${authUser.result.toString()}");

    try {
      if (authUser.result == AuthResult.accountCreated()) {
        // await ref.read(createUserProfileProvider).call(
        //       userId: authUser.userId!,
        //       fullname: ref.read(authNotifierProvider.notifier).displayName,
        //       email: ref.read(authNotifierProvider.notifier).email,
        //     );
      } else if (authUser.result == AuthResult.success()) {
        final _user = await ref.read(getProfileProvider).call(authUser.userId!);
        if (_user != null) {
          state = _user;
        }

        // Initialize lesson lock if not exists
        final asllessonLock =
            await ref.read(sharedPrefStorageProvider).get(lessonLock);
        if (asllessonLock == null) {
          await ref
              .read(sharedPrefStorageProvider)
              .set(lessonLock, ['open', 'lock', 'lock', 'lock']);
        }
      }
    } catch (e) {
      state = UserInfoModel.unknown();
      throw Exception('Failed to initialize user: ${e.toString()}');
    }
  }
}
