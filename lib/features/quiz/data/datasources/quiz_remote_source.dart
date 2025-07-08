import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/entities/quiz_session.dart';
import '../../domain/entities/quiz_question.dart';

final quizRemoteSourceProvider = Provider<IQuizRemoteSource>(
  (ref) {
    final firestore = FirebaseFirestore.instance;
    return FirebaseQuizRemoteSource(firestore: firestore);
  },
);

abstract class IQuizRemoteSource {
  Future<QuizSession> getQuizSession({
    required String levelId,
    required String unitId,
    String? lessonId,
  });

  Future<List<QuizQuestion>> getQuizQuestions({
    required String levelId,
    required String unitId,
    String? lessonId,
  });

  Future<void> saveQuizResult({
    required String userId,
    required String sessionId,
    required Map<String, dynamic> result,
  });
}

class FirebaseQuizRemoteSource implements IQuizRemoteSource {
  final FirebaseFirestore firestore;

  FirebaseQuizRemoteSource({required this.firestore});

  CollectionReference _quizCollection(String levelId, String unitId) {
    return firestore.collection('levels').doc(levelId).collection('units').doc(unitId).collection('quizzes');
  }

  CollectionReference _userResultsCollection(String userId) {
    return firestore.collection('users').doc(userId).collection('quiz_results');
  }

  @override
  Future<QuizSession> getQuizSession({
    required String levelId,
    required String unitId,
    String? lessonId,
  }) async {
    // For now, create a mock quiz session with sample questions
    final questions = await _generateMockQuestions();
    
    return QuizSession(
      id: 'quiz_${levelId}_${unitId}_${lessonId ?? 'general'}',
      title: 'Sign Language Quiz',
      questions: questions,
      levelId: levelId,
      unitId: unitId,
      lessonId: lessonId,
    );
  }

  @override
  Future<List<QuizQuestion>> getQuizQuestions({
    required String levelId,
    required String unitId,
    String? lessonId,
  }) async {
    return await _generateMockQuestions();
  }

  @override
  Future<void> saveQuizResult({
    required String userId,
    required String sessionId,
    required Map<String, dynamic> result,
  }) async {
    await _userResultsCollection(userId).add({
      'sessionId': sessionId,
      'result': result,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<List<QuizQuestion>> _generateMockQuestions() async {
    // Generate 5-7 mock questions for the quiz
    return [
      QuizQuestion(
        id: 'q1',
        questionText: 'What does this sign mean?',
        type: QuestionType.text,
        answers: [
          QuizAnswer(id: 'a1', text: 'Hello'),
          QuizAnswer(id: 'a2', text: 'Thank you'),
          QuizAnswer(id: 'a3', text: 'Please'),
          QuizAnswer(id: 'a4', text: 'Sorry'),
        ],
        correctAnswerId: 'a1',
      ),
      QuizQuestion(
        id: 'q2',
        questionText: 'Which sign represents "Family"?',
        type: QuestionType.text,
        answers: [
          QuizAnswer(id: 'a5', text: 'Option A'),
          QuizAnswer(id: 'a6', text: 'Option B'),
          QuizAnswer(id: 'a7', text: 'Option C'),
          QuizAnswer(id: 'a8', text: 'Option D'),
        ],
        correctAnswerId: 'a6',
      ),
      QuizQuestion(
        id: 'q3',
        questionText: 'What is the correct sign for "Water"?',
        type: QuestionType.text,
        answers: [
          QuizAnswer(id: 'a9', text: 'Sign 1'),
          QuizAnswer(id: 'a10', text: 'Sign 2'),
          QuizAnswer(id: 'a11', text: 'Sign 3'),
          QuizAnswer(id: 'a12', text: 'Sign 4'),
        ],
        correctAnswerId: 'a11',
      ),
      QuizQuestion(
        id: 'q4',
        questionText: 'How do you sign "Good Morning"?',
        type: QuestionType.text,
        answers: [
          QuizAnswer(id: 'a13', text: 'Morning A'),
          QuizAnswer(id: 'a14', text: 'Morning B'),
          QuizAnswer(id: 'a15', text: 'Morning C'),
          QuizAnswer(id: 'a16', text: 'Morning D'),
        ],
        correctAnswerId: 'a14',
      ),
      QuizQuestion(
        id: 'q5',
        questionText: 'Which sign means "Yes"?',
        type: QuestionType.text,
        answers: [
          QuizAnswer(id: 'a17', text: 'Yes A'),
          QuizAnswer(id: 'a18', text: 'Yes B'),
          QuizAnswer(id: 'a19', text: 'Yes C'),
          QuizAnswer(id: 'a20', text: 'Yes D'),
        ],
        correctAnswerId: 'a17',
      ),
    ];
  }
}