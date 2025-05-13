import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/data.dart';

final setProfileProvider = Provider(
  (ref) => SetUserProfile(ref.watch(profileRepositoryProvider)),
);

class SetUserProfile {
  final IProfileRepository repository;

  SetUserProfile(this.repository);

  Future<bool> call({
    required String userId,
    required String? fullname,
    required String? email,
  }) async {
    return await repository.saveUserInfo(
      userId: userId,
      fullname: fullname,
      email: email,
    );
  }
}
