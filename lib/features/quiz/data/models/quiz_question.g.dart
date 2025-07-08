// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizQuestionImpl _$$QuizQuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuizQuestionImpl(
      questionId: json['questionId'] as String,
      questionText: json['questionText'] as String,
      type: $enumDecode(_$QuestionTypeEnumMap, json['type']),
      mediaUrl: json['mediaUrl'] as String?,
      options: (json['options'] as List<dynamic>)
          .map((e) => QuizOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      correctAnswerIndex: (json['correctAnswerIndex'] as num).toInt(),
      explanation: json['explanation'] as String?,
      difficulty: (json['difficulty'] as num?)?.toInt() ?? 1,
      points: (json['points'] as num?)?.toInt() ?? 10,
      timeLimit: (json['timeLimit'] as num?)?.toInt(),
      lessonId: json['lessonId'] as String?,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      updatedAt: const TimestampConverter().fromJson(json['updatedAt']),
    );

Map<String, dynamic> _$$QuizQuestionImplToJson(_$QuizQuestionImpl instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'questionText': instance.questionText,
      'type': _$QuestionTypeEnumMap[instance.type]!,
      'mediaUrl': instance.mediaUrl,
      'options': instance.options,
      'correctAnswerIndex': instance.correctAnswerIndex,
      'explanation': instance.explanation,
      'difficulty': instance.difficulty,
      'points': instance.points,
      'timeLimit': instance.timeLimit,
      'lessonId': instance.lessonId,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };

const _$QuestionTypeEnumMap = {
  QuestionType.text: 'text',
  QuestionType.video: 'video',
  QuestionType.image: 'image',
};

_$QuizOptionImpl _$$QuizOptionImplFromJson(Map<String, dynamic> json) =>
    _$QuizOptionImpl(
      optionId: json['optionId'] as String,
      text: json['text'] as String,
      imageUrl: json['imageUrl'] as String?,
      isCorrect: json['isCorrect'] as bool? ?? false,
      order: (json['order'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$QuizOptionImplToJson(_$QuizOptionImpl instance) =>
    <String, dynamic>{
      'optionId': instance.optionId,
      'text': instance.text,
      'imageUrl': instance.imageUrl,
      'isCorrect': instance.isCorrect,
      'order': instance.order,
    };
