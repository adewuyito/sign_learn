import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_model.freezed.dart';
part 'lesson_model.g.dart';

/// Core data for one lesson inside
///  /lessons/{levelId}/units/{unitId}/lessons/{lessonId}
@freezed
class LessonModel with _$LessonModel {
  /// Factory constructor
  const factory LessonModel({
    /// Firestore doc ID (not stored inside doc)
    required String lessonId,

    /// Visible title in the UI
    required String title,

    /// Optional subtitle/summary
    String? description,

    /// Ordered list of clip URLs to play in sequence
    required List<String> videoUrls,

    /// Sort order within its unit (1,2,3…)
    required int order,

    /// (Client‑side flag; don’t persist unless you need)
    @Default(false) bool isCompleted,
    @Default('asl_lesson1') String parentLesson,
    required int unitOrder,

    /// Firestore timestamps
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
  }) = _LessonModel;

  /// ---------- Serialization helpers ----------

  factory LessonModel.fromJson(Map<String, dynamic> json) =>
      _$LessonModelFromJson(json);

  /// Construct from a Firestore document
  factory LessonModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return LessonModel.fromJson({
      'lessonId': doc.id,
      ...data,
    });
  }
}

/// Handy extension for writes
extension LessonFirestoreX on LessonModel {
  /// Returns a map ready for `set()` or `update()`
  Map<String, dynamic> toFirestore({bool forUpdate = false}) {
    final data = toJson();
    if (!forUpdate) data['createdAt'] = FieldValue.serverTimestamp();
    data['updatedAt'] = FieldValue.serverTimestamp();

    // ID lives in doc path, not inside the doc
    data.remove('lessonId');
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
