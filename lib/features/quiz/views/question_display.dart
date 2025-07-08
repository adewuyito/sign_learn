import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/quiz_question.dart';

class QuestionDisplay extends ConsumerWidget {
  const QuestionDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text(
          'Question Text Here', // TODO: Get from provider
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        // TODO: Add media display based on question type
      ],
    );
  }
}