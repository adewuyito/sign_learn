import 'package:riverpod/riverpod.dart';

import '../datasources/datasources.dart';
import '../models/models.dart';

final lessonRepositoryProvider = Provider<ILessonRepository>((ref) {
  return LessonRepository(
    ref,
  );
});

abstract class ILessonRepository {
  Future<List<Lesson>> getLessonsByCategory(String categoryLevel);
  Future<void> markLessonCompleted(String lessonId);
  Future<Lesson> getLessonById(String lessonId);
}


class LessonRepository implements ILessonRepository {
  Ref ref;

  LessonRepository(this.ref)
      : lessonLocalSource = ref.watch(lessonLocalSourceProvider),
        lessonRemoteSource = ref.watch(lessonRemoteSourceProvider);

  ILessonRemoteSource lessonRemoteSource;
  ILessonLocalSource lessonLocalSource;

  @override
  Future<Lesson> getLessonById(String lessonId) async {
    return await lessonRemoteSource.getLessonById(lessonId);
  }

  @override
  Future<List<Lesson>> getLessonsByCategory(String categoryLevel) async {
    return await lessonRemoteSource.fetchLessonsByCategory(categoryLevel);
  }

  @override
  Future<void> markLessonCompleted(String lessonId) async {
    return await lessonRemoteSource.markLessonCompleted(lessonId);
  }
}
