import 'package:flutter_test/flutter_test.dart';
import 'package:sign_learn/features/quiz/data/dummy_data.dart';
import 'package:sign_learn/features/quiz/domain/entities/quiz.dart';

void main() {
  group('Quiz Data Tests', () {
    test('DummyQuizData should return list of quizzes', () {
      // Act
      final quizzes = DummyQuizData.getDummyQuizzes();

      // Assert
      expect(quizzes, isNotEmpty);
      expect(quizzes.length, equals(4));
      
      // Verify first quiz
      final firstQuiz = quizzes.first;
      expect(firstQuiz.id, equals('1'));
      expect(firstQuiz.question, equals('What is the sign for "Hello"?'));
      expect(firstQuiz.type, equals(QuestionType.video));
      expect(firstQuiz.options.length, equals(4));
      expect(firstQuiz.correctOptionIndex, equals(0));
    });

    test('Quiz entity should have correct properties', () {
      // Arrange
      final quiz = Quiz(
        id: 'test_id',
        question: 'Test question?',
        type: QuestionType.text,
        mediaPath: null,
        options: ['Option 1', 'Option 2'],
        correctOptionIndex: 0,
        explanation: 'Test explanation',
      );

      // Assert
      expect(quiz.id, equals('test_id'));
      expect(quiz.question, equals('Test question?'));
      expect(quiz.type, equals(QuestionType.text));
      expect(quiz.mediaPath, isNull);
      expect(quiz.options, equals(['Option 1', 'Option 2']));
      expect(quiz.correctOptionIndex, equals(0));
      expect(quiz.explanation, equals('Test explanation'));
    });

    test('All dummy quizzes should have valid data', () {
      // Act
      final quizzes = DummyQuizData.getDummyQuizzes();

      // Assert
      for (final quiz in quizzes) {
        expect(quiz.id, isNotEmpty);
        expect(quiz.question, isNotEmpty);
        expect(quiz.options, isNotEmpty);
        expect(quiz.correctOptionIndex, greaterThanOrEqualTo(0));
        expect(quiz.correctOptionIndex, lessThan(quiz.options.length));
        expect(quiz.explanation, isNotEmpty);
      }
    });
  });
}