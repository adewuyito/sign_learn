// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuizSession _$QuizSessionFromJson(Map<String, dynamic> json) {
  return _QuizSession.fromJson(json);
}

/// @nodoc
mixin _$QuizSession {
  /// Unique identifier for the session
  String get sessionId => throw _privateConstructorUsedError;

  /// User ID who is taking the quiz
  String get userId => throw _privateConstructorUsedError;

  /// Associated lesson ID (if any)
  String? get lessonId => throw _privateConstructorUsedError;

  /// List of questions in this quiz session
  List<QuizQuestion> get questions => throw _privateConstructorUsedError;

  /// Current question index
  int get currentQuestionIndex => throw _privateConstructorUsedError;

  /// List of user responses
  List<QuizResponse> get responses => throw _privateConstructorUsedError;

  /// Current session status
  QuizSessionStatus get status => throw _privateConstructorUsedError;

  /// Total score achieved
  int get totalScore => throw _privateConstructorUsedError;

  /// Maximum possible score
  int get maxPossibleScore => throw _privateConstructorUsedError;

  /// Number of correct answers
  int get correctAnswers => throw _privateConstructorUsedError;

  /// Total number of questions
  int get totalQuestions => throw _privateConstructorUsedError;

  /// Session start time
  @TimestampConverter()
  DateTime? get startedAt => throw _privateConstructorUsedError;

  /// Session completion time
  @TimestampConverter()
  DateTime? get completedAt => throw _privateConstructorUsedError;

  /// Session creation time
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Last update time
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this QuizSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizSessionCopyWith<QuizSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizSessionCopyWith<$Res> {
  factory $QuizSessionCopyWith(
          QuizSession value, $Res Function(QuizSession) then) =
      _$QuizSessionCopyWithImpl<$Res, QuizSession>;
  @useResult
  $Res call(
      {String sessionId,
      String userId,
      String? lessonId,
      List<QuizQuestion> questions,
      int currentQuestionIndex,
      List<QuizResponse> responses,
      QuizSessionStatus status,
      int totalScore,
      int maxPossibleScore,
      int correctAnswers,
      int totalQuestions,
      @TimestampConverter() DateTime? startedAt,
      @TimestampConverter() DateTime? completedAt,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class _$QuizSessionCopyWithImpl<$Res, $Val extends QuizSession>
    implements $QuizSessionCopyWith<$Res> {
  _$QuizSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? userId = null,
    Object? lessonId = freezed,
    Object? questions = null,
    Object? currentQuestionIndex = null,
    Object? responses = null,
    Object? status = null,
    Object? totalScore = null,
    Object? maxPossibleScore = null,
    Object? correctAnswers = null,
    Object? totalQuestions = null,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      lessonId: freezed == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String?,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuizQuestion>,
      currentQuestionIndex: null == currentQuestionIndex
          ? _value.currentQuestionIndex
          : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      responses: null == responses
          ? _value.responses
          : responses // ignore: cast_nullable_to_non_nullable
              as List<QuizResponse>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as QuizSessionStatus,
      totalScore: null == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int,
      maxPossibleScore: null == maxPossibleScore
          ? _value.maxPossibleScore
          : maxPossibleScore // ignore: cast_nullable_to_non_nullable
              as int,
      correctAnswers: null == correctAnswers
          ? _value.correctAnswers
          : correctAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      totalQuestions: null == totalQuestions
          ? _value.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
abstract class _$$QuizSessionImplCopyWith<$Res>
    implements $QuizSessionCopyWith<$Res> {
  factory _$$QuizSessionImplCopyWith(
          _$QuizSessionImpl value, $Res Function(_$QuizSessionImpl) then) =
      __$$QuizSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sessionId,
      String userId,
      String? lessonId,
      List<QuizQuestion> questions,
      int currentQuestionIndex,
      List<QuizResponse> responses,
      QuizSessionStatus status,
      int totalScore,
      int maxPossibleScore,
      int correctAnswers,
      int totalQuestions,
      @TimestampConverter() DateTime? startedAt,
      @TimestampConverter() DateTime? completedAt,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class __$$QuizSessionImplCopyWithImpl<$Res>
    extends _$QuizSessionCopyWithImpl<$Res, _$QuizSessionImpl>
    implements _$$QuizSessionImplCopyWith<$Res> {
  __$$QuizSessionImplCopyWithImpl(
      _$QuizSessionImpl _value, $Res Function(_$QuizSessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? userId = null,
    Object? lessonId = freezed,
    Object? questions = null,
    Object? currentQuestionIndex = null,
    Object? responses = null,
    Object? status = null,
    Object? totalScore = null,
    Object? maxPossibleScore = null,
    Object? correctAnswers = null,
    Object? totalQuestions = null,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$QuizSessionImpl(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      lessonId: freezed == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String?,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuizQuestion>,
      currentQuestionIndex: null == currentQuestionIndex
          ? _value.currentQuestionIndex
          : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      responses: null == responses
          ? _value._responses
          : responses // ignore: cast_nullable_to_non_nullable
              as List<QuizResponse>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as QuizSessionStatus,
      totalScore: null == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int,
      maxPossibleScore: null == maxPossibleScore
          ? _value.maxPossibleScore
          : maxPossibleScore // ignore: cast_nullable_to_non_nullable
              as int,
      correctAnswers: null == correctAnswers
          ? _value.correctAnswers
          : correctAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      totalQuestions: null == totalQuestions
          ? _value.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
class _$QuizSessionImpl implements _QuizSession {
  const _$QuizSessionImpl(
      {required this.sessionId,
      required this.userId,
      this.lessonId,
      required final List<QuizQuestion> questions,
      this.currentQuestionIndex = 0,
      final List<QuizResponse> responses = const [],
      this.status = QuizSessionStatus.notStarted,
      this.totalScore = 0,
      this.maxPossibleScore = 0,
      this.correctAnswers = 0,
      this.totalQuestions = 0,
      @TimestampConverter() this.startedAt,
      @TimestampConverter() this.completedAt,
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt})
      : _questions = questions,
        _responses = responses;

  factory _$QuizSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizSessionImplFromJson(json);

  /// Unique identifier for the session
  @override
  final String sessionId;

  /// User ID who is taking the quiz
  @override
  final String userId;

  /// Associated lesson ID (if any)
  @override
  final String? lessonId;

  /// List of questions in this quiz session
  final List<QuizQuestion> _questions;

  /// List of questions in this quiz session
  @override
  List<QuizQuestion> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  /// Current question index
  @override
  @JsonKey()
  final int currentQuestionIndex;

  /// List of user responses
  final List<QuizResponse> _responses;

  /// List of user responses
  @override
  @JsonKey()
  List<QuizResponse> get responses {
    if (_responses is EqualUnmodifiableListView) return _responses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_responses);
  }

  /// Current session status
  @override
  @JsonKey()
  final QuizSessionStatus status;

  /// Total score achieved
  @override
  @JsonKey()
  final int totalScore;

  /// Maximum possible score
  @override
  @JsonKey()
  final int maxPossibleScore;

  /// Number of correct answers
  @override
  @JsonKey()
  final int correctAnswers;

  /// Total number of questions
  @override
  @JsonKey()
  final int totalQuestions;

  /// Session start time
  @override
  @TimestampConverter()
  final DateTime? startedAt;

  /// Session completion time
  @override
  @TimestampConverter()
  final DateTime? completedAt;

  /// Session creation time
  @override
  @TimestampConverter()
  final DateTime? createdAt;

  /// Last update time
  @override
  @TimestampConverter()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'QuizSession(sessionId: $sessionId, userId: $userId, lessonId: $lessonId, questions: $questions, currentQuestionIndex: $currentQuestionIndex, responses: $responses, status: $status, totalScore: $totalScore, maxPossibleScore: $maxPossibleScore, correctAnswers: $correctAnswers, totalQuestions: $totalQuestions, startedAt: $startedAt, completedAt: $completedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizSessionImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            (identical(other.currentQuestionIndex, currentQuestionIndex) ||
                other.currentQuestionIndex == currentQuestionIndex) &&
            const DeepCollectionEquality()
                .equals(other._responses, _responses) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalScore, totalScore) ||
                other.totalScore == totalScore) &&
            (identical(other.maxPossibleScore, maxPossibleScore) ||
                other.maxPossibleScore == maxPossibleScore) &&
            (identical(other.correctAnswers, correctAnswers) ||
                other.correctAnswers == correctAnswers) &&
            (identical(other.totalQuestions, totalQuestions) ||
                other.totalQuestions == totalQuestions) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sessionId,
      userId,
      lessonId,
      const DeepCollectionEquality().hash(_questions),
      currentQuestionIndex,
      const DeepCollectionEquality().hash(_responses),
      status,
      totalScore,
      maxPossibleScore,
      correctAnswers,
      totalQuestions,
      startedAt,
      completedAt,
      createdAt,
      updatedAt);

  /// Create a copy of QuizSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizSessionImplCopyWith<_$QuizSessionImpl> get copyWith =>
      __$$QuizSessionImplCopyWithImpl<_$QuizSessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizSessionImplToJson(
      this,
    );
  }
}

abstract class _QuizSession implements QuizSession {
  const factory _QuizSession(
      {required final String sessionId,
      required final String userId,
      final String? lessonId,
      required final List<QuizQuestion> questions,
      final int currentQuestionIndex,
      final List<QuizResponse> responses,
      final QuizSessionStatus status,
      final int totalScore,
      final int maxPossibleScore,
      final int correctAnswers,
      final int totalQuestions,
      @TimestampConverter() final DateTime? startedAt,
      @TimestampConverter() final DateTime? completedAt,
      @TimestampConverter() final DateTime? createdAt,
      @TimestampConverter() final DateTime? updatedAt}) = _$QuizSessionImpl;

  factory _QuizSession.fromJson(Map<String, dynamic> json) =
      _$QuizSessionImpl.fromJson;

  /// Unique identifier for the session
  @override
  String get sessionId;

  /// User ID who is taking the quiz
  @override
  String get userId;

  /// Associated lesson ID (if any)
  @override
  String? get lessonId;

  /// List of questions in this quiz session
  @override
  List<QuizQuestion> get questions;

  /// Current question index
  @override
  int get currentQuestionIndex;

  /// List of user responses
  @override
  List<QuizResponse> get responses;

  /// Current session status
  @override
  QuizSessionStatus get status;

  /// Total score achieved
  @override
  int get totalScore;

  /// Maximum possible score
  @override
  int get maxPossibleScore;

  /// Number of correct answers
  @override
  int get correctAnswers;

  /// Total number of questions
  @override
  int get totalQuestions;

  /// Session start time
  @override
  @TimestampConverter()
  DateTime? get startedAt;

  /// Session completion time
  @override
  @TimestampConverter()
  DateTime? get completedAt;

  /// Session creation time
  @override
  @TimestampConverter()
  DateTime? get createdAt;

  /// Last update time
  @override
  @TimestampConverter()
  DateTime? get updatedAt;

  /// Create a copy of QuizSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizSessionImplCopyWith<_$QuizSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
