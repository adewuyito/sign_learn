// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dictionary_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DictionaryEntries _$DictionaryEntriesFromJson(Map<String, dynamic> json) {
  return _DictionaryModels.fromJson(json);
}

/// @nodoc
mixin _$DictionaryEntries {
  String get id => throw _privateConstructorUsedError;
  String get term => throw _privateConstructorUsedError;
  String get videoUrl => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String get thumbnailUrl => throw _privateConstructorUsedError;

  /// Serializes this DictionaryEntries to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DictionaryEntries
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DictionaryEntriesCopyWith<DictionaryEntries> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DictionaryEntriesCopyWith<$Res> {
  factory $DictionaryEntriesCopyWith(
          DictionaryEntries value, $Res Function(DictionaryEntries) then) =
      _$DictionaryEntriesCopyWithImpl<$Res, DictionaryEntries>;
  @useResult
  $Res call(
      {String id,
      String term,
      String videoUrl,
      String description,
      List<String> tags,
      String thumbnailUrl});
}

/// @nodoc
class _$DictionaryEntriesCopyWithImpl<$Res, $Val extends DictionaryEntries>
    implements $DictionaryEntriesCopyWith<$Res> {
  _$DictionaryEntriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DictionaryEntries
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? term = null,
    Object? videoUrl = null,
    Object? description = null,
    Object? tags = null,
    Object? thumbnailUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      term: null == term
          ? _value.term
          : term // ignore: cast_nullable_to_non_nullable
              as String,
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DictionaryModelsImplCopyWith<$Res>
    implements $DictionaryEntriesCopyWith<$Res> {
  factory _$$DictionaryModelsImplCopyWith(_$DictionaryModelsImpl value,
          $Res Function(_$DictionaryModelsImpl) then) =
      __$$DictionaryModelsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String term,
      String videoUrl,
      String description,
      List<String> tags,
      String thumbnailUrl});
}

/// @nodoc
class __$$DictionaryModelsImplCopyWithImpl<$Res>
    extends _$DictionaryEntriesCopyWithImpl<$Res, _$DictionaryModelsImpl>
    implements _$$DictionaryModelsImplCopyWith<$Res> {
  __$$DictionaryModelsImplCopyWithImpl(_$DictionaryModelsImpl _value,
      $Res Function(_$DictionaryModelsImpl) _then)
      : super(_value, _then);

  /// Create a copy of DictionaryEntries
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? term = null,
    Object? videoUrl = null,
    Object? description = null,
    Object? tags = null,
    Object? thumbnailUrl = null,
  }) {
    return _then(_$DictionaryModelsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      term: null == term
          ? _value.term
          : term // ignore: cast_nullable_to_non_nullable
              as String,
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DictionaryModelsImpl implements _DictionaryModels {
  const _$DictionaryModelsImpl(
      {required this.id,
      required this.term,
      required this.videoUrl,
      required this.description,
      final List<String> tags = const [],
      required this.thumbnailUrl})
      : _tags = tags;

  factory _$DictionaryModelsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DictionaryModelsImplFromJson(json);

  @override
  final String id;
  @override
  final String term;
  @override
  final String videoUrl;
  @override
  final String description;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String thumbnailUrl;

  @override
  String toString() {
    return 'DictionaryEntries(id: $id, term: $term, videoUrl: $videoUrl, description: $description, tags: $tags, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DictionaryModelsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.term, term) || other.term == term) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, term, videoUrl, description,
      const DeepCollectionEquality().hash(_tags), thumbnailUrl);

  /// Create a copy of DictionaryEntries
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DictionaryModelsImplCopyWith<_$DictionaryModelsImpl> get copyWith =>
      __$$DictionaryModelsImplCopyWithImpl<_$DictionaryModelsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DictionaryModelsImplToJson(
      this,
    );
  }
}

abstract class _DictionaryModels implements DictionaryEntries {
  const factory _DictionaryModels(
      {required final String id,
      required final String term,
      required final String videoUrl,
      required final String description,
      final List<String> tags,
      required final String thumbnailUrl}) = _$DictionaryModelsImpl;

  factory _DictionaryModels.fromJson(Map<String, dynamic> json) =
      _$DictionaryModelsImpl.fromJson;

  @override
  String get id;
  @override
  String get term;
  @override
  String get videoUrl;
  @override
  String get description;
  @override
  List<String> get tags;
  @override
  String get thumbnailUrl;

  /// Create a copy of DictionaryEntries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DictionaryModelsImplCopyWith<_$DictionaryModelsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
