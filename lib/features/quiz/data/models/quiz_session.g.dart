// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizSessionImpl _$$QuizSessionImplFromJson(Map<String, dynamic> json) =>
    _$QuizSessionImpl(
      sessionId: json['sessionId'] as String,
      userId: json['userId'] as String,
      lessonId: json['lessonId'] as String?,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => QuizQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentQuestionIndex:
          (json['currentQuestionIndex'] as num?)?.toInt() ?? 0,
      responses: (json['responses'] as List<dynamic>?)
              ?.map((e) => QuizResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      status: $enumDecodeNullable(_$QuizSessionStatusEnumMap, json['status']) ??
          QuizSessionStatus.notStarted,
      totalScore: (json['totalScore'] as num?)?.toInt() ?? 0,
      maxPossibleScore: (json['maxPossibleScore'] as num?)?.toInt() ?? 0,
      correctAnswers: (json['correctAnswers'] as num?)?.toInt() ?? 0,
      totalQuestions: (json['totalQuestions'] as num?)?.toInt() ?? 0,
      startedAt: const TimestampConverter().fromJson(json['startedAt']),
      completedAt: const TimestampConverter().fromJson(json['completedAt']),
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      updatedAt: const TimestampConverter().fromJson(json['updatedAt']),
    );

Map<String, dynamic> _$$QuizSessionImplToJson(_$QuizSessionImpl instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'userId': instance.userId,
      'lessonId': instance.lessonId,
      'questions': instance.questions,
      'currentQuestionIndex': instance.currentQuestionIndex,
      'responses': instance.responses,
      'status': _$QuizSessionStatusEnumMap[instance.status]!,
      'totalScore': instance.totalScore,
      'maxPossibleScore': instance.maxPossibleScore,
      'correctAnswers': instance.correctAnswers,
      'totalQuestions': instance.totalQuestions,
      'startedAt': const TimestampConverter().toJson(instance.startedAt),
      'completedAt': const TimestampConverter().toJson(instance.completedAt),
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };

const _$QuizSessionStatusEnumMap = {
  QuizSessionStatus.notStarted: 'notStarted',
  QuizSessionStatus.inProgress: 'inProgress',
  QuizSessionStatus.completed: 'completed',
  QuizSessionStatus.abandoned: 'abandoned',
};
