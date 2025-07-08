import '../entities/quiz.dart';

abstract class QuizRepository {
  Future<List<Quiz>> getQuizzesByLesson(String lessonId);
  Future<String> getMediaUrl(String mediaPath);
}