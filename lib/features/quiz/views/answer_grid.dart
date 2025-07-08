import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../controllers/quiz_controller.dart';

class AnswerGrid extends ConsumerWidget {
  const AnswerGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizSession = ref.watch(quizControllerProvider);
    final quizController = ref.read(quizControllerProvider.notifier);
    
    if (quizSession == null || quizSession.questions.isEmpty) {
      return const Text('No options available');
    }

    final currentQuestion = quizSession.currentQuestion;
    final selectedAnswer = quizSession.answers[quizSession.currentQuestionIndex];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: currentQuestion.options.length,
      itemBuilder: (context, index) {
        final isSelected = selectedAnswer == index;
        
        return Card(
          color: isSelected ? Theme.of(context).primaryColor.withOpacity(0.2) : null,
          child: InkWell(
            onTap: () {
              quizController.answerQuestion(index);
            },
            child: Container(
              decoration: BoxDecoration(
                border: isSelected 
                  ? Border.all(color: Theme.of(context).primaryColor, width: 2)
                  : null,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  currentQuestion.options[index],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}