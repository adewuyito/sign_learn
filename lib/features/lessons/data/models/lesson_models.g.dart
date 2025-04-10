// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonImpl _$$LessonImplFromJson(Map<String, dynamic> json) => _$LessonImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      unit: json['unit'] as String,
      categoryLevel: categoryLevelFromJson(json['categoryLevel'] as String),
      videoUrl: json['videoUrl'] as String,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$LessonImplToJson(_$LessonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'unit': instance.unit,
      'categoryLevel': categoryLevelToJson(instance.categoryLevel),
      'videoUrl': instance.videoUrl,
      'isCompleted': instance.isCompleted,
    };
