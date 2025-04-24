import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/features/auth/domain/authenticator.dart';

import '../../../profile/presentation/provider/user_payload_provider.dart';
import '../../../../core/core.dart';
import '../../auth.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final Ref ref;
  final _authenticator = Authenticator();
  // final _userInfoStorage = const UserInfoStorage();

  // A constructor to get the state of AuthState on reading of riverPod
  // if the state gets a logged in query back the state would change to
  // an AuthState having its logged in state a successfull and the loading tag set to false.
  /// Constructor for [AuthStateNotifier]
  AuthStateNotifier(this.ref) : super(AuthState.unknown()) {
    if (_authenticator.isAlreadyLoggedIn) {
      state = AuthState(
        result: AuthResult.success(),
        isLoading: false,
        userId: _authenticator.userId,
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

    try {
      final AuthResult result = await _authenticator.loginWithCredential(
        email: email,
        password: password,
      );

      state = switch (result) {
        AuthSuccess() => () {
            final userId = _authenticator.userId; // ~ Id Not set yet
            // ref.read(userNotiferProvider.notifier).updateUser(
            //       id: userId!,
            //       name: _authenticator.displayName,
            //       email: _authenticator.email,
            //       displayImage: _authenticator.displayImage ??
            //           _authenticator.profileDefaultImage,
            //     );
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
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
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

    /*  switch (result) {
      case AuthResult.accountCreated:
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
        state = AuthState(
          result: AuthResult.success(),
          isLoading: false,
          userId: userId,
        );
        if (context.mounted) {
          SnackbarUtils.of(context).signSnackBar("Account Created", false);
        }
        break;
      case AuthResult.error:
        // TODO : Show snack bar
        if (context.mounted) {
          SnackbarUtils.of(context)
              .signSnackBar("An error occured: ${result.toString()}", false);
        }
        break;
      default:
    } */

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
