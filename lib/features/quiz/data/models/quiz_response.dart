import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_response.freezed.dart';
part 'quiz_response.g.dart';

/// Model for tracking user responses to quiz questions
@freezed
class QuizResponse with _$QuizResponse {
  const factory QuizResponse({
    /// Unique identifier for the response
    required String responseId,
    
    /// ID of the question being answered
    required String questionId,
    
    /// Index of the selected option
    required int selectedOptionIndex,
    
    /// Whether the response was correct
    required bool isCorrect,
    
    /// Points earned for this response
    required int pointsEarned,
    
    /// Time taken to answer in seconds
    int? timeToAnswer,
    
    /// Number of attempts before getting correct answer
    @Default(1) int attempts,
    
    /// Timestamp when the response was submitted
    @TimestampConverter() DateTime? submittedAt,
  }) = _QuizResponse;

  factory QuizResponse.fromJson(Map<String, dynamic> json) =>
      _$QuizResponseFromJson(json);

  /// Construct from a Firestore document
  factory QuizResponse.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return QuizResponse.fromJson({
      'responseId': doc.id,
      ...data,
    });
  }
}

/// Extension for Firestore operations
extension QuizResponseFirestoreX on QuizResponse {
  /// Returns a map ready for `set()` or `update()`
  Map<String, dynamic> toFirestore() {
    final data = toJson();
    data['submittedAt'] = FieldValue.serverTimestamp();
    data.remove('responseId');
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