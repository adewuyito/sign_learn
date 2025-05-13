import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/common/typedefs.dart';

import '../model/model.dart';

final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);

final profileRemoteSourceProvider = Provider<IProfileRemoteSource>(
  (ref) {
    final firestore = ref.watch(firestoreProvider);
    return ProfileRemoteSource(ref, firestore: firestore);
  },
);

abstract class IProfileRemoteSource {
  Future<UserInfoModel> getUserData({
    required UserId userId,
  });

  Future<bool> saveUserInfo({
    required UserId userId,
    required String? fullname,
    required String? email,
  });

  Future<bool> isUser({
    required UserId userId,
  });
}

class ProfileRemoteSource implements IProfileRemoteSource {
  Ref ref;
  final FirebaseFirestore firestore;
  ProfileRemoteSource(this.ref, {required this.firestore});

  @override
  Future<bool> isUser({
    required UserId userId,
  }) async {
    try {
      // This is a reference to the user's information in the database
      final userInfo = await firestore
          .collection(
            'users',
          )
          .where(
            'uid',
            isEqualTo: userId,
          )
          .limit(1)
          .get();

      // If the user's information is not found, then we create a new document
      if (userInfo.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> saveUserInfo({
    required UserId userId,
    required String? fullname,
    required String? email,
  }) async {
    try {
      // This is a reference to the user's information in the database
      final userInfo = await isUser(userId: userId);

      // If the user's information is not found, then we create a new document
      if (userInfo) {
        final payLoad = UserInfoPayload(
          userId: userId,
          email: email,
          fullname: fullname,
        );
        await firestore.collection('users').doc(userId).set(payLoad);
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  // ~ Get the user data
  @override
  Future<UserInfoModel> getUserData({required UserId userId}) async {
    try {
      final snapshot = await firestore.collection('users').doc(userId).get();
      if (!snapshot.exists) {
        throw UserNotFoundException();
      }
      final data =
          UserInfoModel.fromJson(snapshot.data() as Map<String, dynamic>);

      return data;
    } catch (e) {
      throw Exception('Failed to get user data: $e');
    }
  }
}

class UserNotFoundException implements Exception {
  static String message = 'User not found';
}
