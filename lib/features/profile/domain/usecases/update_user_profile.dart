import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/data.dart';




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