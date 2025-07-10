import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_models.freezed.dart';
part 'quiz_models.g.dart';

enum MediaType {
  @JsonValue('image')
  image,
  @JsonValue('video')
  video,
}

@freezed
class QuizModel with _$QuizModel {
  const factory QuizModel({
    required String quizId,
    required String lessonId,
    required String title,
    String? description,
    @JsonKey(fromJson: _questionsFromJson, toJson: _questionsToJson)
    required List<QuizQuestionModel> questions,
    required int order,
  }) = _QuizModel;

  factory QuizModel.fromJson(Map<String, dynamic> json) =>
      _$QuizModelFromJson(json);

  factory QuizModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return QuizModel.fromJson({
      'quizId': doc.id,
      ...data,
    });
  }
}

List<QuizQuestionModel> _questionsFromJson(List<dynamic> json) => json
    .map((e) => QuizQuestionModel.fromJson(e as Map<String, dynamic>))
    .toList();

List<Map<String, dynamic>> _questionsToJson(
        List<QuizQuestionModel> questions) =>
    questions.map((e) => e.toJson()).toList();

@freezed
class QuizQuestionModel with _$QuizQuestionModel {
  const factory QuizQuestionModel({
    required String questionId,
    required MediaType mediaType,
    required String mediaUrl,
    String? questionText,
    @JsonKey(fromJson: _optionsFromJson, toJson: _optionsToJson)
    required List<QuizOptionModel> options,
    required int correctOptionIndex,
  }) = _QuizQuestionModel;

  factory QuizQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuizQuestionModelFromJson(json);
}

List<QuizOptionModel> _optionsFromJson(List<dynamic> json) => json
    .map(
      (e) => QuizOptionModel.fromJson(e as Map<String, dynamic>),
    )
    .toList();

List<Map<String, dynamic>> _optionsToJson(List<QuizOptionModel> options) =>
    options.map((e) => e.toJson()).toList();

@freezed
class QuizOptionModel with _$QuizOptionModel {
  const factory QuizOptionModel({
    required String optionId,
    required String text,
  }) = _QuizOptionModel;

  factory QuizOptionModel.fromJson(Map<String, dynamic> json) =>
      _$QuizOptionModelFromJson(json);
}
