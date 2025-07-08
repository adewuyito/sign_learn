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
      try {
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
          const QuizQuestion(
            id: '3',
            question: 'What is the sign for "Goodbye"?',
            type: QuestionType.image,
            mediaUrl: 'https://example.com/goodbye.jpg',
            options: ['Sign A', 'Sign B', 'Sign C', 'Sign D'],
            correctOptionIndex: 1,
            explanation: 'Sign B represents "Goodbye".',
          ),
        ];
        
        ref.read(quizControllerProvider.notifier).initializeQuiz(sampleQuestions);
      } catch (e) {
        // Handle initialization error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error initializing quiz: $e')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final quizSession = ref.watch(quizControllerProvider);
    final quizController = ref.read(quizControllerProvider.notifier);

    if (quizSession == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Quiz'),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz (${quizSession.currentQuestionIndex + 1}/${quizSession.questions.length})'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            quizController.clearQuiz();
            Navigator.of(context).pop();
          },
        ),
        actions: [
          if (!quizSession.isCompleted)
            TextButton(
              onPressed: () => quizController.resetQuiz(),
              child: const Text('Reset'),
            ),
        ],
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
                    if (quizSession.isCompleted)
                      const Center(
                        child: Text(
                          'Quiz completed! Check your results above.',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )
                    else ...[
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

    final score = quizSession.score;
    final total = quizSession.questions.length;
    final percentage = (score / total * 100).round();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Complete!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Final Score: $score out of $total ($percentage%)'),
            const SizedBox(height: 16),
            Text(
              _getScoreMessage(percentage),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text('Review your answers:'),
            const SizedBox(height: 8),
            ...quizSession.questions.asMap().entries.map((entry) {
              final index = entry.key;
              final question = entry.value;
              final userAnswer = quizSession.answers[index];
              final isCorrect = userAnswer != -1 && question.isAnswerCorrect(userAnswer);
              
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Icon(
                      isCorrect ? Icons.check_circle : Icons.cancel,
                      color: isCorrect ? Colors.green : Colors.red,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Q${index + 1}: ${userAnswer == -1 ? "Not answered" : question.options[userAnswer]}',
                        style: TextStyle(
                          color: isCorrect ? Colors.green : Colors.red,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              ref.read(quizControllerProvider.notifier).resetQuiz();
              Navigator.of(context).pop(); // Close dialog
            },
            child: const Text('Retry'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              Navigator.of(context).pop(); // Close quiz screen
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  String _getScoreMessage(int percentage) {
    if (percentage >= 90) {
      return 'Excellent! 🎉';
    } else if (percentage >= 70) {
      return 'Good job! 👍';
    } else if (percentage >= 50) {
      return 'Not bad! Keep practicing 📚';
    } else {
      return 'You can do better! Try again 💪';
    }
  }
}