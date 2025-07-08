import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../data/dummy_data.dart';
import '../models/quiz_session.dart';
import '../models/quiz_question.dart';

final quizControllerProvider = StateNotifierProvider<QuizController, QuizSession?>((ref) {
  return QuizController();
});

class QuizController extends StateNotifier<QuizSession?> {
  QuizController() : super(null);

  Future<void> loadQuiz(String lessonId) async {
    // For testing, we'll use dummy data
    final questions = DummyQuizData.getDummyQuizzes().map((quiz) => QuizQuestion(
      id: quiz.id,
      question: quiz.question,
      type: quiz.type,
      mediaUrl: quiz.mediaPath,
      options: quiz.options,
      correctOptionIndex: quiz.correctOptionIndex,
      explanation: quiz.explanation,
    )).toList();

    state = QuizSession(
      id: DateTime.now().toIso8601String(),
      questions: questions,
    );
  }

  void answerQuestion(int answerIndex) {
    if (state == null) return;

    final updatedAnswers = List<int?>.from(state!.userAnswers);
    updatedAnswers[state!.currentQuestionIndex] = answerIndex;

    state = state!.copyWith(userAnswers: updatedAnswers);
  }

  void nextQuestion() {
    if (state == null || !state!.hasNextQuestion) return;

    if (state!.currentQuestionIndex == state!.questions.length - 1) {
      // Last question, mark as completed
      state = state!.copyWith(
        currentQuestionIndex: state!.currentQuestionIndex + 1,
        isCompleted: true,
      );
    } else {
      state = state!.copyWith(
        currentQuestionIndex: state!.currentQuestionIndex + 1,
      );
    }
  }

  void previousQuestion() {
    if (state == null || state!.currentQuestionIndex <= 0) return;

    state = state!.copyWith(
      currentQuestionIndex: state!.currentQuestionIndex - 1,
    );
  }

  void resetQuiz() {
    if (state == null) return;

    state = state!.copyWith(
      currentQuestionIndex: 0,
      userAnswers: List.filled(state!.questions.length, null),
      isCompleted: false,
    );
  }

  int? getCurrentAnswer() {
    if (state == null) return null;
    return state!.userAnswers[state!.currentQuestionIndex];
  }

  bool isAnswerCorrect(int questionIndex, int answerIndex) {
    if (state == null || questionIndex >= state!.questions.length) return false;
    return state!.questions[questionIndex].correctOptionIndex == answerIndex;
  }
}