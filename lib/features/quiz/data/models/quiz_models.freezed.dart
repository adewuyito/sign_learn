// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuizModel _$QuizModelFromJson(Map<String, dynamic> json) {
  return _QuizModel.fromJson(json);
}

/// @nodoc
mixin _$QuizModel {
  String get quizId => throw _privateConstructorUsedError;
  String get lessonId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _questionsFromJson, toJson: _questionsToJson)
  List<QuizQuestionModel> get questions => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;

  /// Serializes this QuizModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizModelCopyWith<QuizModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizModelCopyWith<$Res> {
  factory $QuizModelCopyWith(QuizModel value, $Res Function(QuizModel) then) =
      _$QuizModelCopyWithImpl<$Res, QuizModel>;
  @useResult
  $Res call(
      {String quizId,
      String lessonId,
      String title,
      String? description,
      @JsonKey(fromJson: _questionsFromJson, toJson: _questionsToJson)
      List<QuizQuestionModel> questions,
      int order});
}

/// @nodoc
class _$QuizModelCopyWithImpl<$Res, $Val extends QuizModel>
    implements $QuizModelCopyWith<$Res> {
  _$QuizModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizId = null,
    Object? lessonId = null,
    Object? title = null,
    Object? description = freezed,
    Object? questions = null,
    Object? order = null,
  }) {
    return _then(_value.copyWith(
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as String,
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuizQuestionModel>,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizModelImplCopyWith<$Res>
    implements $QuizModelCopyWith<$Res> {
  factory _$$QuizModelImplCopyWith(
          _$QuizModelImpl value, $Res Function(_$QuizModelImpl) then) =
      __$$QuizModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String quizId,
      String lessonId,
      String title,
      String? description,
      @JsonKey(fromJson: _questionsFromJson, toJson: _questionsToJson)
      List<QuizQuestionModel> questions,
      int order});
}

/// @nodoc
class __$$QuizModelImplCopyWithImpl<$Res>
    extends _$QuizModelCopyWithImpl<$Res, _$QuizModelImpl>
    implements _$$QuizModelImplCopyWith<$Res> {
  __$$QuizModelImplCopyWithImpl(
      _$QuizModelImpl _value, $Res Function(_$QuizModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizId = null,
    Object? lessonId = null,
    Object? title = null,
    Object? description = freezed,
    Object? questions = null,
    Object? order = null,
  }) {
    return _then(_$QuizModelImpl(
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as String,
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuizQuestionModel>,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizModelImpl implements _QuizModel {
  const _$QuizModelImpl(
      {required this.quizId,
      required this.lessonId,
      required this.title,
      this.description,
      @JsonKey(fromJson: _questionsFromJson, toJson: _questionsToJson)
      required final List<QuizQuestionModel> questions,
      required this.order})
      : _questions = questions;

  factory _$QuizModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizModelImplFromJson(json);

  @override
  final String quizId;
  @override
  final String lessonId;
  @override
  final String title;
  @override
  final String? description;
  final List<QuizQuestionModel> _questions;
  @override
  @JsonKey(fromJson: _questionsFromJson, toJson: _questionsToJson)
  List<QuizQuestionModel> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  final int order;

  @override
  String toString() {
    return 'QuizModel(quizId: $quizId, lessonId: $lessonId, title: $title, description: $description, questions: $questions, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizModelImpl &&
            (identical(other.quizId, quizId) || other.quizId == quizId) &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, quizId, lessonId, title,
      description, const DeepCollectionEquality().hash(_questions), order);

  /// Create a copy of QuizModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizModelImplCopyWith<_$QuizModelImpl> get copyWith =>
      __$$QuizModelImplCopyWithImpl<_$QuizModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizModelImplToJson(
      this,
    );
  }
}

abstract class _QuizModel implements QuizModel {
  const factory _QuizModel(
      {required final String quizId,
      required final String lessonId,
      required final String title,
      final String? description,
      @JsonKey(fromJson: _questionsFromJson, toJson: _questionsToJson)
      required final List<QuizQuestionModel> questions,
      required final int order}) = _$QuizModelImpl;

  factory _QuizModel.fromJson(Map<String, dynamic> json) =
      _$QuizModelImpl.fromJson;

  @override
  String get quizId;
  @override
  String get lessonId;
  @override
  String get title;
  @override
  String? get description;
  @override
  @JsonKey(fromJson: _questionsFromJson, toJson: _questionsToJson)
  List<QuizQuestionModel> get questions;
  @override
  int get order;

  /// Create a copy of QuizModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizModelImplCopyWith<_$QuizModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizQuestionModel _$QuizQuestionModelFromJson(Map<String, dynamic> json) {
  return _QuizQuestionModel.fromJson(json);
}

/// @nodoc
mixin _$QuizQuestionModel {
  String get questionId => throw _privateConstructorUsedError;
  MediaType get mediaType => throw _privateConstructorUsedError;
  String get mediaUrl => throw _privateConstructorUsedError;
  String? get questionText => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _optionsFromJson, toJson: _optionsToJson)
  List<QuizOptionModel> get options => throw _privateConstructorUsedError;
  int get correctOptionIndex => throw _privateConstructorUsedError;

  /// Serializes this QuizQuestionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizQuestionModelCopyWith<QuizQuestionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizQuestionModelCopyWith<$Res> {
  factory $QuizQuestionModelCopyWith(
          QuizQuestionModel value, $Res Function(QuizQuestionModel) then) =
      _$QuizQuestionModelCopyWithImpl<$Res, QuizQuestionModel>;
  @useResult
  $Res call(
      {String questionId,
      MediaType mediaType,
      String mediaUrl,
      String? questionText,
      @JsonKey(fromJson: _optionsFromJson, toJson: _optionsToJson)
      List<QuizOptionModel> options,
      int correctOptionIndex});
}

/// @nodoc
class _$QuizQuestionModelCopyWithImpl<$Res, $Val extends QuizQuestionModel>
    implements $QuizQuestionModelCopyWith<$Res> {
  _$QuizQuestionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? mediaType = null,
    Object? mediaUrl = null,
    Object? questionText = freezed,
    Object? options = null,
    Object? correctOptionIndex = null,
  }) {
    return _then(_value.copyWith(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as MediaType,
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      questionText: freezed == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String?,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<QuizOptionModel>,
      correctOptionIndex: null == correctOptionIndex
          ? _value.correctOptionIndex
          : correctOptionIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizQuestionModelImplCopyWith<$Res>
    implements $QuizQuestionModelCopyWith<$Res> {
  factory _$$QuizQuestionModelImplCopyWith(_$QuizQuestionModelImpl value,
          $Res Function(_$QuizQuestionModelImpl) then) =
      __$$QuizQuestionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String questionId,
      MediaType mediaType,
      String mediaUrl,
      String? questionText,
      @JsonKey(fromJson: _optionsFromJson, toJson: _optionsToJson)
      List<QuizOptionModel> options,
      int correctOptionIndex});
}

/// @nodoc
class __$$QuizQuestionModelImplCopyWithImpl<$Res>
    extends _$QuizQuestionModelCopyWithImpl<$Res, _$QuizQuestionModelImpl>
    implements _$$QuizQuestionModelImplCopyWith<$Res> {
  __$$QuizQuestionModelImplCopyWithImpl(_$QuizQuestionModelImpl _value,
      $Res Function(_$QuizQuestionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? mediaType = null,
    Object? mediaUrl = null,
    Object? questionText = freezed,
    Object? options = null,
    Object? correctOptionIndex = null,
  }) {
    return _then(_$QuizQuestionModelImpl(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as MediaType,
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      questionText: freezed == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String?,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<QuizOptionModel>,
      correctOptionIndex: null == correctOptionIndex
          ? _value.correctOptionIndex
          : correctOptionIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizQuestionModelImpl implements _QuizQuestionModel {
  const _$QuizQuestionModelImpl(
      {required this.questionId,
      required this.mediaType,
      required this.mediaUrl,
      this.questionText,
      @JsonKey(fromJson: _optionsFromJson, toJson: _optionsToJson)
      required final List<QuizOptionModel> options,
      required this.correctOptionIndex})
      : _options = options;

  factory _$QuizQuestionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizQuestionModelImplFromJson(json);

  @override
  final String questionId;
  @override
  final MediaType mediaType;
  @override
  final String mediaUrl;
  @override
  final String? questionText;
  final List<QuizOptionModel> _options;
  @override
  @JsonKey(fromJson: _optionsFromJson, toJson: _optionsToJson)
  List<QuizOptionModel> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  final int correctOptionIndex;

  @override
  String toString() {
    return 'QuizQuestionModel(questionId: $questionId, mediaType: $mediaType, mediaUrl: $mediaUrl, questionText: $questionText, options: $options, correctOptionIndex: $correctOptionIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizQuestionModelImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.correctOptionIndex, correctOptionIndex) ||
                other.correctOptionIndex == correctOptionIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      questionId,
      mediaType,
      mediaUrl,
      questionText,
      const DeepCollectionEquality().hash(_options),
      correctOptionIndex);

  /// Create a copy of QuizQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizQuestionModelImplCopyWith<_$QuizQuestionModelImpl> get copyWith =>
      __$$QuizQuestionModelImplCopyWithImpl<_$QuizQuestionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizQuestionModelImplToJson(
      this,
    );
  }
}

abstract class _QuizQuestionModel implements QuizQuestionModel {
  const factory _QuizQuestionModel(
      {required final String questionId,
      required final MediaType mediaType,
      required final String mediaUrl,
      final String? questionText,
      @JsonKey(fromJson: _optionsFromJson, toJson: _optionsToJson)
      required final List<QuizOptionModel> options,
      required final int correctOptionIndex}) = _$QuizQuestionModelImpl;

  factory _QuizQuestionModel.fromJson(Map<String, dynamic> json) =
      _$QuizQuestionModelImpl.fromJson;

  @override
  String get questionId;
  @override
  MediaType get mediaType;
  @override
  String get mediaUrl;
  @override
  String? get questionText;
  @override
  @JsonKey(fromJson: _optionsFromJson, toJson: _optionsToJson)
  List<QuizOptionModel> get options;
  @override
  int get correctOptionIndex;

  /// Create a copy of QuizQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizQuestionModelImplCopyWith<_$QuizQuestionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizOptionModel _$QuizOptionModelFromJson(Map<String, dynamic> json) {
  return _QuizOptionModel.fromJson(json);
}

/// @nodoc
mixin _$QuizOptionModel {
  String get optionId => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  /// Serializes this QuizOptionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizOptionModelCopyWith<QuizOptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizOptionModelCopyWith<$Res> {
  factory $QuizOptionModelCopyWith(
          QuizOptionModel value, $Res Function(QuizOptionModel) then) =
      _$QuizOptionModelCopyWithImpl<$Res, QuizOptionModel>;
  @useResult
  $Res call({String optionId, String text});
}

/// @nodoc
class _$QuizOptionModelCopyWithImpl<$Res, $Val extends QuizOptionModel>
    implements $QuizOptionModelCopyWith<$Res> {
  _$QuizOptionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? optionId = null,
    Object? text = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizOptionModelImplCopyWith<$Res>
    implements $QuizOptionModelCopyWith<$Res> {
  factory _$$QuizOptionModelImplCopyWith(_$QuizOptionModelImpl value,
          $Res Function(_$QuizOptionModelImpl) then) =
      __$$QuizOptionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String optionId, String text});
}

/// @nodoc
class __$$QuizOptionModelImplCopyWithImpl<$Res>
    extends _$QuizOptionModelCopyWithImpl<$Res, _$QuizOptionModelImpl>
    implements _$$QuizOptionModelImplCopyWith<$Res> {
  __$$QuizOptionModelImplCopyWithImpl(
      _$QuizOptionModelImpl _value, $Res Function(_$QuizOptionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? optionId = null,
    Object? text = null,
  }) {
    return _then(_$QuizOptionModelImpl(
      optionId: null == optionId
          ? _value.optionId
          : optionId // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizOptionModelImpl implements _QuizOptionModel {
  const _$QuizOptionModelImpl({required this.optionId, required this.text});

  factory _$QuizOptionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizOptionModelImplFromJson(json);

  @override
  final String optionId;
  @override
  final String text;

  @override
  String toString() {
    return 'QuizOptionModel(optionId: $optionId, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizOptionModelImpl &&
            (identical(other.optionId, optionId) ||
                other.optionId == optionId) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, optionId, text);

  /// Create a copy of QuizOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizOptionModelImplCopyWith<_$QuizOptionModelImpl> get copyWith =>
      __$$QuizOptionModelImplCopyWithImpl<_$QuizOptionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizOptionModelImplToJson(
      this,
    );
  }
}

abstract class _QuizOptionModel implements QuizOptionModel {
  const factory _QuizOptionModel(
      {required final String optionId,
      required final String text}) = _$QuizOptionModelImpl;

  factory _QuizOptionModel.fromJson(Map<String, dynamic> json) =
      _$QuizOptionModelImpl.fromJson;

  @override
  String get optionId;
  @override
  String get text;

  /// Create a copy of QuizOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizOptionModelImplCopyWith<_$QuizOptionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
