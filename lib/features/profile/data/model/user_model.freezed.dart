// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _UserInfoModel.fromJson(json);
    case 'unknown':
      return _UserInfoModelUnknown.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'UserInfoModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$UserInfoModel {
  String get userId => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get displayImage => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String userId,
            String? displayName,
            String? email,
            String? displayImage,
            @TimestampConverter() DateTime? createdAt,
            @TimestampConverter() DateTime? updatedAt)
        $default, {
    required TResult Function(
            String userId,
            String? displayName,
            String? email,
            String? displayImage,
            @TimestampConverter() DateTime? createdAt,
            @TimestampConverter() DateTime? updatedAt)
        unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String userId,
            String? displayName,
            String? email,
            String? displayImage,
            @TimestampConverter() DateTime? createdAt,
            @TimestampConverter() DateTime? updatedAt)?
        $default, {
    TResult? Function(
            String userId,
            String? displayName,
            String? email,
            String? displayImage,
            @TimestampConverter() DateTime? createdAt,
            @TimestampConverter() DateTime? updatedAt)?
        unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String userId,
            String? displayName,
            String? email,
            String? displayImage,
            @TimestampConverter() DateTime? createdAt,
            @TimestampConverter() DateTime? updatedAt)?
        $default, {
    TResult Function(
            String userId,
            String? displayName,
            String? email,
            String? displayImage,
            @TimestampConverter() DateTime? createdAt,
            @TimestampConverter() DateTime? updatedAt)?
        unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserInfoModel value) $default, {
    required TResult Function(_UserInfoModelUnknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserInfoModel value)? $default, {
    TResult? Function(_UserInfoModelUnknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserInfoModel value)? $default, {
    TResult Function(_UserInfoModelUnknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this UserInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserInfoModelCopyWith<UserInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoModelCopyWith<$Res> {
  factory $UserInfoModelCopyWith(
          UserInfoModel value, $Res Function(UserInfoModel) then) =
      _$UserInfoModelCopyWithImpl<$Res, UserInfoModel>;
  @useResult
  $Res call(
      {String userId,
      String? displayName,
      String? email,
      String? displayImage,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class _$UserInfoModelCopyWithImpl<$Res, $Val extends UserInfoModel>
    implements $UserInfoModelCopyWith<$Res> {
  _$UserInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? displayName = freezed,
    Object? email = freezed,
    Object? displayImage = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      displayImage: freezed == displayImage
          ? _value.displayImage
          : displayImage // ignore: cast_nullable_to_non_nullable
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
abstract class _$$UserInfoModelImplCopyWith<$Res>
    implements $UserInfoModelCopyWith<$Res> {
  factory _$$UserInfoModelImplCopyWith(
          _$UserInfoModelImpl value, $Res Function(_$UserInfoModelImpl) then) =
      __$$UserInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String? displayName,
      String? email,
      String? displayImage,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class __$$UserInfoModelImplCopyWithImpl<$Res>
    extends _$UserInfoModelCopyWithImpl<$Res, _$UserInfoModelImpl>
    implements _$$UserInfoModelImplCopyWith<$Res> {
  __$$UserInfoModelImplCopyWithImpl(
      _$UserInfoModelImpl _value, $Res Function(_$UserInfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? displayName = freezed,
    Object? email = freezed,
    Object? displayImage = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$UserInfoModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      displayImage: freezed == displayImage
          ? _value.displayImage
          : displayImage // ignore: cast_nullable_to_non_nullable
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
class _$UserInfoModelImpl extends _UserInfoModel {
  const _$UserInfoModelImpl(
      {required this.userId,
      this.displayName,
      this.email,
      this.displayImage,
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt,
      final String? $type})
      : $type = $type ?? 'default',
        super._();

  factory _$UserInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoModelImplFromJson(json);

  @override
  final String userId;
  @override
  final String? displayName;
  @override
  final String? email;
  @override
  final String? displayImage;
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @TimestampConverter()
  final DateTime? updatedAt;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UserInfoModel(userId: $userId, displayName: $displayName, email: $email, displayImage: $displayImage, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayImage, displayImage) ||
                other.displayImage == displayImage) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, displayName, email,
      displayImage, createdAt, updatedAt);

  /// Create a copy of UserInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoModelImplCopyWith<_$UserInfoModelImpl> get copyWith =>
      __$$UserInfoModelImplCopyWithImpl<_$UserInfoModelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String userId,
            String? displayName,
            String? email,
            String? displayImage,
            @TimestampConverter() DateTime? createdAt,
            @TimestampConverter() DateTime? updatedAt)
        $default, {
    required TResult Function(
            String userId,
            String? displayName,
            String? email,
            String? displayImage,
            @TimestampConverter() DateTime? createdAt,
            @TimestampConverter() DateTime? updatedAt)
        unknown,
  }) {
    return $default(
        userId, displayName, email, displayImage, createdAt, updatedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String userId,
            String? displayName,
            String? email,
            String? displayImage,
            @TimestampConverter() DateTime? createdAt,
            @TimestampConverter() DateTime? updatedAt)?
        $default, {
    TResult? Function(
            String userId,
            String? displayName,
            String? email,
            String? displayImage,
            @TimestampConverter() DateTime? createdAt,
            @TimestampConverter() DateTime? updatedAt)?
        unknown,
  }) {
    return $default?.call(
        userId, displayName, email, displayImage, createdAt, updatedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String userId,
            String? displayName,
            String? email,
            String? displayImage,
            @TimestampConverter() DateTime? createdAt,
            @TimestampConverter() DateTime? updatedAt)?
        $default, {
    TResult Function(
            String userId,
            String? displayName,
            String? email,
            String? displayImage,
            @TimestampConverter() DateTime? createdAt,
            @TimestampConverter() DateTime? updatedAt)?
        unknown,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
          userId, displayName, email, displayImage, createdAt, updatedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserInfoModel value) $default, {
    required TResult Function(_UserInfoModelUnknown value) unknown,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserInfoModel value)? $default, {
    TResult? Function(_UserInfoModelUnknown value)? unknown,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserInfoModel value)? $default, {
    TResult Function(_UserInfoModelUnknown value)? unknown,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoModelImplToJson(
      this,
    );
  }
}

abstract class _UserInfoModel extends UserInfoModel {
  const factory _UserInfoModel(
      {required final String userId,
      final String? displayName,
      final String? email,
      final String? displayImage,
      @TimestampConverter() final DateTime? createdAt,
      @TimestampConverter() final DateTime? updatedAt}) = _$UserInfoModelImpl;
  const _UserInfoModel._() : super._();

  factory _UserInfoModel.fromJson(Map<String, dynamic> json) =
      _$UserInfoModelImpl.fromJson;

  @override
  String get userId;
  @override
  String? get displayName;
  @override
  String? get email;
  @override
  String? get displayImage;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @TimestampConverter()
  DateTime? get updatedAt;

  /// Create a copy of UserInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserInfoModelImplCopyWith<_$UserInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserInfoModelUnknownImplCopyWith<$Res>
    implements $UserInfoModelCopyWith<$Res> {
  factory _$$UserInfoModelUnknownImplCopyWith(_$UserInfoModelUnknownImpl value,
          $Res Function(_$UserInfoModelUnknownImpl) then) =
      __$$UserInfoModelUnknownImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String? displayName,
      String? email,
      String? displayImage,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class __$$UserInfoModelUnknownImplCopyWithImpl<$Res>
    extends _$UserInfoModelCopyWithImpl<$Res, _$UserInfoModelUnknownImpl>
    implements _$$UserInfoModelUnknownImplCopyWith<$Res> {
  __$$UserInfoModelUnknownImplCopyWithImpl(_$UserInfoModelUnknownImpl _value,
      $Res Function(_$UserInfoModelUnknownImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? displayName = freezed,
    Object? email = freezed,
    Object? displayImage = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$UserInfoModelUnknownImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      displayImage: freezed == displayImage
          ? _value.displayImage
          : displayImage // ignore: cast_nullable_to_non_nullable
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
class _$UserInfoModelUnknownImpl extends _UserInfoModelUnknown {
  const _$UserInfoModelUnknownImpl(
      {this.userId = '',
      this.displayName = '',
      this.email = '',
      this.displayImage = '',
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt,
      final String? $type})
      : $type = $type ?? 'unknown',
        super._();

  factory _$UserInfoModelUnknownImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoModelUnknownImplFromJson(json);

  @override
  @JsonKey()
  final String userId;
  @override
  @JsonKey()
  final String? displayName;
  @override
  @JsonKey()
  final String? email;
  @override
  @JsonKey()
  final String? displayImage;
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @TimestampConverter()
  final DateTime? updatedAt;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UserInfoModel.unknown(userId: $userId, displayName: $displayName, email: $email, displayImage: $displayImage, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoModelUnknownImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayImage, displayImage) ||
                other.displayImage == displayImage) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, displayName, email,
      displayImage, createdAt, updatedAt);

  /// Create a copy of UserInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoModelUnknownImplCopyWith<_$UserInfoModelUnknownImpl>
      get copyWith =>
          __$$UserInfoModelUnknownImplCopyWithImpl<_$UserInfoModelUnknownImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String userId,
            String? displayName,
            String? email,
            String? displayImage,
            @TimestampConverter() DateTime? createdAt,
            @TimestampConverter() DateTime? updatedAt)
        $default, {
    required TResult Function(
            String userId,
            String? displayName,
            String? email,
            String? displayImage,
            @TimestampConverter() DateTime? createdAt,
            @TimestampConverter() DateTime? updatedAt)
        unknown,
  }) {
    return unknown(
        userId, displayName, email, displayImage, createdAt, updatedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String userId,
            String? displayName,
            String? email,
            String? displayImage,
            @TimestampConverter() DateTime? createdAt,
            @TimestampConverter() DateTime? updatedAt)?
        $default, {
    TResult? Function(
            String userId,
            String? displayName,
            String? email,
            String? displayImage,
            @TimestampConverter() DateTime? createdAt,
            @TimestampConverter() DateTime? updatedAt)?
        unknown,
  }) {
    return unknown?.call(
        userId, displayName, email, displayImage, createdAt, updatedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String userId,
            String? displayName,
            String? email,
            String? displayImage,
            @TimestampConverter() DateTime? createdAt,
            @TimestampConverter() DateTime? updatedAt)?
        $default, {
    TResult Function(
            String userId,
            String? displayName,
            String? email,
            String? displayImage,
            @TimestampConverter() DateTime? createdAt,
            @TimestampConverter() DateTime? updatedAt)?
        unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(
          userId, displayName, email, displayImage, createdAt, updatedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserInfoModel value) $default, {
    required TResult Function(_UserInfoModelUnknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserInfoModel value)? $default, {
    TResult? Function(_UserInfoModelUnknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserInfoModel value)? $default, {
    TResult Function(_UserInfoModelUnknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoModelUnknownImplToJson(
      this,
    );
  }
}

abstract class _UserInfoModelUnknown extends UserInfoModel {
  const factory _UserInfoModelUnknown(
          {final String userId,
          final String? displayName,
          final String? email,
          final String? displayImage,
          @TimestampConverter() final DateTime? createdAt,
          @TimestampConverter() final DateTime? updatedAt}) =
      _$UserInfoModelUnknownImpl;
  const _UserInfoModelUnknown._() : super._();

  factory _UserInfoModelUnknown.fromJson(Map<String, dynamic> json) =
      _$UserInfoModelUnknownImpl.fromJson;

  @override
  String get userId;
  @override
  String? get displayName;
  @override
  String? get email;
  @override
  String? get displayImage;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @TimestampConverter()
  DateTime? get updatedAt;

  /// Create a copy of UserInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserInfoModelUnknownImplCopyWith<_$UserInfoModelUnknownImpl>
      get copyWith => throw _privateConstructorUsedError;
}
