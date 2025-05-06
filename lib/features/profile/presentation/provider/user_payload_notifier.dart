// Notifier to manage the user state
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/features/auth/domain/authenticator.dart';
import 'package:sign_learn/features/auth/domain/providers/is_logged_provider.dart';
import 'package:sign_learn/features/features.dart';

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
  final _authenticator = Authenticator();
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
      final user = ref.watch(authNotifierProvider);
      // ~ Sett the user lesson lock
      final asllessonLock =
          await ref.read(sharedPrefStorageProvider).get(lessonLock);
      if (asllessonLock == null) {
        await ref
            .read(sharedPrefStorageProvider)
            .set(lessonLock, ['open', 'lock', 'lock', 'lock']);
      }

      state = UserInfoModel(
        userId: user.userId!,
        email: _authenticator.email,
        fullname: _authenticator.displayName,
        displayImage: _authenticator.displayImage,
      );
    }
  }
}
