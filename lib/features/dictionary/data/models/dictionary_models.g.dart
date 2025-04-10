// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictionary_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DictionaryModelsImpl _$$DictionaryModelsImplFromJson(
        Map<String, dynamic> json) =>
    _$DictionaryModelsImpl(
      id: json['id'] as String,
      term: json['term'] as String,
      videoUrl: json['videoUrl'] as String,
      description: json['description'] as String,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      thumbnailUrl: json['thumbnailUrl'] as String,
    );

Map<String, dynamic> _$$DictionaryModelsImplToJson(
        _$DictionaryModelsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'term': instance.term,
      'videoUrl': instance.videoUrl,
      'description': instance.description,
      'tags': instance.tags,
      'thumbnailUrl': instance.thumbnailUrl,
    };
