// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LessonModel _$LessonModelFromJson(Map<String, dynamic> json) {
  return _LessonModel.fromJson(json);
}

/// @nodoc
mixin _$LessonModel {
  /// Firestore doc ID (not stored inside doc)
  String get lessonId => throw _privateConstructorUsedError;

  /// Visible title in the UI
  String get title => throw _privateConstructorUsedError;

  /// Optional subtitle/summary
  String? get description => throw _privateConstructorUsedError;

  /// Ordered list of clip URLs to play in sequence
  List<String> get videoUrls => throw _privateConstructorUsedError;

  /// Sort order within its unit (1,2,3…)
  int get order => throw _privateConstructorUsedError;

  /// (Client‑side flag; don’t persist unless you need)
  bool get isCompleted => throw _privateConstructorUsedError;
  String get parentLesson => throw _privateConstructorUsedError;
  int get unitOrder => throw _privateConstructorUsedError;

  /// Firestore timestamps
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this LessonModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonModelCopyWith<LessonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonModelCopyWith<$Res> {
  factory $LessonModelCopyWith(
          LessonModel value, $Res Function(LessonModel) then) =
      _$LessonModelCopyWithImpl<$Res, LessonModel>;
  @useResult
  $Res call(
      {String lessonId,
      String title,
      String? description,
      List<String> videoUrls,
      int order,
      bool isCompleted,
      String parentLesson,
      int unitOrder,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class _$LessonModelCopyWithImpl<$Res, $Val extends LessonModel>
    implements $LessonModelCopyWith<$Res> {
  _$LessonModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lessonId = null,
    Object? title = null,
    Object? description = freezed,
    Object? videoUrls = null,
    Object? order = null,
    Object? isCompleted = null,
    Object? parentLesson = null,
    Object? unitOrder = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
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
      videoUrls: null == videoUrls
          ? _value.videoUrls
          : videoUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      parentLesson: null == parentLesson
          ? _value.parentLesson
          : parentLesson // ignore: cast_nullable_to_non_nullable
              as String,
      unitOrder: null == unitOrder
          ? _value.unitOrder
          : unitOrder // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$LessonModelImplCopyWith<$Res>
    implements $LessonModelCopyWith<$Res> {
  factory _$$LessonModelImplCopyWith(
          _$LessonModelImpl value, $Res Function(_$LessonModelImpl) then) =
      __$$LessonModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String lessonId,
      String title,
      String? description,
      List<String> videoUrls,
      int order,
      bool isCompleted,
      String parentLesson,
      int unitOrder,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class __$$LessonModelImplCopyWithImpl<$Res>
    extends _$LessonModelCopyWithImpl<$Res, _$LessonModelImpl>
    implements _$$LessonModelImplCopyWith<$Res> {
  __$$LessonModelImplCopyWithImpl(
      _$LessonModelImpl _value, $Res Function(_$LessonModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lessonId = null,
    Object? title = null,
    Object? description = freezed,
    Object? videoUrls = null,
    Object? order = null,
    Object? isCompleted = null,
    Object? parentLesson = null,
    Object? unitOrder = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$LessonModelImpl(
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
      videoUrls: null == videoUrls
          ? _value._videoUrls
          : videoUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      parentLesson: null == parentLesson
          ? _value.parentLesson
          : parentLesson // ignore: cast_nullable_to_non_nullable
              as String,
      unitOrder: null == unitOrder
          ? _value.unitOrder
          : unitOrder // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$LessonModelImpl implements _LessonModel {
  const _$LessonModelImpl(
      {required this.lessonId,
      required this.title,
      this.description,
      required final List<String> videoUrls,
      required this.order,
      this.isCompleted = false,
      this.parentLesson = 'asl_lesson1',
      required this.unitOrder,
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt})
      : _videoUrls = videoUrls;

  factory _$LessonModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonModelImplFromJson(json);

  /// Firestore doc ID (not stored inside doc)
  @override
  final String lessonId;

  /// Visible title in the UI
  @override
  final String title;

  /// Optional subtitle/summary
  @override
  final String? description;

  /// Ordered list of clip URLs to play in sequence
  final List<String> _videoUrls;

  /// Ordered list of clip URLs to play in sequence
  @override
  List<String> get videoUrls {
    if (_videoUrls is EqualUnmodifiableListView) return _videoUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videoUrls);
  }

  /// Sort order within its unit (1,2,3…)
  @override
  final int order;

  /// (Client‑side flag; don’t persist unless you need)
  @override
  @JsonKey()
  final bool isCompleted;
  @override
  @JsonKey()
  final String parentLesson;
  @override
  final int unitOrder;

  /// Firestore timestamps
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @TimestampConverter()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'LessonModel(lessonId: $lessonId, title: $title, description: $description, videoUrls: $videoUrls, order: $order, isCompleted: $isCompleted, parentLesson: $parentLesson, unitOrder: $unitOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonModelImpl &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._videoUrls, _videoUrls) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.parentLesson, parentLesson) ||
                other.parentLesson == parentLesson) &&
            (identical(other.unitOrder, unitOrder) ||
                other.unitOrder == unitOrder) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      lessonId,
      title,
      description,
      const DeepCollectionEquality().hash(_videoUrls),
      order,
      isCompleted,
      parentLesson,
      unitOrder,
      createdAt,
      updatedAt);

  /// Create a copy of LessonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonModelImplCopyWith<_$LessonModelImpl> get copyWith =>
      __$$LessonModelImplCopyWithImpl<_$LessonModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonModelImplToJson(
      this,
    );
  }
}

abstract class _LessonModel implements LessonModel {
  const factory _LessonModel(
      {required final String lessonId,
      required final String title,
      final String? description,
      required final List<String> videoUrls,
      required final int order,
      final bool isCompleted,
      final String parentLesson,
      required final int unitOrder,
      @TimestampConverter() final DateTime? createdAt,
      @TimestampConverter() final DateTime? updatedAt}) = _$LessonModelImpl;

  factory _LessonModel.fromJson(Map<String, dynamic> json) =
      _$LessonModelImpl.fromJson;

  /// Firestore doc ID (not stored inside doc)
  @override
  String get lessonId;

  /// Visible title in the UI
  @override
  String get title;

  /// Optional subtitle/summary
  @override
  String? get description;

  /// Ordered list of clip URLs to play in sequence
  @override
  List<String> get videoUrls;

  /// Sort order within its unit (1,2,3…)
  @override
  int get order;

  /// (Client‑side flag; don’t persist unless you need)
  @override
  bool get isCompleted;
  @override
  String get parentLesson;
  @override
  int get unitOrder;

  /// Firestore timestamps
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @TimestampConverter()
  DateTime? get updatedAt;

  /// Create a copy of LessonModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonModelImplCopyWith<_$LessonModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
