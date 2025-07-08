import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../data/data.dart';

/// State for quiz feedback
enum QuizFeedbackState { none, correct, incorrect }

/// Quiz controller state
class QuizControllerState {
  final QuizSession? session;
  final bool isLoading;
  final String? error;
  final QuizFeedbackState feedbackState;
  final String? feedbackMessage;
  final bool showingFeedback;

  const QuizControllerState({
    this.session,
    this.isLoading = false,
    this.error,
    this.feedbackState = QuizFeedbackState.none,
    this.feedbackMessage,
    this.showingFeedback = false,
  });

  QuizControllerState copyWith({
    QuizSession? session,
    bool? isLoading,
    String? error,
    QuizFeedbackState? feedbackState,
    String? feedbackMessage,
    bool? showingFeedback,
  }) {
    return QuizControllerState(
      session: session ?? this.session,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      feedbackState: feedbackState ?? this.feedbackState,
      feedbackMessage: feedbackMessage ?? this.feedbackMessage,
      showingFeedback: showingFeedback ?? this.showingFeedback,
    );
  }
}

/// Enhanced quiz controller managing quiz logic and state
class QuizController extends StateNotifier<QuizControllerState> {
  final QuizRepository _repository;

  QuizController(this._repository) : super(const QuizControllerState());

  final _uuid = const Uuid();

  /// Initialize a new quiz session with questions from a lesson
  Future<void> initializeQuizFromLesson({
    required String userId,
    required String lessonId,
    bool forceRefresh = false,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final questions = await _repository.getQuizQuestions(
        lessonId,
        forceRefresh: forceRefresh,
      );

      if (questions.isEmpty) {
        state = state.copyWith(
          isLoading: false,
          error: 'No quiz questions available for this lesson.',
        );
        return;
      }

      await _initializeQuizWithQuestions(
        userId: userId,
        questions: questions,
        lessonId: lessonId,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  /// Initialize a new quiz session with provided questions
  Future<void> _initializeQuizWithQuestions({
    required String userId,
    required List<QuizQuestion> questions,
    String? lessonId,
  }) async {
    try {
      final session = QuizSession(
        sessionId: _uuid.v4(),
        userId: userId,
        lessonId: lessonId,
        questions: questions,
        totalQuestions: questions.length,
        maxPossibleScore: questions.fold(0, (sum, q) => sum + q.points),
        status: QuizSessionStatus.notStarted,
        createdAt: DateTime.now(),
      );

      state = state.copyWith(
        session: session,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  /// Initialize quiz with mock data (for testing)
  Future<void> initializeQuiz({
    required String userId,
    required List<QuizQuestion> questions,
    String? lessonId,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    await _initializeQuizWithQuestions(
      userId: userId,
      questions: questions,
      lessonId: lessonId,
    );
  }

  /// Start the quiz session
  void startQuiz() {
    if (state.session == null) return;

    final updatedSession = state.session!.copyWith(
      status: QuizSessionStatus.inProgress,
      startedAt: DateTime.now(),
    );

    state = state.copyWith(session: updatedSession);
  }

  /// Submit an answer for the current question
  Future<void> submitAnswer(int selectedOptionIndex) async {
    final session = state.session;
    if (session == null || session.currentQuestion == null) return;

    final currentQuestion = session.currentQuestion!;
    final isCorrect = selectedOptionIndex == currentQuestion.correctAnswerIndex;

    // Create response
    final response = QuizResponse(
      responseId: _uuid.v4(),
      questionId: currentQuestion.questionId,
      selectedOptionIndex: selectedOptionIndex,
      isCorrect: isCorrect,
      pointsEarned: isCorrect ? currentQuestion.points : 0,
      submittedAt: DateTime.now(),
    );

    // Submit response to repository
    try {
      await _repository.submitQuizResponse(response);
    } catch (e) {
      // Continue even if submission fails (offline support)
    }

    // Update session with response
    final updatedResponses = [...session.responses, response];
    final newScore = session.totalScore + response.pointsEarned;
    final newCorrectAnswers = session.correctAnswers + (isCorrect ? 1 : 0);

    final updatedSession = session.copyWith(
      responses: updatedResponses,
      totalScore: newScore,
      correctAnswers: newCorrectAnswers,
    );

    // Show feedback
    state = state.copyWith(
      session: updatedSession,
      feedbackState:
          isCorrect ? QuizFeedbackState.correct : QuizFeedbackState.incorrect,
      feedbackMessage: isCorrect
          ? 'Correct! Great job!'
          : currentQuestion.explanation ??
              'That\'s not quite right. Try again!',
      showingFeedback: true,
    );

    // Auto-advance for correct answers, allow retry for incorrect
    if (isCorrect) {
      await Future.delayed(const Duration(seconds: 2));
      nextQuestion();
    }
  }

  /// Move to the next question
  void nextQuestion() {
    final session = state.session;
    if (session == null) return;

    final nextIndex = session.currentQuestionIndex + 1;

    if (nextIndex >= session.questions.length) {
      // Quiz completed
      _completeQuiz();
    } else {
      // Move to next question
      final updatedSession = session.copyWith(
        currentQuestionIndex: nextIndex,
      );

      state = state.copyWith(
        session: updatedSession,
        feedbackState: QuizFeedbackState.none,
        feedbackMessage: null,
        showingFeedback: false,
      );
    }
  }

  /// Move to the previous question
  void previousQuestion() {
    final session = state.session;
    if (session == null || session.currentQuestionIndex <= 0) return;

    final prevIndex = session.currentQuestionIndex - 1;
    final updatedSession = session.copyWith(
      currentQuestionIndex: prevIndex,
    );

    state = state.copyWith(
      session: updatedSession,
      feedbackState: QuizFeedbackState.none,
      feedbackMessage: null,
      showingFeedback: false,
    );
  }

  /// Complete the quiz
  void _completeQuiz() async {
    final session = state.session;
    if (session == null) return;

    final updatedSession = session.copyWith(
      status: QuizSessionStatus.completed,
      completedAt: DateTime.now(),
    );

    state = state.copyWith(
      session: updatedSession,
      feedbackState: QuizFeedbackState.none,
      showingFeedback: false,
    );

    // Save completed session
    try {
      await _repository.saveQuizSession(updatedSession);
    } catch (e) {
      // Continue even if save fails (offline support)
    }
  }

  /// Retry the current question (for incorrect answers)
  void retryQuestion() {
    state = state.copyWith(
      feedbackState: QuizFeedbackState.none,
      feedbackMessage: null,
      showingFeedback: false,
    );
  }

  /// Reset the quiz session
  void resetQuiz() {
    state = const QuizControllerState();
  }

  /// Abandon the current quiz
  void abandonQuiz() async {
    final session = state.session;
    if (session == null) return;

    final updatedSession = session.copyWith(
      status: QuizSessionStatus.abandoned,
    );

    state = state.copyWith(session: updatedSession);

    // Save abandoned session
    try {
      await _repository.saveQuizSession(updatedSession);
    } catch (e) {
      // Continue even if save fails
    }
  }

  /// Clear feedback
  void clearFeedback() {
    state = state.copyWith(
      feedbackState: QuizFeedbackState.none,
      feedbackMessage: null,
      showingFeedback: false,
    );
  }

  /// Get current progress as percentage (0.0 to 1.0)
  double get progress {
    final session = state.session;
    if (session == null || session.totalQuestions == 0) return 0.0;
    return session.currentQuestionIndex / session.totalQuestions;
  }

  /// Check if quiz is completed
  bool get isCompleted {
    return state.session?.isCompleted ?? false;
  }

  /// Check if quiz is in progress
  bool get isInProgress {
    return state.session?.isInProgress ?? false;
  }

  /// Get current question
  QuizQuestion? get currentQuestion {
    return state.session?.currentQuestion;
  }

  /// Check if current question can be retried
  bool get canRetry {
    return state.feedbackState == QuizFeedbackState.incorrect;
  }

  /// Check if can go to next question
  bool get canGoNext {
    final session = state.session;
    if (session == null) return false;

    final currentQuestionId = session.currentQuestion?.questionId;
    if (currentQuestionId == null) return false;

    return session.isQuestionAnswered(currentQuestionId) &&
        state.feedbackState == QuizFeedbackState.correct;
  }

  /// Check if can go to previous question
  bool get canGoPrevious {
    final idx = state.session?.currentQuestionIndex ?? 0;
    return idx > 0;
  }

  /// Sync pending sessions to server
  Future<void> syncPendingSessions() async {
    try {
      await _repository.syncPendingSessions();
    } catch (e) {
      // Sync will be attempted again later
    }
  }
}

extension QuizSessionAccuracy on QuizSession {
  double get accuracyPercentage {
    if (totalQuestions == 0) return 0.0;
    return correctAnswers / totalQuestions;
  }
}

/// Provider for the quiz controller
final quizControllerProvider =
    StateNotifierProvider<QuizController, QuizControllerState>((ref) {
  final repository = ref.read(quizRepositoryProvider);
  return QuizController(repository);
});

/// Provider for the current quiz session
final currentQuizSessionProvider = Provider<QuizSession?>((ref) {
  return ref.watch(quizControllerProvider).session;
});

/// Provider for quiz loading state
final quizLoadingProvider = Provider<bool>((ref) {
  return ref.watch(quizControllerProvider).isLoading;
});

/// Provider for quiz error
final quizErrorProvider = Provider<String?>((ref) {
  return ref.watch(quizControllerProvider).error;
});

/// Provider for quiz feedback state
final quizFeedbackProvider = Provider<QuizFeedbackState>((ref) {
  return ref.watch(quizControllerProvider).feedbackState;
});

/// Provider for quiz feedback message
final quizFeedbackMessageProvider = Provider<String?>((ref) {
  return ref.watch(quizControllerProvider).feedbackMessage;
});

/// Provider for showing feedback overlay
final showingFeedbackProvider = Provider<bool>((ref) {
  return ref.watch(quizControllerProvider).showingFeedback;
});
