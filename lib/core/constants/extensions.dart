import 'package:sign_learn/features/lessons/data/models/category_levels.dart';

extension StringExtensions on String {
  String get capitalize {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String get splitAndJoinEachUpperCase {
    return split(
      RegExp('(?=[A-Z])'),
    ).map((e) => e.capitalize).join(' ');
  }
}

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E element, int index) f) {
    var index = 0;
    return map((e) => f(e, index++));
  }
}

extension LevelId on CategoryLevel {
  String get levelId => 'asl_lesson${index + 1}';
}