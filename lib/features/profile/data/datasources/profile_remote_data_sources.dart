import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/common/typedefs.dart';
import 'package:sign_learn/features/profile/data/model/user_model_payload.dart';

final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);

final profileRemoteSourceProvider = Provider<IProfileRemoteSource>(
  (ref) {
    final firestore = ref.watch(firestoreProvider);
    return ProfileRemoteSource(ref, firestore: firestore);
  },
);

abstract class IProfileRemoteSource {
  Future<bool> saveUserInfo({
    required UserId userId,
    required String? fullname,
    required String? email,
  });
}

class ProfileRemoteSource implements IProfileRemoteSource {
  Ref ref;
  final FirebaseFirestore firestore;
  ProfileRemoteSource(this.ref, {required this.firestore});

  @override
  Future<bool> saveUserInfo({
    required UserId userId,
    required String? fullname,
    required String? email,
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
        await userInfo.docs.first.reference.update({
          'fullname': fullname,
          'email': email ?? '',
        });

        return true;
      } else {
        final payLoad = UserInfoPayload(
          userId: userId,
          email: email,
          fullname: fullname,
        );
        await firestore
            .collection('users')
            .doc(userId)
            .set(payLoad);
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
