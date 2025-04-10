import 'package:hooks_riverpod/hooks_riverpod.dart';

final lessonLocalSourceProvider = Provider<ILessonLocalSource>((ref) {
  return LessonLocalSource(ref);
});

abstract class ILessonLocalSource{
}

class LessonLocalSource implements ILessonLocalSource {
  Ref ref;
  LessonLocalSource(this.ref);
}