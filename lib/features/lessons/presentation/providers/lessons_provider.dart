import 'package:riverpod/riverpod.dart';

import '../../data/data.dart';
import '../../domain/domain.dart';



final lessonsByCategoryProvider =
    FutureProvider.family<List<Lesson>, CategoryLevel>((ref, category) async {
  final fetchLessons = ref.watch(fetchLessonsByCategoryProvider);
  return fetchLessons(category);
});

final lessonDetailProvider =
    FutureProvider.family<Lesson, String>((ref, lessonId) async {
  final lessonRepository = ref.watch(lessonRepositoryProvider);
  return await lessonRepository.getLessonById(lessonId);
});
