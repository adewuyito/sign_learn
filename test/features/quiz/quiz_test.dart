import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:sign_learn/features/quiz/data/data.dart';
import 'package:sign_learn/features/quiz/presentation/providers/quiz_controller.dart';

// Mock classes
class MockQuizRepository extends Mock implements QuizRepository {}

void main() {
  group('Quiz System Tests', () {
    late MockQuizRepository mockRepository;
    late ProviderContainer container;

    setUp(() {
      mockRepository = MockQuizRepository();
      container = ProviderContainer(
        overrides: [
          quizRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    group('QuizController', () {
      test('should initialize with empty state', () {
        final controller = container.read(quizControllerProvider);
        
        expect(controller.session, isNull);
        expect(controller.isLoading, isFalse);
        expect(controller.error, isNull);
        expect(controller.feedbackState, QuizFeedbackState.none);
      });

      test('should create quiz session with questions', () async {
        final questions = [
          QuizQuestion(
            questionId: 'test_1',
            questionText: 'Test question',
            type: QuestionType.text,
            options: [
              const QuizOption(optionId: '1', text: 'Option 1'),
              const QuizOption(optionId: '2', text: 'Option 2'),
            ],
            correctAnswerIndex: 0,
            points: 10,
          ),
        ];

        when(mockRepository.getQuizQuestions('test_lesson'))
            .thenAnswer((_) async => questions);

        final controller = container.read(quizControllerProvider.notifier);
        await controller.initializeQuizFromLesson(
          userId: 'test_user',
          lessonId: 'test_lesson',
        );

        final state = container.read(quizControllerProvider);
        expect(state.session, isNotNull);
        expect(state.session!.questions, hasLength(1));
        expect(state.session!.totalQuestions, 1);
        expect(state.session!.maxPossibleScore, 10);
      });

      test('should start quiz and update status', () async {
        final questions = [
          QuizQuestion(
            questionId: 'test_1',
            questionText: 'Test question',
            type: QuestionType.text,
            options: [
              const QuizOption(optionId: '1', text: 'Option 1'),
              const QuizOption(optionId: '2', text: 'Option 2'),
            ],
            correctAnswerIndex: 0,
            points: 10,
          ),
        ];

        when(mockRepository.getQuizQuestions('test_lesson'))
            .thenAnswer((_) async => questions);

        final controller = container.read(quizControllerProvider.notifier);
        await controller.initializeQuizFromLesson(
          userId: 'test_user',
          lessonId: 'test_lesson',
        );

        controller.startQuiz();

        final state = container.read(quizControllerProvider);
        expect(state.session!.status, QuizSessionStatus.inProgress);
        expect(state.session!.startedAt, isNotNull);
      });

      test('should submit correct answer and show feedback', () async {
        final questions = [
          QuizQuestion(
            questionId: 'test_1',
            questionText: 'Test question',
            type: QuestionType.text,
            options: [
              const QuizOption(optionId: '1', text: 'Option 1'),
              const QuizOption(optionId: '2', text: 'Option 2'),
            ],
            correctAnswerIndex: 0,
            points: 10,
          ),
        ];

        when(mockRepository.getQuizQuestions('test_lesson'))
            .thenAnswer((_) async => questions);
        when(mockRepository.submitQuizResponse(any))
            .thenAnswer((_) async {});

        final controller = container.read(quizControllerProvider.notifier);
        await controller.initializeQuizFromLesson(
          userId: 'test_user',
          lessonId: 'test_lesson',
        );

        controller.startQuiz();
        await controller.submitAnswer(0); // Correct answer

        final state = container.read(quizControllerProvider);
        expect(state.feedbackState, QuizFeedbackState.correct);
        expect(state.session!.totalScore, 10);
        expect(state.session!.correctAnswers, 1);
      });

      test('should submit incorrect answer and show feedback', () async {
        final questions = [
          QuizQuestion(
            questionId: 'test_1',
            questionText: 'Test question',
            type: QuestionType.text,
            options: [
              const QuizOption(optionId: '1', text: 'Option 1'),
              const QuizOption(optionId: '2', text: 'Option 2'),
            ],
            correctAnswerIndex: 0,
            points: 10,
          ),
        ];

        when(mockRepository.getQuizQuestions('test_lesson'))
            .thenAnswer((_) async => questions);
        when(mockRepository.submitQuizResponse(any))
            .thenAnswer((_) async {});

        final controller = container.read(quizControllerProvider.notifier);
        await controller.initializeQuizFromLesson(
          userId: 'test_user',
          lessonId: 'test_lesson',
        );

        controller.startQuiz();
        await controller.submitAnswer(1); // Incorrect answer

        final state = container.read(quizControllerProvider);
        expect(state.feedbackState, QuizFeedbackState.incorrect);
        expect(state.session!.totalScore, 0);
        expect(state.session!.correctAnswers, 0);
      });
    });

    group('Quiz Models', () {
      test('should create QuizQuestion with correct properties', () {
        final question = QuizQuestion(
          questionId: 'test_1',
          questionText: 'Test question',
          type: QuestionType.text,
          options: [
            const QuizOption(optionId: '1', text: 'Option 1'),
            const QuizOption(optionId: '2', text: 'Option 2'),
          ],
          correctAnswerIndex: 0,
          points: 10,
        );

        expect(question.questionId, 'test_1');
        expect(question.questionText, 'Test question');
        expect(question.type, QuestionType.text);
        expect(question.options, hasLength(2));
        expect(question.correctAnswerIndex, 0);
        expect(question.points, 10);
      });

      test('should create QuizSession with correct properties', () {
        final questions = [
          QuizQuestion(
            questionId: 'test_1',
            questionText: 'Test question',
            type: QuestionType.text,
            options: [
              const QuizOption(optionId: '1', text: 'Option 1'),
            ],
            correctAnswerIndex: 0,
            points: 10,
          ),
        ];

        final session = QuizSession(
          sessionId: 'session_1',
          userId: 'user_1',
          questions: questions,
          totalQuestions: 1,
          maxPossibleScore: 10,
        );

        expect(session.sessionId, 'session_1');
        expect(session.userId, 'user_1');
        expect(session.questions, hasLength(1));
        expect(session.totalQuestions, 1);
        expect(session.maxPossibleScore, 10);
        expect(session.status, QuizSessionStatus.notStarted);
      });

      test('should calculate quiz session properties correctly', () {
        final questions = [
          QuizQuestion(
            questionId: 'test_1',
            questionText: 'Test question',
            type: QuestionType.text,
            options: [
              const QuizOption(optionId: '1', text: 'Option 1'),
            ],
            correctAnswerIndex: 0,
            points: 10,
          ),
        ];

        final session = QuizSession(
          sessionId: 'session_1',
          userId: 'user_1',
          questions: questions,
          totalQuestions: 1,
          maxPossibleScore: 10,
          currentQuestionIndex: 0,
          correctAnswers: 1,
        );

        expect(session.currentQuestion, isNotNull);
        expect(session.isFirstQuestion, isTrue);
        expect(session.isLastQuestion, isTrue);
        expect(session.progressPercentage, 0.0);
        expect(session.accuracyPercentage, 1.0);
      });
    });
  });
}