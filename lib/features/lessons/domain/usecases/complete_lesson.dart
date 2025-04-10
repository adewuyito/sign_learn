import 'package:riverpod/riverpod.dart';

import '../../data/data.dart';


final completeLessonProvider = Provider(
  (ref) => CompleteLesson(ref.watch(lessonRepositoryProvider)),
);

class CompleteLesson {
  final ILessonRepository repository;

  CompleteLesson(this.repository);

  Future<void> call(String lessonId) async {
    await repository.markLessonCompleted(lessonId);
  }
}