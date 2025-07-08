import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../models/quiz_dto.dart';

abstract class QuizRemoteDataSource {
  Future<List<QuizDTO>> getQuizzesByLesson(String lessonId);
  Future<String> getMediaUrl(String mediaPath);
}

class QuizRemoteDataSourceImpl implements QuizRemoteDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  QuizRemoteDataSourceImpl({
    FirebaseFirestore? firestore,
    FirebaseStorage? storage,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _storage = storage ?? FirebaseStorage.instance;

  @override
  Future<List<QuizDTO>> getQuizzesByLesson(String lessonId) async {
    try {
      final snapshot = await _firestore
          .collection('lessons')
          .doc(lessonId)
          .collection('quizzes')
          .get();

      return snapshot.docs
          .map((doc) => QuizDTO.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch quizzes: $e');
    }
  }

  @override
  Future<String> getMediaUrl(String mediaPath) async {
    try {
      return await _storage.ref(mediaPath).getDownloadURL();
    } catch (e) {
      throw Exception('Failed to get media URL: $e');
    }
  }
}