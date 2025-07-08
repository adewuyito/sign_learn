import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/entities/quiz_session.dart';
import '../../domain/entities/quiz_question.dart';
import '../../data/datasources/quiz_remote_source.dart';

final quizStateNotifierProvider = StateNotifierProvider<QuizStateNotifier, QuizState>(
  (ref) {
    final remoteSource = ref.watch(quizRemoteSourceProvider);
    return QuizStateNotifier(remoteSource);
  },
);

class QuizStateNotifier extends StateNotifier<QuizState> {
  final IQuizRemoteSource _remoteSource;

  QuizStateNotifier(this._remoteSource) : super(const QuizState());

  Future<void> startQuiz({
    required String levelId,
    required String unitId,
    String? lessonId,
  }) async {
    state = state.copyWith(status: QuizStatus.loading);
    
    try {
      final session = await _remoteSource.getQuizSession(
        levelId: levelId,
        unitId: unitId,
        lessonId: lessonId,
      );
      
      state = state.copyWith(
        currentSession: session,
        status: QuizStatus.inProgress,
        currentQuestionIndex: 0,
        results: [],
        selectedAnswerId: null,
        showFeedback: false,
        isRetrying: false,
      );
    } catch (e) {
      state = state.copyWith(
        status: QuizStatus.error,
        error: e.toString(),
      );
    }
  }

  void selectAnswer(String answerId) {
    if (state.status != QuizStatus.inProgress || state.showFeedback) return;
    
    state = state.copyWith(selectedAnswerId: answerId);
  }

  void submitAnswer() {
    if (state.selectedAnswerId == null || state.currentSession == null) return;

    final currentQuestion = state.currentSession!.questions[state.currentQuestionIndex];
    final isCorrect = state.selectedAnswerId == currentQuestion.correctAnswerId;
    
    // Find existing result for this question (for retry attempts)
    final existingResultIndex = state.results.indexWhere(
      (result) => result.questionId == currentQuestion.id,
    );
    
    final attempts = existingResultIndex >= 0 
        ? state.results[existingResultIndex].attempts + 1 
        : 1;

    final questionResult = QuestionResult(
      questionId: currentQuestion.id,
      selectedAnswerId: state.selectedAnswerId!,
      correctAnswerId: currentQuestion.correctAnswerId,
      isCorrect: isCorrect,
      attempts: attempts,
      timeSpent: const Duration(seconds: 10), // Mock time
    );

    List<QuestionResult> updatedResults = [...state.results];
    if (existingResultIndex >= 0) {
      updatedResults[existingResultIndex] = questionResult;
    } else {
      updatedResults.add(questionResult);
    }

    state = state.copyWith(
      results: updatedResults,
      showFeedback: true,
    );
  }

  void nextQuestion() {
    if (state.currentSession == null) return;

    final nextIndex = state.currentQuestionIndex + 1;
    
    if (nextIndex >= state.currentSession!.questions.length) {
      // Quiz completed
      state = state.copyWith(
        status: QuizStatus.completed,
        showFeedback: false,
      );
    } else {
      // Move to next question
      state = state.copyWith(
        currentQuestionIndex: nextIndex,
        selectedAnswerId: null,
        showFeedback: false,
        isRetrying: false,
      );
    }
  }

  void retryQuestion() {
    state = state.copyWith(
      selectedAnswerId: null,
      showFeedback: false,
      isRetrying: true,
    );
  }

  void resetQuiz() {
    state = const QuizState();
  }

  // Computed properties
  double get progress {
    if (state.currentSession == null) return 0.0;
    return (state.currentQuestionIndex + 1) / state.currentSession!.questions.length;
  }

  QuizQuestion? get currentQuestion {
    if (state.currentSession == null) return null;
    if (state.currentQuestionIndex >= state.currentSession!.questions.length) return null;
    return state.currentSession!.questions[state.currentQuestionIndex];
  }

  bool get isAnswerCorrect {
    if (state.selectedAnswerId == null || currentQuestion == null) return false;
    return state.selectedAnswerId == currentQuestion!.correctAnswerId;
  }

  int get correctAnswersCount {
    return state.results.where((result) => result.isCorrect).length;
  }

  int get totalAnsweredQuestions {
    return state.results.length;
  }

  double get scorePercentage {
    if (totalAnsweredQuestions == 0) return 0.0;
    return (correctAnswersCount / totalAnsweredQuestions) * 100;
  }
}