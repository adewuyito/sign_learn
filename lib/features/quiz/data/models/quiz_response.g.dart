// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizResponseImpl _$$QuizResponseImplFromJson(Map<String, dynamic> json) =>
    _$QuizResponseImpl(
      responseId: json['responseId'] as String,
      questionId: json['questionId'] as String,
      selectedOptionIndex: (json['selectedOptionIndex'] as num).toInt(),
      isCorrect: json['isCorrect'] as bool,
      pointsEarned: (json['pointsEarned'] as num).toInt(),
      timeToAnswer: (json['timeToAnswer'] as num?)?.toInt(),
      attempts: (json['attempts'] as num?)?.toInt() ?? 1,
      submittedAt: const TimestampConverter().fromJson(json['submittedAt']),
    );

Map<String, dynamic> _$$QuizResponseImplToJson(_$QuizResponseImpl instance) =>
    <String, dynamic>{
      'responseId': instance.responseId,
      'questionId': instance.questionId,
      'selectedOptionIndex': instance.selectedOptionIndex,
      'isCorrect': instance.isCorrect,
      'pointsEarned': instance.pointsEarned,
      'timeToAnswer': instance.timeToAnswer,
      'attempts': instance.attempts,
      'submittedAt': const TimestampConverter().toJson(instance.submittedAt),
    };
