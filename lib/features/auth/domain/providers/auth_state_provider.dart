import 'states/states.dart';
import 'package:riverpod/riverpod.dart';
import '../notifier/auth_state_notifier.dart';
import '../notifier/auth_notifier.dart';

// ignore: unused_element
final _authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
  (ref) => AuthStateNotifier(ref),
);

final authNotifierProvider =
    NotifierProvider<AuthNotifier, AuthState>(AuthNotifier.new);
