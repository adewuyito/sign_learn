import 'package:freezed_annotation/freezed_annotation.dart';

part 'dictionary_models.freezed.dart';
part 'dictionary_models.g.dart';

@freezed
class DictionaryEntries with _$DictionaryEntries {
  const factory DictionaryEntries({
    required String id,
    required String term,
    required String videoUrl,
    required String description,
    @Default([]) List<String> tags,
    required String thumbnailUrl,
  }) = _DictionaryModels;

  factory DictionaryEntries.fromJson(Map<String, dynamic> json) =>
      _$DictionaryEntriesFromJson(json);
}
