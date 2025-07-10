// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizModelImpl _$$QuizModelImplFromJson(Map<String, dynamic> json) =>
    _$QuizModelImpl(
      quizId: json['quizId'] as String,
      lessonId: json['lessonId'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      questions: _questionsFromJson(json['questions'] as List),
      order: (json['order'] as num).toInt(),
    );

Map<String, dynamic> _$$QuizModelImplToJson(_$QuizModelImpl instance) =>
    <String, dynamic>{
      'quizId': instance.quizId,
      'lessonId': instance.lessonId,
      'title': instance.title,
      'description': instance.description,
      'questions': _questionsToJson(instance.questions),
      'order': instance.order,
    };

_$QuizQuestionModelImpl _$$QuizQuestionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$QuizQuestionModelImpl(
      questionId: json['questionId'] as String,
      mediaType: $enumDecode(_$MediaTypeEnumMap, json['mediaType']),
      mediaUrl: json['mediaUrl'] as String,
      questionText: json['questionText'] as String?,
      options: _optionsFromJson(json['options'] as List),
      correctOptionIndex: (json['correctOptionIndex'] as num).toInt(),
    );

Map<String, dynamic> _$$QuizQuestionModelImplToJson(
        _$QuizQuestionModelImpl instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'mediaType': _$MediaTypeEnumMap[instance.mediaType]!,
      'mediaUrl': instance.mediaUrl,
      'questionText': instance.questionText,
      'options': _optionsToJson(instance.options),
      'correctOptionIndex': instance.correctOptionIndex,
    };

const _$MediaTypeEnumMap = {
  MediaType.image: 'image',
  MediaType.video: 'video',
};

_$QuizOptionModelImpl _$$QuizOptionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$QuizOptionModelImpl(
      optionId: json['optionId'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$$QuizOptionModelImplToJson(
        _$QuizOptionModelImpl instance) =>
    <String, dynamic>{
      'optionId': instance.optionId,
      'text': instance.text,
    };
