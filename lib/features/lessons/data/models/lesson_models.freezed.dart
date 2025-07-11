// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Lesson _$LessonFromJson(Map<String, dynamic> json) {
  return _Lesson.fromJson(json);
}

/// @nodoc
mixin _$Lesson {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<String> get videoTitles => throw _privateConstructorUsedError;
  int get unit =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(fromJson: categoryLevelFromJson, toJson: categoryLevelToJson)
  CategoryLevel get categoryLevel => throw _privateConstructorUsedError;
  List<String> get videoUrl => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;

  /// Serializes this Lesson to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Lesson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonCopyWith<Lesson> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonCopyWith<$Res> {
  factory $LessonCopyWith(Lesson value, $Res Function(Lesson) then) =
      _$LessonCopyWithImpl<$Res, Lesson>;
  @useResult
  $Res call(
      {String id,
      String title,
      List<String> videoTitles,
      int unit,
      @JsonKey(fromJson: categoryLevelFromJson, toJson: categoryLevelToJson)
      CategoryLevel categoryLevel,
      List<String> videoUrl,
      bool isCompleted});
}

/// @nodoc
class _$LessonCopyWithImpl<$Res, $Val extends Lesson>
    implements $LessonCopyWith<$Res> {
  _$LessonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Lesson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? videoTitles = null,
    Object? unit = null,
    Object? categoryLevel = null,
    Object? videoUrl = null,
    Object? isCompleted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      videoTitles: null == videoTitles
          ? _value.videoTitles
          : videoTitles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as int,
      categoryLevel: null == categoryLevel
          ? _value.categoryLevel
          : categoryLevel // ignore: cast_nullable_to_non_nullable
              as CategoryLevel,
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonImplCopyWith<$Res> implements $LessonCopyWith<$Res> {
  factory _$$LessonImplCopyWith(
          _$LessonImpl value, $Res Function(_$LessonImpl) then) =
      __$$LessonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      List<String> videoTitles,
      int unit,
      @JsonKey(fromJson: categoryLevelFromJson, toJson: categoryLevelToJson)
      CategoryLevel categoryLevel,
      List<String> videoUrl,
      bool isCompleted});
}

/// @nodoc
class __$$LessonImplCopyWithImpl<$Res>
    extends _$LessonCopyWithImpl<$Res, _$LessonImpl>
    implements _$$LessonImplCopyWith<$Res> {
  __$$LessonImplCopyWithImpl(
      _$LessonImpl _value, $Res Function(_$LessonImpl) _then)
      : super(_value, _then);

  /// Create a copy of Lesson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? videoTitles = null,
    Object? unit = null,
    Object? categoryLevel = null,
    Object? videoUrl = null,
    Object? isCompleted = null,
  }) {
    return _then(_$LessonImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      videoTitles: null == videoTitles
          ? _value._videoTitles
          : videoTitles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as int,
      categoryLevel: null == categoryLevel
          ? _value.categoryLevel
          : categoryLevel // ignore: cast_nullable_to_non_nullable
              as CategoryLevel,
      videoUrl: null == videoUrl
          ? _value._videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonImpl implements _Lesson {
  const _$LessonImpl(
      {required this.id,
      required this.title,
      required final List<String> videoTitles,
      required this.unit,
      @JsonKey(fromJson: categoryLevelFromJson, toJson: categoryLevelToJson)
      required this.categoryLevel,
      required final List<String> videoUrl,
      this.isCompleted = false})
      : _videoTitles = videoTitles,
        _videoUrl = videoUrl;

  factory _$LessonImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  final List<String> _videoTitles;
  @override
  List<String> get videoTitles {
    if (_videoTitles is EqualUnmodifiableListView) return _videoTitles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videoTitles);
  }

  @override
  final int unit;
// ignore: invalid_annotation_target
  @override
  @JsonKey(fromJson: categoryLevelFromJson, toJson: categoryLevelToJson)
  final CategoryLevel categoryLevel;
  final List<String> _videoUrl;
  @override
  List<String> get videoUrl {
    if (_videoUrl is EqualUnmodifiableListView) return _videoUrl;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videoUrl);
  }

  @override
  @JsonKey()
  final bool isCompleted;

  @override
  String toString() {
    return 'Lesson(id: $id, title: $title, videoTitles: $videoTitles, unit: $unit, categoryLevel: $categoryLevel, videoUrl: $videoUrl, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._videoTitles, _videoTitles) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.categoryLevel, categoryLevel) ||
                other.categoryLevel == categoryLevel) &&
            const DeepCollectionEquality().equals(other._videoUrl, _videoUrl) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      const DeepCollectionEquality().hash(_videoTitles),
      unit,
      categoryLevel,
      const DeepCollectionEquality().hash(_videoUrl),
      isCompleted);

  /// Create a copy of Lesson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonImplCopyWith<_$LessonImpl> get copyWith =>
      __$$LessonImplCopyWithImpl<_$LessonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonImplToJson(
      this,
    );
  }
}

abstract class _Lesson implements Lesson {
  const factory _Lesson(
      {required final String id,
      required final String title,
      required final List<String> videoTitles,
      required final int unit,
      @JsonKey(fromJson: categoryLevelFromJson, toJson: categoryLevelToJson)
      required final CategoryLevel categoryLevel,
      required final List<String> videoUrl,
      final bool isCompleted}) = _$LessonImpl;

  factory _Lesson.fromJson(Map<String, dynamic> json) = _$LessonImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  List<String> get videoTitles;
  @override
  int get unit; // ignore: invalid_annotation_target
  @override
  @JsonKey(fromJson: categoryLevelFromJson, toJson: categoryLevelToJson)
  CategoryLevel get categoryLevel;
  @override
  List<String> get videoUrl;
  @override
  bool get isCompleted;

  /// Create a copy of Lesson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonImplCopyWith<_$LessonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
