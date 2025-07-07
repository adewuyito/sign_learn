import 'package:riverpod/riverpod.dart';

import '../../data/data.dart';

class FetchLessonsByCategory {
  final ILessonRepository _repository;

  FetchLessonsByCategory(this._repository);

  Future<List<LessonModel>> call({
    required String levelId,
    required String unitId,
  }) {
    return _repository.loadUnitLessons(levelId: levelId, unitId: unitId);
  }
}

typedef LevelUnit = ({String levelId, String unitId});

final fetchLessonsByCategoryProvider = FutureProvider.autoDispose
    .family<List<LessonModel>, LevelUnit>((ref, params) {
  final repo = ref.watch(lessonRepositoryProvider);
  final useCase = FetchLessonsByCategory(repo);
  return useCase.call(
    levelId: params.levelId,
    unitId: params.unitId,
  );
});


