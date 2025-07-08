
import '../domain/entities/quiz.dart';


import 'package:flutter/foundation.dart';

enum QuestionType { text, image, video }

@immutable
class QuizQuestion {
  final String id;
  final String question;
  final QuestionType type;

  final String? mediaUrl; // URL for image or video content
  final List<String> options;
  final int correctOptionIndex;
  final String explanation; // Explanation shown after answering

  const QuizQuestion({
    required this.id,
    required this.question,
    required this.type,
    this.mediaUrl,
    required this.options,
    required this.correctOptionIndex,
    required this.explanation,
  });


  bool isAnswerCorrect(int selectedIndex) => selectedIndex == correctOptionIndex;

  Map<String, dynamic> toJson() => {
        'id': id,
        'question': question,
        'type': type.toString(),
        'mediaUrl': mediaUrl,
        'options': options,
        'correctOptionIndex': correctOptionIndex,
        'explanation': explanation,
      };

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      id: json['id'] as String,
      question: json['question'] as String,
      type: QuestionType.values.firstWhere(
        (e) => e.toString() == json['type'],
      ),
      mediaUrl: json['mediaUrl'] as String?,
      options: List<String>.from(json['options']),
      correctOptionIndex: json['correctOptionIndex'] as int,
      explanation: json['explanation'] as String,
    );
  }

}