import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../controllers/quiz_controller.dart';

class QuizProgressIndicator extends ConsumerWidget {
  const QuizProgressIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizSession = ref.watch(quizControllerProvider);
    final progress = quizSession?.progress ?? 0.0;

    return Container(
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}