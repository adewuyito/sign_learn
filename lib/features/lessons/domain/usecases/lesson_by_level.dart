import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/data.dart'
    show ILessonRepository, LessonModel, lessonRepositoryProvider;

typedef LevelId = String;

final fetchLessonsByLevelProvider = FutureProvider.autoDispose
    .family<List<LessonModel>, LevelId>((ref, levelId) {
  final repo = ref.watch(lessonRepositoryProvider);
  final useCase = FetchLessonsByLevel(repo);
  return useCase.call(
    levelId: levelId,
  );
});

class FetchLessonsByLevel {
  final ILessonRepository _repository;

  FetchLessonsByLevel(this._repository);

  Future<List<LessonModel>> call({required LevelId levelId}) =>
      _repository.getLessonsByLevel(levelId);
}
