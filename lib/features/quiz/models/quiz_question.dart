import '../domain/entities/quiz.dart';

class QuizQuestion {
  final String id;
  final String question;
  final QuestionType type;
  final String? mediaUrl;
  final List<String> options;
  final int correctOptionIndex;
  final String explanation;

  QuizQuestion({
    required this.id,
    required this.question,
    required this.type,
    this.mediaUrl,
    required this.options,
    required this.correctOptionIndex,
    required this.explanation,
  });
}