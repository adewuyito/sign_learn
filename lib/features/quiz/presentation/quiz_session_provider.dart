import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/features/quiz/presentation/quiz_score_view.dart';

// Provider to manage quiz session data
final quizSessionProvider = StateNotifierProvider<QuizSessionNotifier, QuizSessionState>((ref) {
  return QuizSessionNotifier();
});

class QuizSessionState {
  final DateTime? startTime;
  final List<QuizQuestionResult> questionResults;
  final int correctAnswers;
  final int incorrectAnswers;
  final int skippedQuestions;
  final String? currentQuizTitle;

  const QuizSessionState({
    this.startTime,
    this.questionResults = const [],
    this.correctAnswers = 0,
    this.incorrectAnswers = 0,
    this.skippedQuestions = 0,
    this.currentQuizTitle,
  });

  QuizSessionState copyWith({
    DateTime? startTime,
    List<QuizQuestionResult>? questionResults,
    int? correctAnswers,
    int? incorrectAnswers,
    int? skippedQuestions,
    String? currentQuizTitle,
  }) {
    return QuizSessionState(
      startTime: startTime ?? this.startTime,
      questionResults: questionResults ?? this.questionResults,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      incorrectAnswers: incorrectAnswers ?? this.incorrectAnswers,
      skippedQuestions: skippedQuestions ?? this.skippedQuestions,
      currentQuizTitle: currentQuizTitle ?? this.currentQuizTitle,
    );
  }

  int get totalQuestions => questionResults.length;
  int get score => totalQuestions > 0 ? (correctAnswers / totalQuestions * 100).round() : 0;
  Duration? get timeTaken => startTime != null ? DateTime.now().difference(startTime!) : null;
}

class QuizSessionNotifier extends StateNotifier<QuizSessionState> {
  QuizSessionNotifier() : super(const QuizSessionState());

  void startQuiz(String quizTitle) {
    state = state.copyWith(
      startTime: DateTime.now(),
      questionResults: [],
      correctAnswers: 0,
      incorrectAnswers: 0,
      skippedQuestions: 0,
      currentQuizTitle: quizTitle,
    );
  }

  void recordAnswer(QuizQuestionResult result) {
    final newResults = List<QuizQuestionResult>.from(state.questionResults)..add(result);
    
    int newCorrect = state.correctAnswers;
    int newIncorrect = state.incorrectAnswers;
    
    if (result.isCorrect) {
      newCorrect++;
    } else {
      newIncorrect++;
    }

    state = state.copyWith(
      questionResults: newResults,
      correctAnswers: newCorrect,
      incorrectAnswers: newIncorrect,
    );
  }

  void recordSkippedQuestion(int correctOption) {
    final newResults = List<QuizQuestionResult>.from(state.questionResults)..add(
      QuizQuestionResult(
        isCorrect: false,
        selectedOption: null,
        correctOption: correctOption,
      ),
    );

    state = state.copyWith(
      questionResults: newResults,
      skippedQuestions: state.skippedQuestions + 1,
    );
  }

  void resetQuiz() {
    state = const QuizSessionState();
  }

  QuizSessionState getCurrentSession() {
    return state;
  }
} 