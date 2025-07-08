
import 'package:flutter/foundation.dart';
import 'quiz_question.dart';

@immutable

class QuizSession {
  final String id;
  final List<QuizQuestion> questions;
  final int currentQuestionIndex;

  final List<int> answers; // -1 means unanswered
  final bool isCompleted;

  QuizSession({
    required this.id,
    required this.questions,
    this.currentQuestionIndex = 0,

    List<int>? answers,
    this.isCompleted = false,
  }) : answers = answers ?? List.filled(questions.length, -1);

  QuizSession copyWith({
    String? id,
    List<QuizQuestion>? questions,
    int? currentQuestionIndex,

    List<int>? answers,

    bool? isCompleted,
  }) {
    return QuizSession(
      id: id ?? this.id,
      questions: questions ?? this.questions,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,

      answers: answers ?? this.answers,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  bool get canMoveToNext => currentQuestionIndex < questions.length - 1;
  bool get canMoveToPrevious => currentQuestionIndex > 0;
  double get progress => questions.isEmpty ? 0 : (currentQuestionIndex + 1) / questions.length;
  int get score {
    int correctAnswers = 0;
    for (int i = 0; i < answers.length && i < questions.length; i++) {
      if (answers[i] != -1 && questions[i].isAnswerCorrect(answers[i])) {
        correctAnswers++;
      }
    }
    return correctAnswers;
  }
  QuizQuestion get currentQuestion => questions[currentQuestionIndex];
}