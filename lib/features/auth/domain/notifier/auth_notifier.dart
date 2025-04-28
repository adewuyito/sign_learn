import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:sign_learn/features/auth/auth.dart';
import 'package:sign_learn/features/profile/data/model/user_model.dart';

import '../../../../core/core.dart' show SnackbarUtils;
import '../../../profile/presentation/provider/user_payload_provider.dart';
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

  final _authenticator = Authenticator();

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
            await _authenticator.user!.updateDisplayName(name);
            _authenticator.user!.reload();
            ref.read(userNotiferProvider.notifier).updateUser(
                  id: userId!,
                  name: _authenticator.displayName,
                  email: _authenticator.email,
                  displayImage: _authenticator.displayImage ??
                      _authenticator.profileDefaultImage,
                );
            if (context.mounted) {
              SnackbarUtils.of(context).signSnackBar("Account Created", false);
            }
            return AuthState(
              result: AuthResult.success(),
              isLoading: false,
              userId: userId,
            );
          },
        ),
      AuthError(error: final message) => Future(
          () {
            if (context.mounted) {
              SnackbarUtils.of(context)
                  .signSnackBar("An error occurred: $message", false);
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

    // ~
    // if (result == AuthResult.success && userId != null) {
    //   await _saveUserInfo(userId: userId);
    // }
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
