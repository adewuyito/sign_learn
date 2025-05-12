import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/data.dart';


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