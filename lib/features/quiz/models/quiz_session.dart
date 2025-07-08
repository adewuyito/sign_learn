import 'quiz_question.dart';

class QuizSession {
  final String id;
  final List<QuizQuestion> questions;
  final int currentQuestionIndex;
  final List<int?> userAnswers;
  final bool isCompleted;

  QuizSession({
    required this.id,
    required this.questions,
    this.currentQuestionIndex = 0,
    List<int?>? userAnswers,
    this.isCompleted = false,
  }) : userAnswers = userAnswers ?? List.filled(questions.length, null);

  QuizQuestion get currentQuestion => questions[currentQuestionIndex];

  bool get hasNextQuestion => currentQuestionIndex < questions.length - 1;

  int get score {
    int correctAnswers = 0;
    for (int i = 0; i < userAnswers.length; i++) {
      if (userAnswers[i] == questions[i].correctOptionIndex) {
        correctAnswers++;
      }
    }
    return correctAnswers;
  }

  double get percentage {
    if (questions.isEmpty) return 0.0;
    return (score / questions.length) * 100;
  }

  QuizSession copyWith({
    String? id,
    List<QuizQuestion>? questions,
    int? currentQuestionIndex,
    List<int?>? userAnswers,
    bool? isCompleted,
  }) {
    return QuizSession(
      id: id ?? this.id,
      questions: questions ?? this.questions,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      userAnswers: userAnswers ?? this.userAnswers,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}