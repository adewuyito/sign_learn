import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/common/typedefs.dart';
import 'package:sign_learn/features/profile/data/profile_exceptions.dart';

import '../model/model.dart';

final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);

final profileRemoteSourceProvider = Provider<IProfileRemoteSource>(
  (ref) {
    final firestore = ref.watch(firestoreProvider);
    return ProfileRemoteSource(ref, firestore: firestore);
  },
);

abstract class IProfileRemoteSource {
  Future<UserInfoModel> getUser(UserId userId);

  Future<void> createUser(UserInfoModel user);

  Future<void> updateUser(UserInfoModel user);

  Future<void> deleteUser(UserId userId);

  Future<bool> userExist(UserId userId);

  Future<UserInfoModel?> getUserByEmail(String email);

  Future<bool> saveUserInfo({required UserInfoModel userInfo});
}

class ProfileRemoteSource implements IProfileRemoteSource {
  final FirebaseFirestore firestore;
  Ref ref;

  ProfileRemoteSource(this.ref, {required this.firestore});
  static const String _collectionName = 'users';

  int _mapError(String code) {
    switch (code) {
      case 'permission-denied':
        return 403;
      case 'not-found':
        return 404;
      case 'already-exists':
        return 409;
      case 'resource-exhausted':
        return 429;
      case 'unauthenticated':
        return 401;
      default:
        return 500;
    }
  }

  @override
  Future<bool> saveUserInfo({required UserInfoModel userInfo}) async {
    try {
      // Add retry logic to handle race condition with Firebase function
      int retryCount = 0;
      const maxRetries = 3;
      const retryDelay = Duration(seconds: 1);

      while (retryCount < maxRetries) {
        try {
          final _userInfo = await firestore
              .collection(_collectionName)
              .doc(userInfo.userId)
              .get();

          if (_userInfo.exists) {
            // User exists, update the document
            await _userInfo.reference.update(userInfo.toFirestore());
            return true;
          } else {
            // Check if user exists using userExist method
            final exists = await userExist(userInfo.userId);
            if (exists) {
              // User was created by Firebase function, update it
              await firestore
                  .collection(_collectionName)
                  .doc(userInfo.userId)
                  .update(userInfo.toFirestore());
              return true;
            } else {
              // User doesn't exist yet, wait and retry
              if (retryCount < maxRetries - 1) {
                await Future.delayed(retryDelay);
                retryCount++;
                continue;
              }

              // If we've exhausted retries, create the user
              await firestore
                  .collection(_collectionName)
                  .doc(userInfo.userId)
                  .set(userInfo.toFirestore());
              return true;
            }
          }
        } on FirebaseException catch (e) {
          if (e.code == 'not-found' && retryCount < maxRetries - 1) {
            await Future.delayed(retryDelay);
            retryCount++;
            continue;
          }
          rethrow;
        }
      }
      return false;
    } catch (e) {
      debugPrint('Error saving user info: $e');
      return false;
    }
  }

  @override
  Future<void> createUser(UserInfoModel user) async {
    try {
      await firestore
          .collection(_collectionName)
          .doc(user.userId)
          .set(user.toFirestore());
    } on FirebaseException catch (e) {
      throw ServerException(
        message: e.message ?? '',
        statusCode: _mapError(e.code),
      );
    }
  }

  @override
  Future<void> updateUser(UserInfoModel user) async {
    try {
      await firestore
          .collection(_collectionName)
          .doc(user.userId)
          .update(user.toFirestore(forUpdate: true));
    } on FirebaseException catch (e) {
      throw ServerException(
        message: e.message ?? '',
        statusCode: _mapError(e.code),
      );
    }
  }

  @override
  Future<void> deleteUser(String userId) async {
    try {
      await firestore.collection(_collectionName).doc(userId).delete();
    } on FirebaseException catch (e) {
      throw ServerException(
          message: e.message ?? '', statusCode: _mapError(e.code));
    }
  }

  @override
  Future<UserInfoModel> getUser(String userId) async {
    try {
      final snapshot =
          await firestore.collection(_collectionName).doc(userId).get();
      if (!snapshot.exists) throw UserNotFoundException();
      return UserInfoModel.fromFirestore(snapshot);
    } on FirebaseException catch (e) {
      throw ServerException(
          message: e.message ?? '', statusCode: _mapError(e.code));
    }
  }

  @override
  Future<UserInfoModel?> getUserByEmail(String email) async {
    try {
      final query = await firestore
          .collection(_collectionName)
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      if (query.docs.isEmpty) return null;
      return UserInfoModel.fromFirestore(query.docs.first);
    } on FirebaseException catch (e) {
      throw ServerException(
          message: e.message ?? '', statusCode: _mapError(e.code));
    }
  }

  @override
  Future<bool> userExist(String userId) async {
    try {
      final doc = await firestore.collection(_collectionName).doc(userId).get();
      return doc.exists;
    } on FirebaseException catch (e) {
      throw ServerException(
          message: e.message ?? '', statusCode: _mapError(e.code));
    }
  }
}

class ServerException implements Exception {
  final String message;
  final int statusCode;

  const ServerException({
    required this.message,
    required this.statusCode,
  });

  @override
  String toString() => 'ServerException: $message (Status: $statusCode)';
}
