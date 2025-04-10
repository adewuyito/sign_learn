import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sign_learn/common/commons.dart';
part 'auth_state.freezed.dart';

@freezed
class AuthResult with _$AuthResult {
  const factory AuthResult.unknown() = AuthUnknown;
  const factory AuthResult.initial() = AuthInitial;
  const factory AuthResult.accountCreated() = AuthAccountCreated;
  const factory AuthResult.success() = AuthSuccess;
  const factory AuthResult.error(String error) = AuthError;
}

/*
  The state notifier created from the state object [AuthState] class
  would act as the abstraction layer
  Riverpod would use to carry out our 
*/
@immutable
class AuthState {
  final AuthResult result;
  final bool isLoading;
  final UserId? userId; //ToDO: Convert to UserId

  const AuthState({
    required this.result,
    required this.isLoading,
    required this.userId,
  });
  // On start the application does not have information about the user to be logged in
  // We'd be creating a constant constructor to setup [AuthState]
  // to unkown

  AuthState.unknown()
      : result = AuthResult.unknown(),
        isLoading = false,
        userId = null;

  // Used to get the instance of
  // the authstate with the isLoading flipped
  AuthState copiedWithIsLoading(bool isLoading) => AuthState(
        result: result,
        isLoading: isLoading,
        userId: userId,
      );

  // With riverpod is very important to implement equality to your models
  // when its providing you with new values its checks for the equality to the previous value
  @override
  bool operator ==(covariant AuthState other) =>
      identical(this, other) ||
      (result == other.result &&
          isLoading == other.isLoading &&
          userId == other.userId);

  @override
  int get hashCode => Object.hash(
        result,
        isLoading,
        userId,
      );

  @override
  String toString() => '''
          AuthState
          ---------
    result: $result, 
    isLoading: $isLoading, 
    userId: $userId)
      ''';
}
