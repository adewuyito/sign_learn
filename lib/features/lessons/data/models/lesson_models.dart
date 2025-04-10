import 'package:freezed_annotation/freezed_annotation.dart';

import 'category_levels.dart';

part 'lesson_models.freezed.dart';
part 'lesson_models.g.dart';

@freezed
class Lesson with _$Lesson {
  const factory Lesson({
    required String id,
    required String title,
    required String unit,
    // ignore: invalid_annotation_target
    @JsonKey(fromJson: categoryLevelFromJson, toJson: categoryLevelToJson)
    required CategoryLevel categoryLevel,
    required String videoUrl,
    @Default(false) bool isCompleted,
  }) = _Lesson;

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
}
