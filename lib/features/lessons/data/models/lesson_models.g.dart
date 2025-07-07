// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonImpl _$$LessonImplFromJson(Map<String, dynamic> json) => _$LessonImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      videoTitles: (json['videoTitles'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      unit: (json['unit'] as num).toInt(),
      categoryLevel: categoryLevelFromJson(json['categoryLevel'] as String),
      videoUrl:
          (json['videoUrl'] as List<dynamic>).map((e) => e as String).toList(),
      isCompleted: json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$LessonImplToJson(_$LessonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'videoTitles': instance.videoTitles,
      'unit': instance.unit,
      'categoryLevel': categoryLevelToJson(instance.categoryLevel),
      'videoUrl': instance.videoUrl,
      'isCompleted': instance.isCompleted,
    };
