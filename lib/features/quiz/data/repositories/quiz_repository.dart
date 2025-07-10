import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/quiz_models.dart';
import '../datasources/quiz_remote_data_source.dart';

final quizRepositoryProvider = Provider<IQuizRepository>((ref) {
  final remote = ref.watch(quizRemoteDataSourceProvider);
  return QuizRepository(remote);
});

abstract class IQuizRepository {
  Future<QuizModel?> getQuizByLesson({
    required String levelId,
    required String unitId,
    required String lessonId,
  });

  Future<List<QuizModel>> getQuizzesByUnit({
    required String levelId,
    required String unitId,
  });

  Future<void> upsertQuiz({
    required String levelId,
    required String unitId,
    required QuizModel quiz,
  });
}

class QuizRepository implements IQuizRepository {
  final QuizRemoteDataSource remote;
  QuizRepository(this.remote);

  @override
  Future<QuizModel?> getQuizByLesson({
    required String levelId,
    required String unitId,
    required String lessonId,
  }) {
    return remote.getQuizByLesson(
      levelId: levelId,
      unitId: unitId,
      lessonId: lessonId,
    );
  }

  @override
  Future<List<QuizModel>> getQuizzesByUnit({
    required String levelId,
    required String unitId,
  }) {
    return remote.getQuizzesByUnit(
      levelId: levelId,
      unitId: unitId,
    );
  }

  @override
  Future<void> upsertQuiz({
    required String levelId,
    required String unitId,
    required QuizModel quiz,
  }) {
    return remote.upsertQuiz(
      levelId: levelId,
      unitId: unitId,
      quiz: quiz,
    );
  }
}
