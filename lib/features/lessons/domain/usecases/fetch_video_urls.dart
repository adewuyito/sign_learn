import 'package:riverpod/riverpod.dart';

import '../../data/repositories/lesson_repository.dart';
import '../../data/models/lesson_model.dart';

class FetchVideoUrlsForLesson {
  final ILessonRepository _repository;

  FetchVideoUrlsForLesson(this._repository);

  Future<List<String>> call(LessonModel lesson) {
    return _repository.fetchVideoUrl(lesson);
  }
}

final fetchVideoUrlsForLessonProvider =
    FutureProvider.autoDispose.family<List<String>, LessonModel>(
  (ref, lesson) {
    final repo = ref.watch(lessonRepositoryProvider);
    final useCase = FetchVideoUrlsForLesson(repo);
    return useCase.call(lesson);
  },
);
