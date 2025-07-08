import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import './timestamp_converter.dart';

part 'quiz_question.freezed.dart';
part 'quiz_question.g.dart';

/// Enumeration for different question types
enum QuestionType { text, video, image }

/// Model for quiz questions supporting text, video, and image-based questions
@freezed
class QuizQuestion with _$QuizQuestion {
  const factory QuizQuestion({
    /// Unique identifier for the question
    required String questionId,
    
    /// The question text to display
    required String questionText,
    
    /// Type of question (text, video, image)
    required QuestionType type,
    
    /// URL for video or image content (null for text questions)
    String? mediaUrl,
    
    /// List of possible answer options
    required List<QuizOption> options,
    
    /// Index of the correct answer in options list
    required int correctAnswerIndex,
    
    /// Optional explanation for the answer
    String? explanation,
    
    /// Difficulty level (1-5)
    @Default(1) int difficulty,
    
    /// Points awarded for correct answer
    @Default(10) int points,
    
    /// Time limit in seconds (optional)
    int? timeLimit,
    
    /// Associated lesson ID
    String? lessonId,
    
    /// Firestore timestamps
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
  }) = _QuizQuestion;

  factory QuizQuestion.fromJson(Map<String, dynamic> json) =>
      _$QuizQuestionFromJson(json);

  /// Construct from a Firestore document
  factory QuizQuestion.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return QuizQuestion.fromJson({
      'questionId': doc.id,
      ...data,
    });
  }
}

/// Model for quiz answer options
@freezed
class QuizOption with _$QuizOption {
  const factory QuizOption({
    /// Unique identifier for the option
    required String optionId,
    
    /// Text content of the option
    required String text,
    
    /// Optional image URL for the option
    String? imageUrl,
    
    /// Whether this option is correct
    @Default(false) bool isCorrect,
    
    /// Display order
    @Default(0) int order,
  }) = _QuizOption;

  factory QuizOption.fromJson(Map<String, dynamic> json) =>
      _$QuizOptionFromJson(json);
}

/// Extension for Firestore operations
extension QuizQuestionFirestoreX on QuizQuestion {
  /// Returns a map ready for `set()` or `update()`
  Map<String, dynamic> toFirestore({bool forUpdate = false}) {
    final data = toJson();
    if (!forUpdate) data['createdAt'] = FieldValue.serverTimestamp();
    data['updatedAt'] = FieldValue.serverTimestamp();

    // ID lives in doc path, not inside the doc
    data.remove('questionId');
    return data;
  }
}