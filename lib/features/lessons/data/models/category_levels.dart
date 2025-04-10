// ignore_for_file: constant_identifier_names

enum CategoryLevel {
  ASL1,
  ASL2,
  ASL3,
  ASL4,
}

const _categoryLevelEnumMap = {
  'ASL1': CategoryLevel.ASL1,
  'ASL2': CategoryLevel.ASL2,
  'ASL3': CategoryLevel.ASL3,
  'ASL4': CategoryLevel.ASL4,
};

CategoryLevel categoryLevelFromJson(String value) => _categoryLevelEnumMap[value]!;

String categoryLevelToJson(CategoryLevel level) => _categoryLevelEnumMap.entries.firstWhere((e) => e.value == level).key;