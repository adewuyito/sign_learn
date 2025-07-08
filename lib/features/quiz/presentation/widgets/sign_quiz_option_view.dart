import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/features/shared/presentation/linear_progress_bar.dart';

import '../../../../core/core.dart';
import '../providers/quiz_controller.dart';
import '../widgets/quiz_question_widget.dart';
import '../widgets/feedback_overlay.dart';
import 'lesson_navigation_button.dart';

@RoutePage()
class SignQuizVideoOptionView extends ConsumerStatefulWidget {
  const SignQuizVideoOptionView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SignQuizVideoOptionViewState();
}

class _SignQuizVideoOptionViewState
    extends ConsumerState<SignQuizVideoOptionView> {
  int? selectedOptionIndex;

  @override
  Widget build(BuildContext context) {
    final controllerState = ref.watch(quizControllerProvider);
    final controller = ref.read(quizControllerProvider.notifier);
    final session = controllerState.session;
    final currentQuestion = (session != null && session.questions.isNotEmpty)
        ? session.questions[session.currentQuestionIndex]
        : null;

    if (controllerState.isLoading ||
        session == null ||
        currentQuestion == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: SignLinearProgressBar(progress: controller.progress),
      ),
      body: Stack(
        children: [
          SafeArea(
            minimum: safeAreaPadding,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Question widget with video player
                  QuizQuestionWidget(
                    question: currentQuestion,
                    onVideoComplete: () {
                      // Handle video completion if needed
                    },
                    onVideoStart: () {
                      // Handle video start if needed
                    },
                  ),

                  const SizedBox(height: 32),

                  // Enhanced options widget
                  EnhancedOptionsWidget(
                    question: currentQuestion,
                    selectedIndex: selectedOptionIndex,
                    onOptionSelected: (index) {
                      setState(() {
                        selectedOptionIndex = index;
                      });
                    },
                  ),

                  const SizedBox(height: 24),

                  // Enhanced navigation button
                  LessonsNavigationButton(
                    selectedIndex: selectedOptionIndex,
                    onSubmit: selectedOptionIndex != null
                        ? () {
                            controller.submitAnswer(selectedOptionIndex!);
                            setState(() {
                              selectedOptionIndex = null;
                            });
                          }
                        : null,
                    onPrevious: controller.canGoPrevious
                        ? () => controller.previousQuestion()
                        : null,
                  ),
                ],
              ),
            ),
          ),

          // Feedback overlay
          if (controllerState.showingFeedback) const AnimatedFeedbackOverlay(),
        ],
      ),
    );
  }
}

Widget projectTitle = Column();
