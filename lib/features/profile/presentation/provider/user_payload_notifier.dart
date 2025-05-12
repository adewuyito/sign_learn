// Notifier to manage the user state
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/features/auth/domain/authenticator.dart';
import 'package:sign_learn/features/auth/domain/providers/is_logged_provider.dart';
import 'package:sign_learn/features/features.dart';
import 'package:sign_learn/features/profile/domain/usecases/get_profile.dart';

import '../../../../common/commons.dart' show UserId;
import '../../../../core/core.dart';
import '../../data/model/user_model.dart';
/* 
class UserProfileNotifier extends StateNotifier<UserInfoModel> {
  UserProfileNotifier() : super(const UserInfoModel.unknown());

  UserInfoModel get user => state;

  // Function to set the user (e.g., on login)
  void setUser(UserInfoModel user) {
    state = user;
  }

  // Function to update user information
  void updateUser({
    required UserId id,
    String? name,
    String? email,
    String? displayImage,
  }) {
    state = state.copyWith(
      userId: id,
      email: email ?? state.email,
      fullname: name ?? state.fullname,
      displayImage: displayImage ?? state.displayImage,
    );
  }

  // Function to clear the user state (e.g., on logout)
  void clearUser() {
    state = const UserInfoModel.unknown();
  }
} */

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

  void updateUser({
    required UserId id,
    String? name,
    String? email,
    String? displayImage,
  }) {
    state = state.copyWith(
      userId: id,
      email: email ?? state.email,
      fullname: name ?? state.fullname,
      displayImage: displayImage ?? state.displayImage,
    );
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
