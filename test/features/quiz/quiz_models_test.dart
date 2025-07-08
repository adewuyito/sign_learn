import 'package:flutter_test/flutter_test.dart';
import 'package:sign_learn/features/quiz/models/quiz_question.dart';
import 'package:sign_learn/features/quiz/models/quiz_session.dart';

void main() {
  group('QuizQuestion', () {
    test('should create QuizQuestion from JSON', () {
      final json = {
        'id': '1',
        'question': 'What is this sign?',
        'type': 'QuestionType.text',
        'mediaUrl': null,
        'options': ['Hello', 'Goodbye', 'Thank you'],
        'correctOptionIndex': 0,
        'explanation': 'This sign means Hello',
      };

      final question = QuizQuestion.fromJson(json);

      expect(question.id, '1');
      expect(question.question, 'What is this sign?');
      expect(question.type, QuestionType.text);
      expect(question.options.length, 3);
      expect(question.correctOptionIndex, 0);
    });

    test('should check if answer is correct', () {
      const question = QuizQuestion(
        id: '1',
        question: 'Test question',
        type: QuestionType.text,
        options: ['A', 'B', 'C'],
        correctOptionIndex: 1,
        explanation: 'B is correct',
      );

      expect(question.isAnswerCorrect(1), true);
      expect(question.isAnswerCorrect(0), false);
      expect(question.isAnswerCorrect(2), false);
    });
  });

  group('QuizSession', () {
    final questions = [
      const QuizQuestion(
        id: '1',
        question: 'Question 1',
        type: QuestionType.text,
        options: ['A', 'B'],
        correctOptionIndex: 0,
        explanation: 'A is correct',
      ),
      const QuizQuestion(
        id: '2',
        question: 'Question 2',
        type: QuestionType.text,
        options: ['X', 'Y'],
        correctOptionIndex: 1,
        explanation: 'Y is correct',
      ),
    ];

    test('should initialize with correct defaults', () {
      final session = QuizSession(
        id: 'test',
        questions: questions,
      );

      expect(session.currentQuestionIndex, 0);
      expect(session.answers.length, 2);
      expect(session.answers, [-1, -1]);
      expect(session.isCompleted, false);
      expect(session.progress, 0.5); // (0 + 1) / 2
    });

    test('should calculate score correctly', () {
      final session = QuizSession(
        id: 'test',
        questions: questions,
        answers: [0, 1], // Both correct
      );

      expect(session.score, 2);
    });

    test('should handle navigation correctly', () {
      final session = QuizSession(
        id: 'test',
        questions: questions,
      );

      expect(session.canMoveToNext, true);
      expect(session.canMoveToPrevious, false);

      final nextSession = session.copyWith(currentQuestionIndex: 1);
      expect(nextSession.canMoveToNext, false);
      expect(nextSession.canMoveToPrevious, true);
    });
  });
}