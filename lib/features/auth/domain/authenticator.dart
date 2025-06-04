import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

import '../../../common/commons.dart' show UserId;
import 'providers/states/auth_state.dart';
import 'providers/auth_state_provider.dart';

class Authenticator {
  Authenticator(this.ref);

  final Ref ref;

  User? get _currentUser => ref.read(firebaseAuthProvider).currentUser;
  UserId? get userId => _currentUser?.uid;

  bool get isAlreadyLoggedIn => userId != null;
  String? get email => _currentUser?.email;
  String? get displayImage => _currentUser?.photoURL;
  String? get profileDefaultImage => _staticDisplay;
  String get displayName => _currentUser?.displayName ?? '';

  String? _staticDisplay;

  Future<void> logOut() async {
    // Sign out of all possible account forms
    await ref.read(firebaseAuthProvider).signOut();
  }

  Future<AuthResult> loginWithCredential({
    required String email,
    required String password,
  }) async {
    try {
      await ref.read(firebaseAuthProvider).signInWithEmailAndPassword(
            email: email,
            password: password,
          );

      return AuthResult.success();
    } catch (e) {
      return AuthResult.error(e.toString());
    }
  }

  Future<AuthResult> signUpWithCredential({
    required String email,
    required String password,
  }) async {
    try {
      await ref.read(firebaseAuthProvider).createUserWithEmailAndPassword(
            email: email,
            password: password,
          );

      return AuthResult.accountCreated();
    } catch (e) {
      return AuthResult.error(e.toString());
    }
  }

  Future<bool> updateUserName({required String newName}) async {
    try {
      final _user = _currentUser;
      if (_user != null) {
        await _user.updateProfile(displayName: newName);
        await _user.reload();
      }
      return true;
    } catch (e) {
      debugPrint('Failed to update user name: $e');
      return false;
    }
  }

  // TODO:  What is this implementation
  Future<String?> getStaticProfileImageDownloadURL() async {
    try {
      // Create a reference to the file location in the Firebase Storage
      final storageRef =
          FirebaseStorage.instance.ref().child('shared/profile_image.png');

      // Get the download URL
      final downloadURL = await storageRef.getDownloadURL();

      return downloadURL;
    } catch (e) {
      return null;
    }
  }
}

// TODO: Remove any ref to authenticator  ~ what is userPrevider for?
