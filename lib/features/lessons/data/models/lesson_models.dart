import 'package:freezed_annotation/freezed_annotation.dart';

import 'category_levels.dart';

part 'lesson_models.freezed.dart';
part 'lesson_models.g.dart';

// ~ Previous Model for lesson
@freezed
class Lesson with _$Lesson {
  const factory Lesson({
    required String id,
    required String title,
    required List<String> videoTitles,
    required int unit,
    // ignore: invalid_annotation_target
    @JsonKey(fromJson: categoryLevelFromJson, toJson: categoryLevelToJson)
    required CategoryLevel categoryLevel,
    required List<String> videoUrl,
    @Default(false) bool isCompleted,
  }) = _Lesson;

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
}

/// Core data for one lesson inside