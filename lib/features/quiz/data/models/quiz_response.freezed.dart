// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuizResponse _$QuizResponseFromJson(Map<String, dynamic> json) {
  return _QuizResponse.fromJson(json);
}

/// @nodoc
mixin _$QuizResponse {
  /// Unique identifier for the response
  String get responseId => throw _privateConstructorUsedError;

  /// ID of the question being answered
  String get questionId => throw _privateConstructorUsedError;

  /// Index of the selected option
  int get selectedOptionIndex => throw _privateConstructorUsedError;

  /// Whether the response was correct
  bool get isCorrect => throw _privateConstructorUsedError;

  /// Points earned for this response
  int get pointsEarned => throw _privateConstructorUsedError;

  /// Time taken to answer in seconds
  int? get timeToAnswer => throw _privateConstructorUsedError;

  /// Number of attempts before getting correct answer
  int get attempts => throw _privateConstructorUsedError;

  /// Timestamp when the response was submitted
  @TimestampConverter()
  DateTime? get submittedAt => throw _privateConstructorUsedError;

  /// Serializes this QuizResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizResponseCopyWith<QuizResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizResponseCopyWith<$Res> {
  factory $QuizResponseCopyWith(
          QuizResponse value, $Res Function(QuizResponse) then) =
      _$QuizResponseCopyWithImpl<$Res, QuizResponse>;
  @useResult
  $Res call(
      {String responseId,
      String questionId,
      int selectedOptionIndex,
      bool isCorrect,
      int pointsEarned,
      int? timeToAnswer,
      int attempts,
      @TimestampConverter() DateTime? submittedAt});
}

/// @nodoc
class _$QuizResponseCopyWithImpl<$Res, $Val extends QuizResponse>
    implements $QuizResponseCopyWith<$Res> {
  _$QuizResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseId = null,
    Object? questionId = null,
    Object? selectedOptionIndex = null,
    Object? isCorrect = null,
    Object? pointsEarned = null,
    Object? timeToAnswer = freezed,
    Object? attempts = null,
    Object? submittedAt = freezed,
  }) {
    return _then(_value.copyWith(
      responseId: null == responseId
          ? _value.responseId
          : responseId // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      selectedOptionIndex: null == selectedOptionIndex
          ? _value.selectedOptionIndex
          : selectedOptionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      pointsEarned: null == pointsEarned
          ? _value.pointsEarned
          : pointsEarned // ignore: cast_nullable_to_non_nullable
              as int,
      timeToAnswer: freezed == timeToAnswer
          ? _value.timeToAnswer
          : timeToAnswer // ignore: cast_nullable_to_non_nullable
              as int?,
      attempts: null == attempts
          ? _value.attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as int,
      submittedAt: freezed == submittedAt
          ? _value.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizResponseImplCopyWith<$Res>
    implements $QuizResponseCopyWith<$Res> {
  factory _$$QuizResponseImplCopyWith(
          _$QuizResponseImpl value, $Res Function(_$QuizResponseImpl) then) =
      __$$QuizResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String responseId,
      String questionId,
      int selectedOptionIndex,
      bool isCorrect,
      int pointsEarned,
      int? timeToAnswer,
      int attempts,
      @TimestampConverter() DateTime? submittedAt});
}

/// @nodoc
class __$$QuizResponseImplCopyWithImpl<$Res>
    extends _$QuizResponseCopyWithImpl<$Res, _$QuizResponseImpl>
    implements _$$QuizResponseImplCopyWith<$Res> {
  __$$QuizResponseImplCopyWithImpl(
      _$QuizResponseImpl _value, $Res Function(_$QuizResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseId = null,
    Object? questionId = null,
    Object? selectedOptionIndex = null,
    Object? isCorrect = null,
    Object? pointsEarned = null,
    Object? timeToAnswer = freezed,
    Object? attempts = null,
    Object? submittedAt = freezed,
  }) {
    return _then(_$QuizResponseImpl(
      responseId: null == responseId
          ? _value.responseId
          : responseId // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      selectedOptionIndex: null == selectedOptionIndex
          ? _value.selectedOptionIndex
          : selectedOptionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      pointsEarned: null == pointsEarned
          ? _value.pointsEarned
          : pointsEarned // ignore: cast_nullable_to_non_nullable
              as int,
      timeToAnswer: freezed == timeToAnswer
          ? _value.timeToAnswer
          : timeToAnswer // ignore: cast_nullable_to_non_nullable
              as int?,
      attempts: null == attempts
          ? _value.attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as int,
      submittedAt: freezed == submittedAt
          ? _value.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizResponseImpl implements _QuizResponse {
  const _$QuizResponseImpl(
      {required this.responseId,
      required this.questionId,
      required this.selectedOptionIndex,
      required this.isCorrect,
      required this.pointsEarned,
      this.timeToAnswer,
      this.attempts = 1,
      @TimestampConverter() this.submittedAt});

  factory _$QuizResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizResponseImplFromJson(json);

  /// Unique identifier for the response
  @override
  final String responseId;

  /// ID of the question being answered
  @override
  final String questionId;

  /// Index of the selected option
  @override
  final int selectedOptionIndex;

  /// Whether the response was correct
  @override
  final bool isCorrect;

  /// Points earned for this response
  @override
  final int pointsEarned;

  /// Time taken to answer in seconds
  @override
  final int? timeToAnswer;

  /// Number of attempts before getting correct answer
  @override
  @JsonKey()
  final int attempts;

  /// Timestamp when the response was submitted
  @override
  @TimestampConverter()
  final DateTime? submittedAt;

  @override
  String toString() {
    return 'QuizResponse(responseId: $responseId, questionId: $questionId, selectedOptionIndex: $selectedOptionIndex, isCorrect: $isCorrect, pointsEarned: $pointsEarned, timeToAnswer: $timeToAnswer, attempts: $attempts, submittedAt: $submittedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizResponseImpl &&
            (identical(other.responseId, responseId) ||
                other.responseId == responseId) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.selectedOptionIndex, selectedOptionIndex) ||
                other.selectedOptionIndex == selectedOptionIndex) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.pointsEarned, pointsEarned) ||
                other.pointsEarned == pointsEarned) &&
            (identical(other.timeToAnswer, timeToAnswer) ||
                other.timeToAnswer == timeToAnswer) &&
            (identical(other.attempts, attempts) ||
                other.attempts == attempts) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      responseId,
      questionId,
      selectedOptionIndex,
      isCorrect,
      pointsEarned,
      timeToAnswer,
      attempts,
      submittedAt);

  /// Create a copy of QuizResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizResponseImplCopyWith<_$QuizResponseImpl> get copyWith =>
      __$$QuizResponseImplCopyWithImpl<_$QuizResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizResponseImplToJson(
      this,
    );
  }
}

abstract class _QuizResponse implements QuizResponse {
  const factory _QuizResponse(
      {required final String responseId,
      required final String questionId,
      required final int selectedOptionIndex,
      required final bool isCorrect,
      required final int pointsEarned,
      final int? timeToAnswer,
      final int attempts,
      @TimestampConverter() final DateTime? submittedAt}) = _$QuizResponseImpl;

  factory _QuizResponse.fromJson(Map<String, dynamic> json) =
      _$QuizResponseImpl.fromJson;

  /// Unique identifier for the response
  @override
  String get responseId;

  /// ID of the question being answered
  @override
  String get questionId;

  /// Index of the selected option
  @override
  int get selectedOptionIndex;

  /// Whether the response was correct
  @override
  bool get isCorrect;

  /// Points earned for this response
  @override
  int get pointsEarned;

  /// Time taken to answer in seconds
  @override
  int? get timeToAnswer;

  /// Number of attempts before getting correct answer
  @override
  int get attempts;

  /// Timestamp when the response was submitted
  @override
  @TimestampConverter()
  DateTime? get submittedAt;

  /// Create a copy of QuizResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizResponseImplCopyWith<_$QuizResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
