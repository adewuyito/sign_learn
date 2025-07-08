import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/core.dart';
import '../../../routes/router.dart';
import '../../shared/presentation/linear_progress_bar.dart';
import '../data/data.dart';
import 'providers/quiz_controller.dart';
import 'widgets/quiz_question_widget.dart';
import 'widgets/feedback_overlay.dart';
import 'quiz_score_screen.dart';

@RoutePage()
class SignQuizView extends ConsumerStatefulWidget {
  const SignQuizView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignQuizViewState();
}

class _SignQuizViewState extends ConsumerState<SignQuizView> {
  int? selectedOptionIndex;

  @override
  void initState() {
    super.initState();
    // Initialize with mock quiz data for now
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeMockQuiz();
    });
  }

  void _initializeMockQuiz() {
    // Using the enhanced repository-based initialization
    ref.read(quizControllerProvider.notifier).initializeQuizFromLesson(
      userId: 'current_user_id',
      lessonId: 'lesson_1',
      forceRefresh: false,
    );
    
    // Start the quiz once initialized
    Future.delayed(const Duration(milliseconds: 500), () {
      ref.read(quizControllerProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controllerState = ref.watch(quizControllerProvider);
    final controller = ref.read(quizControllerProvider.notifier);
    final session = controllerState.session;
    final currentQuestion = session?.currentQuestion;

    // Navigate to score screen when quiz is completed
    if (session?.isCompleted ?? false) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        SignNavigator.of(context).pushAndClearStack(
          const QuizScoreScreenRoute(),
        );
      });
    }

    if (controllerState.isLoading || session == null || currentQuestion == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            controller.abandonQuiz();
            SignNavigator.of(context).pop();
          },
        ),
        title: SignLinearProgressBar(
          progress: controller.progress,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding.dx),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Lives/Hearts indicator
                Icon(
                  Icons.favorite,
                  color: appColors.red,
                  size: 24,
                ),
                const SizedBox(width: 4),
                Text(
                  '3', // Mock lives count
                  style: TextStyle(
                    color: appColors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          SafeArea(
            minimum: safeAreaPadding,
            child: Padding(
              padding: EdgeInsets.all(padding.dx),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Question counter
                  Text(
                    'Question ${session.currentQuestionIndex + 1} of ${session.totalQuestions}',
                    style: TextTheme.of(context).bodyMedium?.copyWith(
                      color: appColors.grey767676,
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Question widget
                  QuizQuestionWidget(
                    question: currentQuestion,
                  ),
                  
                  // Options
                  Expanded(
                    child: EnhancedOptionsWidget(
                      question: currentQuestion,
                      selectedIndex: selectedOptionIndex,
                      onOptionSelected: (index) {
                        setState(() {
                          selectedOptionIndex = index;
                        });
                      },
                    ),
                  ),
                  
                  // Navigation buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Previous button
                        TextButton.icon(
                          onPressed: controller.canGoPrevious 
                              ? () => controller.previousQuestion()
                              : null,
                          icon: Icon(
                            Icons.arrow_back,
                            color: controller.canGoPrevious 
                                ? appColors.grey767676 
                                : appColors.grey767676.withOpacity(0.5),
                          ),
                          label: Text(
                            'Previous',
                            style: TextStyle(
                              color: controller.canGoPrevious 
                                  ? appColors.grey767676 
                                  : appColors.grey767676.withOpacity(0.5),
                            ),
                          ),
                        ),
                        
                        // Submit/Next button
                        ElevatedButton(
                          onPressed: selectedOptionIndex != null
                              ? () {
                                  controller.submitAnswer(selectedOptionIndex!);
                                  setState(() {
                                    selectedOptionIndex = null;
                                  });
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: appColors.blue,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 12,
                            ),
                          ),
                          child: Text(
                            session.isLastQuestion ? 'Finish' : 'Submit',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Feedback overlay
          if (controllerState.showingFeedback)
            const FeedbackOverlay(),
        ],
      ),
    );
  }
}
