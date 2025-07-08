import 'package:flutter_test/flutter_test.dart';
import '../../lib/features/quiz/domain/entities/quiz_question.dart';
import '../../lib/features/quiz/domain/entities/quiz_session.dart';

void main() {
  group('Quiz Domain Models Tests', () {
    test('QuizAnswer should create and serialize correctly', () {
      const answer = QuizAnswer(
        id: 'a1',
        text: 'Hello',
        imageUrl: 'https://example.com/image.jpg',
      );

      expect(answer.id, 'a1');
      expect(answer.text, 'Hello');
      expect(answer.imageUrl, 'https://example.com/image.jpg');

      final json = answer.toJson();
      final recreated = QuizAnswer.fromJson(json);

      expect(recreated.id, answer.id);
      expect(recreated.text, answer.text);
      expect(recreated.imageUrl, answer.imageUrl);
    });

    test('QuizQuestion should create and serialize correctly', () {
      const question = QuizQuestion(
        id: 'q1',
        questionText: 'What does this sign mean?',
        type: QuestionType.text,
        answers: [
          QuizAnswer(id: 'a1', text: 'Hello'),
          QuizAnswer(id: 'a2', text: 'Goodbye'),
        ],
        correctAnswerId: 'a1',
      );

      expect(question.id, 'q1');
      expect(question.questionText, 'What does this sign mean?');
      expect(question.type, QuestionType.text);
      expect(question.answers.length, 2);
      expect(question.correctAnswerId, 'a1');

      final json = question.toJson();
      final recreated = QuizQuestion.fromJson(json);

      expect(recreated.id, question.id);
      expect(recreated.questionText, question.questionText);
      expect(recreated.type, question.type);
      expect(recreated.answers.length, question.answers.length);
      expect(recreated.correctAnswerId, question.correctAnswerId);
    });

    test('QuizSession should create and serialize correctly', () {
      const session = QuizSession(
        id: 'session1',
        title: 'Test Quiz',
        questions: [
          QuizQuestion(
            id: 'q1',
            questionText: 'Test question',
            type: QuestionType.text,
            answers: [
              QuizAnswer(id: 'a1', text: 'Answer 1'),
              QuizAnswer(id: 'a2', text: 'Answer 2'),
            ],
            correctAnswerId: 'a1',
          ),
        ],
        levelId: 'level1',
        unitId: 'unit1',
        lessonId: 'lesson1',
      );

      expect(session.id, 'session1');
      expect(session.title, 'Test Quiz');
      expect(session.questions.length, 1);
      expect(session.levelId, 'level1');
      expect(session.unitId, 'unit1');
      expect(session.lessonId, 'lesson1');

      final json = session.toJson();
      final recreated = QuizSession.fromJson(json);

      expect(recreated.id, session.id);
      expect(recreated.title, session.title);
      expect(recreated.questions.length, session.questions.length);
      expect(recreated.levelId, session.levelId);
      expect(recreated.unitId, session.unitId);
      expect(recreated.lessonId, session.lessonId);
    });

    test('QuizState should handle copyWith correctly', () {
      const initialState = QuizState();
      
      expect(initialState.currentQuestionIndex, 0);
      expect(initialState.status, QuizStatus.idle);
      expect(initialState.showFeedback, false);

      final updatedState = initialState.copyWith(
        currentQuestionIndex: 1,
        status: QuizStatus.inProgress,
        showFeedback: true,
      );

      expect(updatedState.currentQuestionIndex, 1);
      expect(updatedState.status, QuizStatus.inProgress);
      expect(updatedState.showFeedback, true);
    });

    test('QuestionResult should track attempts correctly', () {
      const result = QuestionResult(
        questionId: 'q1',
        selectedAnswerId: 'a2',
        correctAnswerId: 'a1',
        isCorrect: false,
        attempts: 1,
        timeSpent: Duration(seconds: 15),
      );

      expect(result.questionId, 'q1');
      expect(result.selectedAnswerId, 'a2');
      expect(result.correctAnswerId, 'a1');
      expect(result.isCorrect, false);
      expect(result.attempts, 1);
      expect(result.timeSpent, const Duration(seconds: 15));

      final json = result.toJson();
      final recreated = QuestionResult.fromJson(json);

      expect(recreated.questionId, result.questionId);
      expect(recreated.isCorrect, result.isCorrect);
      expect(recreated.attempts, result.attempts);
    });
  });
}