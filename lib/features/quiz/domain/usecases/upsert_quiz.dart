import '../../data/models/quiz_models.dart';
import '../../data/repositories/quiz_repository.dart';

class UpsertQuiz {
  final IQuizRepository repository;
  UpsertQuiz(this.repository);

  Future<void> call({
    required String levelId,
    required String unitId,
    required QuizModel quiz,
  }) {
    return repository.upsertQuiz(
      levelId: levelId,
      unitId: unitId,
      quiz: quiz,
    );
  }
}
