import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/features/profile/data/repositories/profile_repository.dart';



final updateProfileProvider = Provider(
  (ref) => UpdateUserProfile(ref.watch(profileRepositoryProvider)),
);

class UpdateUserProfile {
  final IProfileRepository repository;

  UpdateUserProfile(this.repository);

  Future<void> call(String lessonId) async {
    // await repository.markLessonCompleted(lessonId); // TODO Fix with the right implementation
  }
}