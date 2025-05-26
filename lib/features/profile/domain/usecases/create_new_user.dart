import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/data.dart';

final createUserProfileProvider = Provider(
  (ref) => CreateUserProfile(ref.watch(profileRepositoryProvider)),
);

class CreateUserProfile {
  final IProfileRepository repository;

  CreateUserProfile(this.repository);

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
