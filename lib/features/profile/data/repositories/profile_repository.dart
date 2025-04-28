import 'package:riverpod/riverpod.dart';

import '../datasources/profile_local_data_sources.dart';
import '../datasources/profile_remote_data_sources.dart';


final profileRepositoryProvider = Provider<IProfileRepository>((ref) {
  return LessonRepository(
    ref,
  );
});

abstract class IProfileRepository {

}


class LessonRepository implements IProfileRepository {
  Ref ref;

  LessonRepository(this.ref)
      : lessonLocalSource = ref.watch(profileLocalSourceProvider),
        lessonRemoteSource = ref.watch(profileRemoteSourceProvider);

  IProfileRemoteSource lessonRemoteSource;
  IProfileLocalSource lessonLocalSource;


}
