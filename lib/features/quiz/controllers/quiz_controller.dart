import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/quiz_session.dart';
import '../models/quiz_question.dart';

final quizControllerProvider = StateNotifierProvider<QuizController, QuizSession?>((ref) {
  return QuizController();
});

class QuizController extends StateNotifier<QuizSession?> {
  QuizController() : super(null);

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
    if (selectedAnswerIndex < 0 || selectedAnswerIndex >= currentQuestion.options.length) {
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

  void clearQuiz() {
    state = null;
  }
}