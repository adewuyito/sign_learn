import 'quiz_question.dart';

class QuizSession {
  final String id;
  final String title;
  final List<QuizQuestion> questions;
  final String levelId;
  final String unitId;
  final String? lessonId;

  const QuizSession({
    required this.id,
    required this.title,
    required this.questions,
    required this.levelId,
    required this.unitId,
    this.lessonId,
  });

  factory QuizSession.fromJson(Map<String, dynamic> json) => QuizSession(
        id: json['id'] as String,
        title: json['title'] as String,
        questions: (json['questions'] as List<dynamic>)
            .map((e) => QuizQuestion.fromJson(e as Map<String, dynamic>))
            .toList(),
        levelId: json['levelId'] as String,
        unitId: json['unitId'] as String,
        lessonId: json['lessonId'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'questions': questions.map((e) => e.toJson()).toList(),
        'levelId': levelId,
        'unitId': unitId,
        'lessonId': lessonId,
      };
}

class QuizResult {
  final String sessionId;
  final int totalQuestions;
  final int correctAnswers;
  final int incorrectAnswers;
  final List<QuestionResult> questionResults;
  final DateTime completedAt;
  final Duration timeTaken;

  const QuizResult({
    required this.sessionId,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.incorrectAnswers,
    required this.questionResults,
    required this.completedAt,
    required this.timeTaken,
  });

  factory QuizResult.fromJson(Map<String, dynamic> json) => QuizResult(
        sessionId: json['sessionId'] as String,
        totalQuestions: json['totalQuestions'] as int,
        correctAnswers: json['correctAnswers'] as int,
        incorrectAnswers: json['incorrectAnswers'] as int,
        questionResults: (json['questionResults'] as List<dynamic>)
            .map((e) => QuestionResult.fromJson(e as Map<String, dynamic>))
            .toList(),
        completedAt: DateTime.parse(json['completedAt'] as String),
        timeTaken: Duration(seconds: json['timeTaken'] as int),
      );

  Map<String, dynamic> toJson() => {
        'sessionId': sessionId,
        'totalQuestions': totalQuestions,
        'correctAnswers': correctAnswers,
        'incorrectAnswers': incorrectAnswers,
        'questionResults': questionResults.map((e) => e.toJson()).toList(),
        'completedAt': completedAt.toIso8601String(),
        'timeTaken': timeTaken.inSeconds,
      };
}

class QuestionResult {
  final String questionId;
  final String selectedAnswerId;
  final String correctAnswerId;
  final bool isCorrect;
  final int attempts;
  final Duration timeSpent;

  const QuestionResult({
    required this.questionId,
    required this.selectedAnswerId,
    required this.correctAnswerId,
    required this.isCorrect,
    required this.attempts,
    required this.timeSpent,
  });

  factory QuestionResult.fromJson(Map<String, dynamic> json) => QuestionResult(
        questionId: json['questionId'] as String,
        selectedAnswerId: json['selectedAnswerId'] as String,
        correctAnswerId: json['correctAnswerId'] as String,
        isCorrect: json['isCorrect'] as bool,
        attempts: json['attempts'] as int,
        timeSpent: Duration(seconds: json['timeSpent'] as int),
      );

  Map<String, dynamic> toJson() => {
        'questionId': questionId,
        'selectedAnswerId': selectedAnswerId,
        'correctAnswerId': correctAnswerId,
        'isCorrect': isCorrect,
        'attempts': attempts,
        'timeSpent': timeSpent.inSeconds,
      };
}

class QuizState {
  final QuizSession? currentSession;
  final int currentQuestionIndex;
  final List<QuestionResult> results;
  final QuizStatus status;
  final String? selectedAnswerId;
  final String? error;
  final bool showFeedback;
  final bool isRetrying;

  const QuizState({
    this.currentSession,
    this.currentQuestionIndex = 0,
    this.results = const [],
    this.status = QuizStatus.idle,
    this.selectedAnswerId,
    this.error,
    this.showFeedback = false,
    this.isRetrying = false,
  });

  QuizState copyWith({
    QuizSession? currentSession,
    int? currentQuestionIndex,
    List<QuestionResult>? results,
    QuizStatus? status,
    String? selectedAnswerId,
    String? error,
    bool? showFeedback,
    bool? isRetrying,
  }) =>
      QuizState(
        currentSession: currentSession ?? this.currentSession,
        currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
        results: results ?? this.results,
        status: status ?? this.status,
        selectedAnswerId: selectedAnswerId ?? this.selectedAnswerId,
        error: error ?? this.error,
        showFeedback: showFeedback ?? this.showFeedback,
        isRetrying: isRetrying ?? this.isRetrying,
      );

  factory QuizState.fromJson(Map<String, dynamic> json) => QuizState(
        currentSession: json['currentSession'] != null
            ? QuizSession.fromJson(json['currentSession'] as Map<String, dynamic>)
            : null,
        currentQuestionIndex: json['currentQuestionIndex'] as int? ?? 0,
        results: (json['results'] as List<dynamic>?)
                ?.map((e) => QuestionResult.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        status: QuizStatus.values.firstWhere(
          (e) => e.toString().split('.').last == json['status'],
          orElse: () => QuizStatus.idle,
        ),
        selectedAnswerId: json['selectedAnswerId'] as String?,
        error: json['error'] as String?,
        showFeedback: json['showFeedback'] as bool? ?? false,
        isRetrying: json['isRetrying'] as bool? ?? false,
      );

  Map<String, dynamic> toJson() => {
        'currentSession': currentSession?.toJson(),
        'currentQuestionIndex': currentQuestionIndex,
        'results': results.map((e) => e.toJson()).toList(),
        'status': status.toString().split('.').last,
        'selectedAnswerId': selectedAnswerId,
        'error': error,
        'showFeedback': showFeedback,
        'isRetrying': isRetrying,
      };
}

enum QuizStatus {
  idle,
  loading,
  inProgress,
  completed,
  error,
}