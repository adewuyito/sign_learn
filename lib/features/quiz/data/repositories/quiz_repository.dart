import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../data/datasources/quiz_remote_datasource.dart';
import '../domain/entities/quiz.dart';
import '../domain/repositories/quiz_repository.dart';

final quizRemoteDataSourceProvider = Provider<QuizRemoteDataSource>((ref) {
  return QuizRemoteDataSourceImpl();
});

final quizRepositoryProvider = Provider<QuizRepository>((ref) {
  return QuizRepositoryImpl(ref.watch(quizRemoteDataSourceProvider));
});

class QuizRepositoryImpl implements QuizRepository {
  final QuizRemoteDataSource _remoteDataSource;

  QuizRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<Quiz>> getQuizzesByLesson(String lessonId) async {
    final quizDTOs = await _remoteDataSource.getQuizzesByLesson(lessonId);
    return quizDTOs.map((dto) => dto.toDomain()).toList();
  }

  @override
  Future<String> getMediaUrl(String mediaPath) {
    return _remoteDataSource.getMediaUrl(mediaPath);
  }
}