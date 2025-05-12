import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/data.dart';

final getProfileProvider = Provider(
  (ref) => GetUserProfile(ref.watch(profileRepositoryProvider)),
);

class GetUserProfile {
  final IProfileRepository repository;

  GetUserProfile(this.repository);

  Future<UserInfoModel?> call(String userId) async {
    return await repository.getUserData(userId: userId);
  }
}