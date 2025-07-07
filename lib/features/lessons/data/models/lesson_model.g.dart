// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonModelImpl _$$LessonModelImplFromJson(Map<String, dynamic> json) =>
    _$LessonModelImpl(
      lessonId: json['lessonId'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      videoUrls:
          (json['videoUrls'] as List<dynamic>).map((e) => e as String).toList(),
      order: (json['order'] as num).toInt(),
      isCompleted: json['isCompleted'] as bool? ?? false,
      parentLesson: json['parentLesson'] as String? ?? 'asl_lesson1',
      unitOrder: (json['unitOrder'] as num).toInt(),
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      updatedAt: const TimestampConverter().fromJson(json['updatedAt']),
    );

Map<String, dynamic> _$$LessonModelImplToJson(_$LessonModelImpl instance) =>
    <String, dynamic>{
      'lessonId': instance.lessonId,
      'title': instance.title,
      'description': instance.description,
      'videoUrls': instance.videoUrls,
      'order': instance.order,
      'isCompleted': instance.isCompleted,
      'parentLesson': instance.parentLesson,
      'unitOrder': instance.unitOrder,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
