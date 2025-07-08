import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../common/typedefs.dart';
import '../../data/data.dart';

class FetchLessonsById {
  final ILessonRepository _repository;

  FetchLessonsById(this._repository);

  Future<LessonModel> call({
    required LevelId levelId,
    required String unitId,
    required String lessonId,
  }) {
    return _repository.getLesson(
      levelId: levelId,
      unitId: unitId,
      lessonId: lessonId,
    );
  }
}

final fetchLessonsByIdProvider =
    FutureProvider.family<LessonModel, LevelDetails>(
  (ref, params) {
    final repo = ref.watch(lessonRepositoryProvider);
    final useCase = FetchLessonsById(repo);
    return useCase.call(
      levelId: params.levelId,
      unitId: params.unitId,
      lessonId: params.lessonId,
    );
  },
);
