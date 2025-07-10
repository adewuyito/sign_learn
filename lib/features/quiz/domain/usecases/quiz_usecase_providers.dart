import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/common/commons.dart';
import '../../data/models/quiz_models.dart';
import '../../data/repositories/quiz_repository.dart';
import 'get_quiz_by_lesson.dart';
import 'get_quizzes_by_unit.dart';
import 'upsert_quiz.dart';

final getQuizByLessonUseCaseProvider = Provider<GetQuizByLesson>((ref) {
  final repo = ref.watch(quizRepositoryProvider);
  return GetQuizByLesson(repo);
});

final getQuizzesByUnitUseCaseProvider = Provider<GetQuizzesByUnit>((ref) {
  final repo = ref.watch(quizRepositoryProvider);
  return GetQuizzesByUnit(repo);
});

final upsertQuizUseCaseProvider = Provider<UpsertQuiz>((ref) {
  final repo = ref.watch(quizRepositoryProvider);
  return UpsertQuiz(repo);
});

final fetchQuizByLessonProvider = FutureProvider.family<QuizModel?,
    ({String levelId, String unitId, String lessonId})>((ref, params) async {
  final useCase = ref.watch(getQuizByLessonUseCaseProvider);
  return useCase(
    levelId: params.levelId,
    unitId: params.unitId,
    lessonId: params.lessonId,
  );
});

final fetchQuizzesByUnitProvider =
    FutureProvider.family<List<QuizModel>, LevelUnit>((ref, params) async {
  final useCase = ref.watch(getQuizzesByUnitUseCaseProvider);
  return useCase(
    levelId: params.levelId,
    unitId: params.unitId,
  );
});

final upsertQuizProvider = FutureProvider.family<void,
    ({String levelId, String unitId, QuizModel quiz})>((ref, params) async {
  final useCase = ref.watch(upsertQuizUseCaseProvider);
  await useCase(
    levelId: params.levelId,
    unitId: params.unitId,
    quiz: params.quiz,
  );
});
