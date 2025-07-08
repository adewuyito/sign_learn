import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'quiz_response.dart';
import 'quiz_question.dart';

part 'quiz_session.freezed.dart';
part 'quiz_session.g.dart';

/// Enumeration for quiz session status
enum QuizSessionStatus { 
  notStarted, 
  inProgress, 
  completed, 
  abandoned 
}

/// Model for managing overall quiz state and progress
@freezed
class QuizSession with _$QuizSession {
  const factory QuizSession({
    /// Unique identifier for the session
    required String sessionId,
    
    /// User ID who is taking the quiz
    required String userId,
    
    /// Associated lesson ID (if any)
    String? lessonId,
    
    /// List of questions in this quiz session
    required List<QuizQuestion> questions,
    
    /// Current question index
    @Default(0) int currentQuestionIndex,
    
    /// List of user responses
    @Default([]) List<QuizResponse> responses,
    
    /// Current session status
    @Default(QuizSessionStatus.notStarted) QuizSessionStatus status,
    
    /// Total score achieved
    @Default(0) int totalScore,
    
    /// Maximum possible score
    @Default(0) int maxPossibleScore,
    
    /// Number of correct answers
    @Default(0) int correctAnswers,
    
    /// Total number of questions
    @Default(0) int totalQuestions,
    
    /// Session start time
    @TimestampConverter() DateTime? startedAt,
    
    /// Session completion time
    @TimestampConverter() DateTime? completedAt,
    
    /// Session creation time
    @TimestampConverter() DateTime? createdAt,
    
    /// Last update time
    @TimestampConverter() DateTime? updatedAt,
  }) = _QuizSession;

  factory QuizSession.fromJson(Map<String, dynamic> json) =>
      _$QuizSessionFromJson(json);

  /// Construct from a Firestore document
  factory QuizSession.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return QuizSession.fromJson({
      'sessionId': doc.id,
      ...data,
    });
  }
}

/// Extension for quiz session operations
extension QuizSessionX on QuizSession {
  /// Check if quiz is completed
  bool get isCompleted => status == QuizSessionStatus.completed;
  
  /// Check if quiz is in progress
  bool get isInProgress => status == QuizSessionStatus.inProgress;
  
  /// Get current question
  QuizQuestion? get currentQuestion {
    if (currentQuestionIndex >= 0 && currentQuestionIndex < questions.length) {
      return questions[currentQuestionIndex];
    }
    return null;
  }
  
  /// Check if this is the last question
  bool get isLastQuestion => currentQuestionIndex >= questions.length - 1;
  
  /// Check if this is the first question
  bool get isFirstQuestion => currentQuestionIndex == 0;
  
  /// Calculate progress percentage
  double get progressPercentage {
    if (totalQuestions == 0) return 0.0;
    return currentQuestionIndex / totalQuestions;
  }
  
  /// Calculate accuracy percentage
  double get accuracyPercentage {
    if (totalQuestions == 0) return 0.0;
    return correctAnswers / totalQuestions;
  }
  
  /// Get response for a specific question
  QuizResponse? getResponseForQuestion(String questionId) {
    try {
      return responses.firstWhere((response) => response.questionId == questionId);
    } catch (e) {
      return null;
    }
  }
  
  /// Check if question has been answered
  bool isQuestionAnswered(String questionId) {
    return getResponseForQuestion(questionId) != null;
  }
}

/// Extension for Firestore operations
extension QuizSessionFirestoreX on QuizSession {
  /// Returns a map ready for `set()` or `update()`
  Map<String, dynamic> toFirestore({bool forUpdate = false}) {
    final data = toJson();
    if (!forUpdate) data['createdAt'] = FieldValue.serverTimestamp();
    data['updatedAt'] = FieldValue.serverTimestamp();

    // ID lives in doc path, not inside the doc
    data.remove('sessionId');
    return data;
  }
}

/// Converts Firestore Timestamp <-> DateTime
class TimestampConverter implements JsonConverter<DateTime?, Object?> {
  const TimestampConverter();

  @override
  DateTime? fromJson(Object? json) {
    if (json == null) return null;
    if (json is Timestamp) return json.toDate();
    if (json is String) return DateTime.tryParse(json);
    return null;
  }

  @override
  Object? toJson(DateTime? date) =>
      date == null ? null : Timestamp.fromDate(date);
}