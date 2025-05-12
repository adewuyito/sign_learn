import 'package:riverpod/riverpod.dart';
import 'package:sign_learn/common/typedefs.dart';
import 'package:sign_learn/features/profile/data/model/user_model.dart';

import '../datasources/datasources.dart';


final profileRepositoryProvider = Provider<IProfileRepository>((ref) {
  return LessonRepository(
    ref,
  );
});

abstract class IProfileRepository {
  Future<UserInfoModel?> getUserData({
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

class LessonRepository implements IProfileRepository {
  Ref ref;

  LessonRepository(this.ref)
      : lessonLocalSource = ref.watch(profileLocalSourceProvider),
        lessonRemoteSource = ref.watch(profileRemoteSourceProvider);

  IProfileRemoteSource lessonRemoteSource;
  IProfileLocalSource lessonLocalSource;

  @override
  Future<UserInfoModel> getUserData({required UserId userId}) async {
    return await lessonRemoteSource.getUserData(userId: userId);
  }

  @override
  Future<bool> isUser({required UserId userId}) async {
    return await lessonRemoteSource.isUser(userId: userId);
  }

  @override
  Future<bool> saveUserInfo({
    required UserId userId,
    required String? fullname,
    required String? email,
  }) async {
    return await lessonRemoteSource.saveUserInfo(
      userId: userId,
      fullname: fullname,
      email: email,
    );
  }
}
