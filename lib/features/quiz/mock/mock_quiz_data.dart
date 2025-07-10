import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/common/enums.dart';
import 'package:sign_learn/features/quiz/domain/usecases/quiz_usecase_providers.dart';
import '../data/models/quiz_models.dart';

final List<QuizModel> mockQuizzes = [
  QuizModel(
    quizId: 'mock_quiz_1',
    lessonId: 'lesson_1',
    title: 'Greetings Quiz',
    description: 'Test your knowledge of greetings in sign language.',
    order: 1,
    questions: [
      QuizQuestionModel(
        questionId: 'q1',
        mediaType: MediaType.image,
        mediaUrl: 'https://example.com/image1.png',
        questionText: 'What does this sign mean?',
        options: [
          QuizOptionModel(optionId: 'a1', text: 'Hello'),
          QuizOptionModel(optionId: 'a2', text: 'Thank you'),
          QuizOptionModel(optionId: 'a3', text: 'Please'),
          QuizOptionModel(optionId: 'a4', text: 'Sorry'),
        ],
        correctOptionIndex: 0,
      ),
      QuizQuestionModel(
        questionId: 'q2',
        mediaType: MediaType.video,
        mediaUrl: 'https://example.com/video1.mp4',
        questionText: 'Which sign represents "Family"?',
        options: [
          QuizOptionModel(optionId: 'a5', text: 'Option A'),
          QuizOptionModel(optionId: 'a6', text: 'Option B'),
          QuizOptionModel(optionId: 'a7', text: 'Option C'),
          QuizOptionModel(optionId: 'a8', text: 'Option D'),
        ],
        correctOptionIndex: 1,
      ),
    ],
  ),
  // Add more mock quizzes as needed
];

Future<void> uploadMockQuizzes({
  required String levelId,
  required String unitId,
  required WidgetRef ref,
}) async {
  // final db = firestore ?? FirebaseFirestore.instance;
  // final quizCollection = db
  //     .collection('lessons')
  //     .doc(levelId)
  //     .collection('units')
  //     .doc(unitId)
  //     .collection('quizzes');

  for (final quiz in mockQuizzes) {
    await ref.watch(upsertQuizUseCaseProvider).call(
          levelId: levelId,
          unitId: unitId,
          quiz: quiz,
        );
    // await quizCollection.doc(quiz.quizId).set(quiz.toJson());
  }
}
