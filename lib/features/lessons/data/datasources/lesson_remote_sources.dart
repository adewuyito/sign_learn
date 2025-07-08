import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/lesson_model.dart';

final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);
final storageProvider = Provider((ref) => FirebaseStorage.instance);

final lessonRemoteSourceProvider = Provider<ILessonRemoteSource>(
  (ref) {
    final _firestore = ref.watch(firestoreProvider);
    final _storage = ref.watch(storageProvider);
    return FirebaseLessonRemoteSource(
      firestore: _firestore,
      storage: _storage,
    );
  },
);

abstract class ILessonRemoteSource {
  /// Get every lesson in a unit  (e.g. ASL1 → Unit1 → all lessons)

  Future<List<LessonModel>> getLessonsByLevel(String levelId);

  Future<List<String>> fetchVideoUrl(LessonModel lesson);

  Future<List<LessonModel>> getLessons({
    required String levelId,
    required String unitId,
  });

  /// Get a single lesson document
  Future<LessonModel> getLesson({
    required String levelId,
    required String unitId,
    required String lessonId,
  });

  /// Create or overwrite a lesson
  Future<void> upsertLesson({
    required String levelId,
    required String unitId,
    required LessonModel lesson,
  });

  /// Delete a lesson
  Future<void> deleteLesson({
    required String levelId,
    required String unitId,
    required String lessonId,
  });
}

class FirebaseLessonRemoteSource implements ILessonRemoteSource {
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;
  FirebaseLessonRemoteSource({required this.firestore, required this.storage});

  final _storage = FirebaseStorage.instance;

  /// Reusable helper to point to …/lessons/…
  CollectionReference<Map<String, dynamic>> _lessonCollection(
    String levelId,
    String unitId,
  ) =>
      firestore
          .collection('lessons')
          .doc(levelId)
          .collection('units')
          .doc(unitId)
          .collection('lessons');

  @override
  Future<List<LessonModel>> getLessonsByLevel(String levelId) async {
    // Pull every lesson document in all units under this level
    final querySnap = await firestore
        .collectionGroup('lessons')
        .where('parentLesson', isEqualTo: levelId)
        .orderBy('unitOrder') // unit1, unit2, …
        .orderBy('order') // lesson order inside the unit
        .get();

    return querySnap.docs
        .map((d) => LessonModel.fromJson({...d.data(), 'lessonId': d.id}))
        .toList();
  }

  @override
  Future<List<LessonModel>> getLessons({
    required String levelId,
    required String unitId,
  }) async {
    final snap = await _lessonCollection(levelId, unitId).get();
    return snap.docs
        .map((d) => LessonModel.fromJson({'lessonId': d.id, ...d.data()}))
        .toList();
  }

  @override
  Future<LessonModel> getLesson({
    required String levelId,
    required String unitId,
    required String lessonId,
  }) async {
    final doc = await _lessonCollection(levelId, unitId).doc(lessonId).get();
    if (!doc.exists) throw Exception('Lesson not found');
    return LessonModel.fromJson({'lessonId': doc.id, ...doc.data()!});
  }

  @override
  Future<void> upsertLesson({
    required String levelId,
    required String unitId,
    required LessonModel lesson,
  }) {
    return _lessonCollection(levelId, unitId)
        .doc(lesson.lessonId)
        .set(lesson.toJson());
  }

  @override
  Future<void> deleteLesson({
    required String levelId,
    required String unitId,
    required String lessonId,
  }) {
    return _lessonCollection(levelId, unitId).doc(lessonId).delete();
  }

  @override
  Future<List<String>> fetchVideoUrl(LessonModel lesson) async {
    return Future.wait(
      lesson.videoUrls.map((path) => _storage.ref(path).getDownloadURL()),
    );
  }
}
