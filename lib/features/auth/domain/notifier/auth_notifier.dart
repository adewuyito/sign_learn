import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

import '../../../../core/core.dart' show SnackbarUtils;
import '../../../profile/presentation/provider/provider.dart';
import '../../../profile/profile.dart';
import '../../auth.dart';
import '../authenticator.dart';

class AuthNotifier extends Notifier<AuthState> {
  @override
  build() {
    return (_authenticator.isAlreadyLoggedIn)
        ? AuthState(
            result: AuthResult.success(),
            isLoading: false,
            userId: _authenticator.userId,
          )
        : AuthState.unknown();
  }

  late final _authenticator = Authenticator(ref);

  String get displayName => _authenticator.displayName;
  String get email => _authenticator.email ?? '';

  void setSuccessState() {
    state = state.copiedWithIsLoading(true);
    if (state.result == AuthResult.accountCreated()) {
      state = AuthState(
        result: AuthResult.success(),
        isLoading: false,
        userId: state.userId,
      );
    }
  }

  /// Provider created to use riverpod for logout
  Future<void> logOut({required BuildContext context}) async {
    state = state.copiedWithIsLoading(true);
    await _authenticator.logOut();
    ref.read(userNotiferProvider.notifier).clearUser();
    state = AuthState.unknown();
    if (context.mounted) {
      SnackbarUtils.of(context).signSnackBar("Logged Out", true);
    }
  }

  Future<void> loginWithCredentials({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = state.copiedWithIsLoading(true);

    final AuthResult result = await _authenticator.loginWithCredential(
      email: email,
      password: password,
    );

    state = switch (result) {
      AuthSuccess() => () {
          final userId = _authenticator.userId;
          if (context.mounted) {
            SnackbarUtils.of(context)
                .signSnackBar("Logged in Successfully", false);
          }
          return AuthState(
            result: result,
            isLoading: false,
            userId: userId,
          );
        }(),
      AuthError(error: final message) => () {
          if (context.mounted) {
            SnackbarUtils.of(context).signSnackBar("Error: $message", true);
          }
          return AuthState(
            result: result,
            isLoading: false,
            userId: null,
          );
        }(),
      AuthUnknown() => () {
          if (context.mounted) {
            SnackbarUtils.of(context)
                .signSnackBar("Unknown error occurred", true);
          }
          return AuthState(
            result: result,
            isLoading: false,
            userId: null,
          );
        }(),
      _ => AuthState(
          result: result,
          isLoading: false,
          userId: null,
        )
    };
  }

  Future<void> signUpWithCredentials({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = state.copiedWithIsLoading(true);

    final result = await _authenticator.signUpWithCredential(
      email: email,
      password: password,
    );

    state = await switch (result) {
      AuthAccountCreated() => Future(
          () async {
            final userId = _authenticator.userId;
            final currentUser = ref.read(firebaseAuthProvider).currentUser;
            if (currentUser != null) {
              await currentUser.updateDisplayName(name);
              currentUser.reload();
            } else {
              debugPrint("No current user");
            }

            ref.read(userNotiferProvider.notifier).updateUser(
                  id: userId!,
                  displayName: _authenticator.displayName,
                  email: _authenticator.email,
                  displayImage: _authenticator.displayImage ??
                      _authenticator.profileDefaultImage,
                );
            if (context.mounted) {
              SnackbarUtils.of(context).signSnackBar("Account Created", false);
            }

            return AuthState(
              result: AuthResult.accountCreated(),
              isLoading: false,
              userId: userId,
            );
          },
        ),
      AuthError(error: final message) => Future(
          () {
            if (context.mounted) {
              SnackbarUtils.of(context)
                  .signSnackBar("An error occurred: $message", true);
            }
            return AuthState(
              result: result,
              isLoading: false,
              userId: null,
            );
          },
        ),
      _ => Future(
          () => AuthState(
            result: result,
            isLoading: false,
            userId: null,
          ),
        )
    };
  }

  Future<void> updateUserName({
    required String name,
    required BuildContext context,
  }) async {
    state = state.copiedWithIsLoading(true);

    final result = await _authenticator.updateUserName(newName: name);

    if (result != false) {
      ref
          .read(userNotiferProvider.notifier)
          .updateUser(id: state.userId!, displayImage: name);
      if (context.mounted) {
        SnackbarUtils.of(context).signSnackBar("Seccesful", false);
      }
    } else {
      if (context.mounted) {
        SnackbarUtils.of(context).signSnackBar("Error updating Name");
      }
    }

    state = state.copiedWithIsLoading(false);
  }

  // Future<void> saveUserInfo({
  //   required userId,
  // }) async {
  //   final result = await ref.read(profileRemoteSourceProvider).saveUserInfo(
  //         userInfo: UserInfoModel(
  //           userId: userId,
  //           displayName: displayName,
  //           email: email,
  //         ),
  //       );
  //   debugPrint("Ran profile Storage: RESULT ==> $result");
  // }

  // ~ UnUsed because all profile is gotten from firebase auth
  // Future<void> _saveUserInfo({
  //   required userId,
  // }) {
  //   return _userInfoStorage.saveUserInfo(
  //     userId: userId,
  //     fullname: _authenticator.displayName,
  //     email: _authenticator.email,
  //   );
  // }
}
