import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/models.dart' show Lesson;

final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);

final lessonRemoteSourceProvider = Provider<ILessonRemoteSource>(
  (ref) {
    final firestore = ref.watch(firestoreProvider);
    return LessonRemoteSources(ref, firestore: firestore);
  },
);

abstract class ILessonRemoteSource {
  Future<List<Lesson>> fetchLessonsByCategory(String categoryLevel);
  Future<void> markLessonCompleted(String lessonId);
  Future<Lesson> getLessonById(String lessonId);
}

class LessonRemoteSources implements ILessonRemoteSource {
  final FirebaseFirestore firestore;
  Ref ref;
  LessonRemoteSources(this.ref, {required this.firestore});

  @override
  Future<List<Lesson>> fetchLessonsByCategory(String categoryLevel) async {
    try {
      final query = await firestore
          .collection('lessons')
          .where('categoryLevel', isEqualTo: categoryLevel)
          .get();

      return query.docs
          .map((doc) => Lesson.fromJson({...doc.data(), 'id': doc.id}))
          .toList();
    } on Exception catch (e) {
      // TODO: Work on this error state
      debugPrint(e.toString());
      throw UnimplementedError(
        "FirebaseLessonRepository<getLessonByCategory>: This Error has not been come accross hence it has not been initialised.",
      );
    }
  }

  @override
  Future<Lesson> getLessonById(String lessonId) async {
    try {
      final docSnapshot =
          await firestore.collection('lessons').doc(lessonId).get();

      if (!docSnapshot.exists) {
        throw Exception('Lesson not found');
      }

      final result = {...docSnapshot.data()!, 'id': docSnapshot.id};

      return Lesson.fromJson(result);
    } catch (e) {
      throw Exception('Failed to get lesson: ${e.toString()}');
    }
  }

  @override
  Future<void> markLessonCompleted(String lessonId) async {
    await firestore.collection('lessons').doc(lessonId).update({
      'isCompleted': true,
    });
  }
}
