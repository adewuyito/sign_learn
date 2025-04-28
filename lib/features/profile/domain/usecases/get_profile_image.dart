import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/features/profile/data/repositories/profile_repository.dart';



final getProfileImageProvider = Provider(
  (ref) => GetProfileImage(ref.watch(profileRepositoryProvider)),
);

class GetProfileImage {
  final IProfileRepository repository;

  GetProfileImage(this.repository);

  Future<void> call(String lessonId) async {
    // await repository.markLessonCompleted(lessonId); // TODO Fix with the right implementation
  }
}