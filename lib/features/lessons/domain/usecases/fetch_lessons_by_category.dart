import 'package:riverpod/riverpod.dart';

import '../../data/data.dart';

final fetchLessonsByCategoryProvider = Provider(
  (ref) => FetchLessonsByCategory(ref.watch(lessonRepositoryProvider)),
);

class FetchLessonsByCategory {
  final ILessonRepository repository;

  FetchLessonsByCategory(this.repository);

  Future<List<Lesson>> call(CategoryLevel categoryLevel) async {
    return await repository.getLessonsByCategory(categoryLevel.name);
  }
}
