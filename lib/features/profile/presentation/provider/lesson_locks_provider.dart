import 'package:riverpod/riverpod.dart';
import '../../data/datasources/profile_remote_data_sources.dart';
import '../../../auth/domain/providers/auth_state_provider.dart';

final lessonLocksProvider = NotifierProvider<LessonLocksNotifier, List<String>>(
  LessonLocksNotifier.new,
);

class LessonLocksNotifier extends Notifier<List<String>> {
  @override
  List<String> build() {
    return ['open', 'lock', 'lock', 'lock'];
  }

  Future<void> initializeLocks() async {
    try {
      final userId = ref.read(firebaseAuthProvider).currentUser?.uid;
      if (userId == null) return;

      final locks =
          await ref.read(profileRemoteSourceProvider).getLessonLocks(userId);
      state = locks;
    } catch (e) {
      // Handle error, maybe set a default state
      state = ['open', 'lock', 'lock', 'lock'];
    }
  }

  Future<void> unlockLesson(int lessonIndex) async {
    try {
      final userId = ref.read(firebaseAuthProvider).currentUser?.uid;
      if (userId == null) return;

      final newLocks = List<String>.from(state);
      if (lessonIndex < newLocks.length) {
        newLocks[lessonIndex] = 'open';
        await ref
            .read(profileRemoteSourceProvider)
            .updateLessonLocks(userId, newLocks);
        state = newLocks;
      }
    } catch (e) {
      // Handle error
    }
  }

  Future<void> resetLocks() async {
    try {
      final userId = ref.read(firebaseAuthProvider).currentUser?.uid;
      if (userId == null) return;

      final defaultLocks = ['open', 'lock', 'lock', 'lock'];
      await ref
          .read(profileRemoteSourceProvider)
          .updateLessonLocks(userId, defaultLocks);
      state = defaultLocks;
    } catch (e) {
      // Handle error
    }
  }
}
