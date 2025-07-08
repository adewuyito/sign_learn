import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/dummy_data.dart';
import '../models/quiz_session.dart';
import '../models/quiz_question.dart';

final quizControllerProvider =
    StateNotifierProvider<QuizController, QuizSession?>((ref) {
  return QuizController();
});

class QuizController extends StateNotifier<QuizSession?> {
  QuizController() : super(null);

  Future<void> loadQuiz(String lessonId) async {
    // For testing, we'll use dummy data
    final questions = DummyQuizData.getDummyQuizzes()
        .map((quiz) => QuizQuestion(
              id: quiz.id,
              question: quiz.question,
              type: QuestionType.values.firstWhere((e) =>
                  e.toString().split('.').last ==
                  quiz.type.toString().split('.').last),
              mediaUrl: quiz.mediaPath,
              options: quiz.options,
              correctOptionIndex: quiz.correctOptionIndex,
              explanation: quiz.explanation,
            ))
        .toList();

    state = QuizSession(
      id: DateTime.now().toIso8601String(),
      questions: questions,
    );
  }

  void initializeQuiz(List<QuizQuestion> questions) {
    if (questions.isEmpty) {
      throw ArgumentError('Questions list cannot be empty');
    }
    state = QuizSession(
      id: DateTime.now().toIso8601String(), // TODO: Get from backend
      questions: questions,
    );
  }

  void answerQuestion(int selectedAnswerIndex) {
    if (state == null) return;

    final currentQuestion = state!.currentQuestion;
    if (selectedAnswerIndex < 0 ||
        selectedAnswerIndex >= currentQuestion.options.length) {
      return; // Invalid answer index
    }

    final newAnswers = List<int>.from(state!.answers);
    newAnswers[state!.currentQuestionIndex] = selectedAnswerIndex;

    state = state!.copyWith(answers: newAnswers);
  }

  void moveToNext() {
    if (state == null || !state!.canMoveToNext) return;

    state = state!.copyWith(
      currentQuestionIndex: state!.currentQuestionIndex + 1,
    );
  }

  void moveToPrevious() {
    if (state == null || !state!.canMoveToPrevious) return;

    state = state!.copyWith(
      currentQuestionIndex: state!.currentQuestionIndex - 1,
    );
  }

  void completeQuiz() {
    if (state == null) return;

    state = state!.copyWith(isCompleted: true);
    // TODO: Submit results to backend
  }

  void resetQuiz() {
    if (state == null) return;

    state = state!.copyWith(
      currentQuestionIndex: 0,
      answers: List.filled(state!.questions.length, -1),
      isCompleted: false,
    );
  }

  int? getCurrentAnswer() {
    if (state == null) return null;
    return state!.answers[state!.currentQuestionIndex];
  }

  bool isAnswerCorrect(int questionIndex, int answerIndex) {
    if (state == null || questionIndex >= state!.questions.length) return false;
    return state!.questions[questionIndex].correctOptionIndex == answerIndex;
  }

  void clearQuiz() {
    state = null;
  }
}
