import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/core.dart';
import '../../../routes/router.dart';
import '../../shared/presentation/linear_progress_bar.dart';
import '../domain/entities/quiz_session.dart';
import 'providers/quiz_state_provider.dart';
import 'widgets/quiz_option_widget.dart';
import 'widgets/answer_feedback_widget.dart';
import 'widgets/quiz_completion_widget.dart';

@RoutePage()
class SignQuizView extends ConsumerStatefulWidget {
  const SignQuizView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignQuizeViewState();
}

class _SignQuizeViewState extends ConsumerState<SignQuizView> {
  @override
  void initState() {
    super.initState();
    // Start the quiz when the view loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(quizStateNotifierProvider.notifier).startQuiz(
        levelId: 'level1',
        unitId: 'unit1',
        lessonId: 'lesson1',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final quizState = ref.watch(quizStateNotifierProvider);
    final quizNotifier = ref.read(quizStateNotifierProvider.notifier);

    return Scaffold(
      appBar: _buildAppBar(quizState, quizNotifier),
      body: _buildBody(quizState, quizNotifier),
    );
  }

  PreferredSizeWidget _buildAppBar(QuizState quizState, QuizStateNotifier quizNotifier) {
    return AppBar(
      leading: BackButton(
        onPressed: () {
          quizNotifier.resetQuiz();
          SignNavigator.of(context).pop();
        },
      ),
      title: SignLinearProgressBar(progress: quizNotifier.progress),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padding.dx),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.favorite,
                color: appColors.red,
                size: 20.sp,
              ),
              XBox(4.dx),
              Text(
                '3', // Mock lives count
                style: TextStyle(
                  color: appColors.red,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildBody(QuizState quizState, QuizStateNotifier quizNotifier) {
    if (quizState.status == QuizStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (quizState.status == QuizStatus.error) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64.sp,
              color: Colors.red,
            ),
            YBox(16.dy),
            Text(
              'Something went wrong',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            YBox(8.dy),
            Text(
              quizState.error ?? 'Unknown error',
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            YBox(24.dy),
            ElevatedButton(
              onPressed: () {
                quizNotifier.startQuiz(
                  levelId: 'level1',
                  unitId: 'unit1',
                  lessonId: 'lesson1',
                );
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (quizState.status == QuizStatus.completed) {
      return QuizCompletionWidget(
        correctAnswers: quizNotifier.correctAnswersCount,
        totalQuestions: quizState.currentSession?.questions.length ?? 0,
        scorePercentage: quizNotifier.scorePercentage,
        onRetakeQuiz: () {
          quizNotifier.startQuiz(
            levelId: 'level1',
            unitId: 'unit1',
            lessonId: 'lesson1',
          );
        },
        onContinue: () {
          quizNotifier.resetQuiz();
          SignNavigator.of(context).pop();
        },
      );
    }

    if (quizState.status == QuizStatus.inProgress && quizNotifier.currentQuestion != null) {
      return SafeArea(
        minimum: safeAreaPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.dx, vertical: 16.dy),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Question ${quizState.currentQuestionIndex + 1} of ${quizState.currentSession!.questions.length}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  YBox(8.dy),
                  Text(
                    quizNotifier.currentQuestion!.questionText,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  if (quizNotifier.currentQuestion!.imageUrl != null) ...[
                    YBox(16.dy),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        quizNotifier.currentQuestion!.imageUrl!,
                        height: 200.dy,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 200.dy,
                            color: Colors.grey.shade200,
                            child: Icon(
                              Icons.image_not_supported,
                              size: 48.sp,
                              color: Colors.grey.shade500,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ],
              ),
            ),
            
            // Answer options
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.dx),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: quizNotifier.currentQuestion!.answers.length,
                        separatorBuilder: (context, index) => YBox(12.dy),
                        itemBuilder: (context, index) {
                          final answer = quizNotifier.currentQuestion!.answers[index];
                          final isSelected = quizState.selectedAnswerId == answer.id;
                          final isCorrectAnswer = answer.id == quizNotifier.currentQuestion!.correctAnswerId;
                          
                          return QuizOptionWidget(
                            answer: answer,
                            isSelected: isSelected,
                            showFeedback: quizState.showFeedback,
                            isCorrect: isSelected && isCorrectAnswer,
                            isCorrectAnswer: isCorrectAnswer,
                            onTap: () => quizNotifier.selectAnswer(answer.id),
                          );
                        },
                      ),
                    ),
                    
                    // Feedback section
                    if (quizState.showFeedback) ...[
                      YBox(16.dy),
                      AnswerFeedbackWidget(
                        isCorrect: quizNotifier.isAnswerCorrect,
                        correctAnswer: quizNotifier.currentQuestion!.answers
                            .firstWhere((a) => a.id == quizNotifier.currentQuestion!.correctAnswerId)
                            .text,
                        selectedAnswer: quizNotifier.currentQuestion!.answers
                            .firstWhere((a) => a.id == quizState.selectedAnswerId!)
                            .text,
                        onContinue: quizNotifier.nextQuestion,
                        onRetry: quizNotifier.isAnswerCorrect ? null : quizNotifier.retryQuestion,
                      ),
                    ],
                    
                    // Submit button
                    if (!quizState.showFeedback) ...[
                      YBox(16.dy),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: quizState.selectedAnswerId != null 
                              ? quizNotifier.submitAnswer 
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(vertical: 16.dy),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Submit Answer',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                    
                    YBox(16.dy),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return const Center(child: CircularProgressIndicator());
  }
}
