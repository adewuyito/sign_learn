import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/quiz_session.dart';
import '../models/quiz_question.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
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
                    const AnswerGrid(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}