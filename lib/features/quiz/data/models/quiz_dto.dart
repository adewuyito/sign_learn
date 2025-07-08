import '../../domain/entities/quiz.dart';

class QuizDTO {
  final String id;
  final String question;
  final String type;
  final String? mediaPath;
  final List<String> options;
  final int correctOptionIndex;
  final String explanation;

  QuizDTO({
    required this.id,
    required this.question,
    required this.type,
    this.mediaPath,
    required this.options,
    required this.correctOptionIndex,
    required this.explanation,
  });

  factory QuizDTO.fromJson(Map<String, dynamic> json) {
    return QuizDTO(
      id: json['id'] as String,
      question: json['question'] as String,
      type: json['type'] as String,
      mediaPath: json['mediaPath'] as String?,
      options: List<String>.from(json['options']),
      correctOptionIndex: json['correctOptionIndex'] as int,
      explanation: json['explanation'] as String,
    );
  }

  Quiz toDomain() {
    return Quiz(
      id: id,
      question: question,
      type: QuestionType.values.firstWhere(
        (e) => e.toString().split('.').last == type,
      ),
      mediaPath: mediaPath,
      options: options,
      correctOptionIndex: correctOptionIndex,
      explanation: explanation,
    );
  }
}