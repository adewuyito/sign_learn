import '../../data/models/quiz_models.dart';
import '../../data/repositories/quiz_repository.dart';

class GetQuizzesByUnit {
  final IQuizRepository repository;
  GetQuizzesByUnit(this.repository);

  Future<List<QuizModel>> call({
    required String levelId,
    required String unitId,
  }) {
    return repository.getQuizzesByUnit(
      levelId: levelId,
      unitId: unitId,
    );
  }
}
