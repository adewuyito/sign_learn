// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuizQuestion _$QuizQuestionFromJson(Map<String, dynamic> json) {
  return _QuizQuestion.fromJson(json);
}

/// @nodoc
mixin _$QuizQuestion {
  /// Unique identifier for the question
  String get questionId => throw _privateConstructorUsedError;

  /// The question text to display
  String get questionText => throw _privateConstructorUsedError;

  /// Type of question (text, video, image)
  QuestionType get type => throw _privateConstructorUsedError;

  /// URL for video or image content (null for text questions)
  String? get mediaUrl => throw _privateConstructorUsedError;

  /// List of possible answer options
  List<QuizOption> get options => throw _privateConstructorUsedError;

  /// Index of the correct answer in options list
  int get correctAnswerIndex => throw _privateConstructorUsedError;

  /// Optional explanation for the answer
  String? get explanation => throw _privateConstructorUsedError;

  /// Difficulty level (1-5)
  int get difficulty => throw _privateConstructorUsedError;

  /// Points awarded for correct answer
  int get points => throw _privateConstructorUsedError;

  /// Time limit in seconds (optional)
  int? get timeLimit => throw _privateConstructorUsedError;

  /// Associated lesson ID
  String? get lessonId => throw _privateConstructorUsedError;

  /// Firestore timestamps
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this QuizQuestion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizQuestionCopyWith<QuizQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizQuestionCopyWith<$Res> {
  factory $QuizQuestionCopyWith(
          QuizQuestion value, $Res Function(QuizQuestion) then) =
      _$QuizQuestionCopyWithImpl<$Res, QuizQuestion>;
  @useResult
  $Res call(
      {String questionId,
      String questionText,
      QuestionType type,
      String? mediaUrl,
      List<QuizOption> options,
      int correctAnswerIndex,
      String? explanation,
      int difficulty,
      int points,
      int? timeLimit,
      String? lessonId,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class _$QuizQuestionCopyWithImpl<$Res, $Val extends QuizQuestion>
    implements $QuizQuestionCopyWith<$Res> {
  _$QuizQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? questionText = null,
    Object? type = null,
    Object? mediaUrl = freezed,
    Object? options = null,
    Object? correctAnswerIndex = null,
    Object? explanation = freezed,
    Object? difficulty = null,
    Object? points = null,
    Object? timeLimit = freezed,
    Object? lessonId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      questionText: null == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as QuestionType,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<QuizOption>,
      correctAnswerIndex: null == correctAnswerIndex
          ? _value.correctAnswerIndex
          : correctAnswerIndex // ignore: cast_nullable_to_non_nullable
              as int,
      explanation: freezed == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      timeLimit: freezed == timeLimit
          ? _value.timeLimit
          : timeLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      lessonId: freezed == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizQuestionImplCopyWith<$Res>
    implements $QuizQuestionCopyWith<$Res> {
  factory _$$QuizQuestionImplCopyWith(
          _$QuizQuestionImpl value, $Res Function(_$QuizQuestionImpl) then) =
      __$$QuizQuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String questionId,
      String questionText,
      QuestionType type,
      String? mediaUrl,
      List<QuizOption> options,
      int correctAnswerIndex,
      String? explanation,
      int difficulty,
      int points,
      int? timeLimit,
      String? lessonId,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class __$$QuizQuestionImplCopyWithImpl<$Res>
    extends _$QuizQuestionCopyWithImpl<$Res, _$QuizQuestionImpl>
    implements _$$QuizQuestionImplCopyWith<$Res> {
  __$$QuizQuestionImplCopyWithImpl(
      _$QuizQuestionImpl _value, $Res Function(_$QuizQuestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? questionText = null,
    Object? type = null,
    Object? mediaUrl = freezed,
    Object? options = null,
    Object? correctAnswerIndex = null,
    Object? explanation = freezed,
    Object? difficulty = null,
    Object? points = null,
    Object? timeLimit = freezed,
    Object? lessonId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$QuizQuestionImpl(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      questionText: null == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as QuestionType,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<QuizOption>,
      correctAnswerIndex: null == correctAnswerIndex
          ? _value.correctAnswerIndex
          : correctAnswerIndex // ignore: cast_nullable_to_non_nullable
              as int,
      explanation: freezed == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      timeLimit: freezed == timeLimit
          ? _value.timeLimit
          : timeLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      lessonId: freezed == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizQuestionImpl implements _QuizQuestion {
  const _$QuizQuestionImpl(
      {required this.questionId,
      required this.questionText,
      required this.type,
      this.mediaUrl,
      required final List<QuizOption> options,
      required this.correctAnswerIndex,
      this.explanation,
      this.difficulty = 1,
      this.points = 10,
      this.timeLimit,
      this.lessonId,
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt})
      : _options = options;

  factory _$QuizQuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizQuestionImplFromJson(json);

  /// Unique identifier for the question
  @override
  final String questionId;

  /// The question text to display
  @override
  final String questionText;

  /// Type of question (text, video, image)
  @override
  final QuestionType type;

  /// URL for video or image content (null for text questions)
  @override
  final String? mediaUrl;

  /// List of possible answer options
  final List<QuizOption> _options;

  /// List of possible answer options
  @override
  List<QuizOption> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  /// Index of the correct answer in options list
  @override
  final int correctAnswerIndex;

  /// Optional explanation for the answer
  @override
  final String? explanation;

  /// Difficulty level (1-5)
  @override
  @JsonKey()
  final int difficulty;

  /// Points awarded for correct answer
  @override
  @JsonKey()
  final int points;

  /// Time limit in seconds (optional)
  @override
  final int? timeLimit;

  /// Associated lesson ID
  @override
  final String? lessonId;

  /// Firestore timestamps
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @TimestampConverter()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'QuizQuestion(questionId: $questionId, questionText: $questionText, type: $type, mediaUrl: $mediaUrl, options: $options, correctAnswerIndex: $correctAnswerIndex, explanation: $explanation, difficulty: $difficulty, points: $points, timeLimit: $timeLimit, lessonId: $lessonId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizQuestionImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.correctAnswerIndex, correctAnswerIndex) ||
                other.correctAnswerIndex == correctAnswerIndex) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.timeLimit, timeLimit) ||
                other.timeLimit == timeLimit) &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      questionId,
      questionText,
      type,
      mediaUrl,
      const DeepCollectionEquality().hash(_options),
      correctAnswerIndex,
      explanation,
      difficulty,
      points,
      timeLimit,
      lessonId,
      createdAt,
      updatedAt);

  /// Create a copy of QuizQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizQuestionImplCopyWith<_$QuizQuestionImpl> get copyWith =>
      __$$QuizQuestionImplCopyWithImpl<_$QuizQuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizQuestionImplToJson(
      this,
    );
  }
}

abstract class _QuizQuestion implements QuizQuestion {
  const factory _QuizQuestion(
      {required final String questionId,
      required final String questionText,
      required final QuestionType type,
      final String? mediaUrl,
      required final List<QuizOption> options,
      required final int correctAnswerIndex,
      final String? explanation,
      final int difficulty,
      final int points,
      final int? timeLimit,
      final String? lessonId,
      @TimestampConverter() final DateTime? createdAt,
      @TimestampConverter() final DateTime? updatedAt}) = _$QuizQuestionImpl;

  factory _QuizQuestion.fromJson(Map<String, dynamic> json) =
      _$QuizQuestionImpl.fromJson;

  /// Unique identifier for the question
  @override
  String get questionId;

  /// The question text to display
  @override
  String get questionText;

  /// Type of question (text, video, image)
  @override
  QuestionType get type;

  /// URL for video or image content (null for text questions)
  @override
  String? get mediaUrl;

  /// List of possible answer options
  @override
  List<QuizOption> get options;

  /// Index of the correct answer in options list
  @override
  int get correctAnswerIndex;

  /// Optional explanation for the answer
  @override
  String? get explanation;

  /// Difficulty level (1-5)
  @override
  int get difficulty;

  /// Points awarded for correct answer
  @override
  int get points;

  /// Time limit in seconds (optional)
  @override
  int? get timeLimit;

  /// Associated lesson ID
  @override
  String? get lessonId;

  /// Firestore timestamps
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @TimestampConverter()
  DateTime? get updatedAt;

  /// Create a copy of QuizQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizQuestionImplCopyWith<_$QuizQuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizOption _$QuizOptionFromJson(Map<String, dynamic> json) {
  return _QuizOption.fromJson(json);
}

/// @nodoc
mixin _$QuizOption {
  /// Unique identifier for the option
  String get optionId => throw _privateConstructorUsedError;

  /// Text content of the option
  String get text => throw _privateConstructorUsedError;

  /// Optional image URL for the option
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Whether this option is correct
  bool get isCorrect => throw _privateConstructorUsedError;

  /// Display order
  int get order => throw _privateConstructorUsedError;

  /// Serializes this QuizOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizOptionCopyWith<QuizOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizOptionCopyWith<$Res> {
  factory $QuizOptionCopyWith(
          QuizOption value, $Res Function(QuizOption) then) =
      _$QuizOptionCopyWithImpl<$Res, QuizOption>;
  @useResult
  $Res call(
      {String optionId,
      String text,
      String? imageUrl,
      bool isCorrect,
      int order});
}

/// @nodoc
class _$QuizOptionCopyWithImpl<$Res, $Val extends QuizOption>
    implements $QuizOptionCopyWith<$Res> {
  _$QuizOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? optionId = null,
    Object? text = null,
    Object? imageUrl = freezed,
    Object? isCorrect = null,
    Object? order = null,
  }) {
    return _then(_value.copyWith(
      optionId: null == optionId
          ? _value.optionId
          : optionId // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizOptionImplCopyWith<$Res>
    implements $QuizOptionCopyWith<$Res> {
  factory _$$QuizOptionImplCopyWith(
          _$QuizOptionImpl value, $Res Function(_$QuizOptionImpl) then) =
      __$$QuizOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String optionId,
      String text,
      String? imageUrl,
      bool isCorrect,
      int order});
}

/// @nodoc
class __$$QuizOptionImplCopyWithImpl<$Res>
    extends _$QuizOptionCopyWithImpl<$Res, _$QuizOptionImpl>
    implements _$$QuizOptionImplCopyWith<$Res> {
  __$$QuizOptionImplCopyWithImpl(
      _$QuizOptionImpl _value, $Res Function(_$QuizOptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? optionId = null,
    Object? text = null,
    Object? imageUrl = freezed,
    Object? isCorrect = null,
    Object? order = null,
  }) {
    return _then(_$QuizOptionImpl(
      optionId: null == optionId
          ? _value.optionId
          : optionId // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizOptionImpl implements _QuizOption {
  const _$QuizOptionImpl(
      {required this.optionId,
      required this.text,
      this.imageUrl,
      this.isCorrect = false,
      this.order = 0});

  factory _$QuizOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizOptionImplFromJson(json);

  /// Unique identifier for the option
  @override
  final String optionId;

  /// Text content of the option
  @override
  final String text;

  /// Optional image URL for the option
  @override
  final String? imageUrl;

  /// Whether this option is correct
  @override
  @JsonKey()
  final bool isCorrect;

  /// Display order
  @override
  @JsonKey()
  final int order;

  @override
  String toString() {
    return 'QuizOption(optionId: $optionId, text: $text, imageUrl: $imageUrl, isCorrect: $isCorrect, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizOptionImpl &&
            (identical(other.optionId, optionId) ||
                other.optionId == optionId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, optionId, text, imageUrl, isCorrect, order);

  /// Create a copy of QuizOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizOptionImplCopyWith<_$QuizOptionImpl> get copyWith =>
      __$$QuizOptionImplCopyWithImpl<_$QuizOptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizOptionImplToJson(
      this,
    );
  }
}

abstract class _QuizOption implements QuizOption {
  const factory _QuizOption(
      {required final String optionId,
      required final String text,
      final String? imageUrl,
      final bool isCorrect,
      final int order}) = _$QuizOptionImpl;

  factory _QuizOption.fromJson(Map<String, dynamic> json) =
      _$QuizOptionImpl.fromJson;

  /// Unique identifier for the option
  @override
  String get optionId;

  /// Text content of the option
  @override
  String get text;

  /// Optional image URL for the option
  @override
  String? get imageUrl;

  /// Whether this option is correct
  @override
  bool get isCorrect;

  /// Display order
  @override
  int get order;

  /// Create a copy of QuizOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizOptionImplCopyWith<_$QuizOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
