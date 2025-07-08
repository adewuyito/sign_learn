import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/quiz_session.dart';
import '../models/quiz_question.dart';
import '../controllers/quiz_controller.dart';
import 'quiz_progress.dart';
import 'question_display.dart';
import 'answer_grid.dart';

class QuizScreen extends ConsumerStatefulWidget {
  final String lessonId;

  const QuizScreen({
    super.key,
    required this.lessonId,
  });

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize with sample questions for now
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final sampleQuestions = [
        const QuizQuestion(
          id: '1',
          question: 'What does this sign mean?',
          type: QuestionType.text,
          options: ['Hello', 'Goodbye', 'Thank you', 'Please'],
          correctOptionIndex: 0,
          explanation: 'This sign means "Hello" in sign language.',
        ),
        const QuizQuestion(
          id: '2',
          question: 'Which sign represents "Thank you"?',
          type: QuestionType.text,
          options: ['Option A', 'Option B', 'Option C', 'Option D'],
          correctOptionIndex: 2,
          explanation: 'Option C is the correct sign for "Thank you".',
        ),
      ];
      
      ref.read(quizControllerProvider.notifier).initializeQuiz(sampleQuestions);
    });
  }

  @override
  Widget build(BuildContext context) {
    final quizSession = ref.watch(quizControllerProvider);
    final quizController = ref.read(quizControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const QuizProgressIndicator(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const QuestionDisplay(),
                    const SizedBox(height: 24),
                    const Expanded(child: AnswerGrid()),
                    const SizedBox(height: 16),
                    if (quizSession != null) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: quizSession.canMoveToPrevious
                                ? () => quizController.moveToPrevious()
                                : null,
                            child: const Text('Previous'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (quizSession.canMoveToNext) {
                                quizController.moveToNext();
                              } else {
                                quizController.completeQuiz();
                                _showCompletionDialog();
                              }
                            },
                            child: Text(
                              quizSession.canMoveToNext ? 'Next' : 'Finish',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCompletionDialog() {
    final quizSession = ref.read(quizControllerProvider);
    if (quizSession == null) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Complete!'),
        content: Text(
          'You scored ${quizSession.score} out of ${quizSession.questions.length}',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              Navigator.of(context).pop(); // Close quiz screen
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}