import 'package:flutter_test/flutter_test.dart';
import 'package:sign_learn/features/quiz/models/quiz_question.dart';
import 'package:sign_learn/features/quiz/models/quiz_session.dart';
import 'package:sign_learn/features/quiz/domain/entities/quiz.dart';

void main() {
  group('QuizSession Tests', () {
    late List<QuizQuestion> mockQuestions;

    setUp(() {
      mockQuestions = [
        QuizQuestion(
          id: '1',
          question: 'Question 1?',
          type: QuestionType.text,
          options: ['A', 'B', 'C', 'D'],
          correctOptionIndex: 0,
          explanation: 'Answer is A',
        ),
        QuizQuestion(
          id: '2',
          question: 'Question 2?',
          type: QuestionType.text,
          options: ['W', 'X', 'Y', 'Z'],
          correctOptionIndex: 1,
          explanation: 'Answer is X',
        ),
      ];
    });

    test('QuizSession should initialize with correct defaults', () {
      // Act
      final session = QuizSession(
        id: 'test_session',
        questions: mockQuestions,
      );

      // Assert
      expect(session.id, equals('test_session'));
      expect(session.questions, equals(mockQuestions));
      expect(session.currentQuestionIndex, equals(0));
      expect(session.userAnswers, equals([null, null]));
      expect(session.isCompleted, isFalse);
    });

    test('currentQuestion should return current question', () {
      // Arrange
      final session = QuizSession(
        id: 'test_session',
        questions: mockQuestions,
      );

      // Act & Assert
      expect(session.currentQuestion, equals(mockQuestions[0]));
    });

    test('hasNextQuestion should work correctly', () {
      // Arrange
      final session = QuizSession(
        id: 'test_session',
        questions: mockQuestions,
      );

      // Act & Assert
      expect(session.hasNextQuestion, isTrue);

      final sessionAtEnd = session.copyWith(currentQuestionIndex: 1);
      expect(sessionAtEnd.hasNextQuestion, isFalse);
    });

    test('score should calculate correct answers', () {
      // Arrange
      final session = QuizSession(
        id: 'test_session',
        questions: mockQuestions,
        userAnswers: [0, 1], // Both correct
      );

      // Act & Assert
      expect(session.score, equals(2));
      expect(session.percentage, equals(100.0));
    });

    test('score should calculate partial correct answers', () {
      // Arrange
      final session = QuizSession(
        id: 'test_session',
        questions: mockQuestions,
        userAnswers: [0, 0], // First correct, second wrong
      );

      // Act & Assert
      expect(session.score, equals(1));
      expect(session.percentage, equals(50.0));
    });

    test('copyWith should create updated session', () {
      // Arrange
      final original = QuizSession(
        id: 'test_session',
        questions: mockQuestions,
      );

      // Act
      final updated = original.copyWith(
        currentQuestionIndex: 1,
        userAnswers: [0, null],
      );

      // Assert
      expect(updated.currentQuestionIndex, equals(1));
      expect(updated.userAnswers, equals([0, null]));
      expect(original.currentQuestionIndex, equals(0)); // Original unchanged
    });
  });
}