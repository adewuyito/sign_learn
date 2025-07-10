import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/quiz_models.dart';

abstract class QuizRemoteDataSource {
  Future<QuizModel?> getQuizByLesson({
    required String levelId,
    required String unitId,
    required String lessonId,
  });

  Future<List<QuizModel>> getQuizzesByUnit({
    required String levelId,
    required String unitId,
  });

  Future<void> upsertQuiz({
    required String levelId,
    required String unitId,
    required QuizModel quiz,
  });
}

class FirestoreQuizRemoteDataSource implements QuizRemoteDataSource {
  final FirebaseFirestore firestore;
  FirestoreQuizRemoteDataSource({FirebaseFirestore? firestore})
      : firestore = firestore ?? FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> _quizCollection(
    String levelId,
    String unitId,
  ) =>
      firestore
          .collection('lessons')
          .doc(levelId)
          .collection('units')
          .doc(unitId)
          .collection('quizzes');

  @override
  Future<QuizModel?> getQuizByLesson({
    required String levelId,
    required String unitId,
    required String lessonId,
  }) async {
    final query = await _quizCollection(levelId, unitId)
        .where('lessonId', isEqualTo: lessonId)
        .limit(1)
        .get();
    if (query.docs.isEmpty) return null;
    return QuizModel.fromFirestore(query.docs.first);
  }

  @override
  Future<List<QuizModel>> getQuizzesByUnit({
    required String levelId,
    required String unitId,
  }) async {
    final snap = await _quizCollection(levelId, unitId).get();
    return snap.docs.map((d) => QuizModel.fromFirestore(d)).toList();
  }

  @override
  Future<void> upsertQuiz({
    required String levelId,
    required String unitId,
    required QuizModel quiz,
  }) async {
    await _quizCollection(levelId, unitId).doc(quiz.quizId).set(quiz.toJson());
  }
}

final quizRemoteDataSourceProvider = Provider<QuizRemoteDataSource>((ref) {
  return FirestoreQuizRemoteDataSource();
});
