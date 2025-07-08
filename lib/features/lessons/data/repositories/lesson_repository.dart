import 'package:riverpod/riverpod.dart';

import '../datasources/datasources.dart';
import '../models/lesson_model.dart';

final lessonRepositoryProvider = Provider<ILessonRepository>((ref) {
  return LessonRepository(ref);
});

abstract class ILessonRepository {
  Future<List<LessonModel>> getLessonsByLevel(String levelId);

  Future<List<LessonModel>> loadUnitLessons({
    required String levelId,
    required String unitId,
  });

  /// Get a single lesson document
  Future<LessonModel> getLesson({
    required String levelId,
    required String unitId,
    required String lessonId,
  });

  Future<List<String>> fetchVideoUrl(LessonModel lesson);
}

class LessonRepository implements ILessonRepository {
  Ref ref;

  LessonRepository(this.ref)
      : lessonLocalSource = ref.watch(lessonLocalSourceProvider),
        lessonRemoteSource = ref.watch(lessonRemoteSourceProvider);

  ILessonRemoteSource lessonRemoteSource;
  ILessonLocalSource lessonLocalSource;

  @override
  Future<LessonModel> getLesson({
    required String levelId,
    required String unitId,
    required String lessonId,
  }) {
    return lessonRemoteSource.getLesson(
      levelId: levelId,
      unitId: unitId,
      lessonId: lessonId,
    );
  }

  @override
  Future<List<LessonModel>> loadUnitLessons({
    required String levelId,
    required String unitId,
  }) {
    return lessonRemoteSource.getLessons(levelId: levelId, unitId: unitId);
  }

  @override
  Future<List<LessonModel>> getLessonsByLevel(String levelId) {
    return lessonRemoteSource.getLessonsByLevel(levelId);
  }

  @override
  Future<List<String>> fetchVideoUrl(LessonModel lesson) {
    return lessonRemoteSource.fetchVideoUrl(lesson);
  }
}
