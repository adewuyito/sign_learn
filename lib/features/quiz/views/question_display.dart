import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/quiz_question.dart';
import '../controllers/quiz_controller.dart';

class QuestionDisplay extends ConsumerWidget {
  const QuestionDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizSession = ref.watch(quizControllerProvider);
    
    if (quizSession == null || quizSession.questions.isEmpty) {
      return const Text('No question available');
    }

    final currentQuestion = quizSession.currentQuestion;

    return Column(
      children: [
        Text(
          currentQuestion.question,
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        // TODO: Add media display based on question type
        if (currentQuestion.type == QuestionType.image && currentQuestion.mediaUrl != null)
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text('Image placeholder'),
            ),
          ),
        if (currentQuestion.type == QuestionType.video && currentQuestion.mediaUrl != null)
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text('Video placeholder'),
            ),
          ),
      ],
    );
  }
}