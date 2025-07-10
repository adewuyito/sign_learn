import '../../data/models/quiz_models.dart';
import '../../data/repositories/quiz_repository.dart';

class GetQuizByLesson {
  final IQuizRepository repository;
  GetQuizByLesson(this.repository);

  Future<QuizModel?> call({
    required String levelId,
    required String unitId,
    required String lessonId,
  }) {
    return repository.getQuizByLesson(
      levelId: levelId,
      unitId: unitId,
      lessonId: lessonId,
    );
  }
}
