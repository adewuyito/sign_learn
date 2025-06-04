import 'package:firebase_auth/firebase_auth.dart';
import 'states/states.dart';
import 'package:riverpod/riverpod.dart';
import '../notifier/auth_notifier.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

// ignore: unused_element
// final _authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
//   (ref) => AuthStateNotifier(ref),
// );

final authNotifierProvider =
    NotifierProvider<AuthNotifier, AuthState>(AuthNotifier.new);
