import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/features/quiz/data/data.dart';
import 'package:sign_learn/features/quiz/domain/usecases/usecases.dart';
import 'package:sign_learn/features/quiz/presentation/widgets/multi_choice_widget.dart';

@RoutePage()
class QuizViewWithMultiChoice extends ConsumerStatefulWidget {
  final String levelId;
  final String unitId;
  final String lessonId;

  const QuizViewWithMultiChoice({
    super.key,
    required this.levelId,
    required this.unitId,
    required this.lessonId,
  });

  @override
  ConsumerState<QuizViewWithMultiChoice> createState() =>
      _QuizViewWithMultiChoiceState();
}

class _QuizViewWithMultiChoiceState
    extends ConsumerState<QuizViewWithMultiChoice> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final quizAsync = ref.watch(fetchQuizByLessonProvider((
      levelId: widget.levelId,
      unitId: widget.unitId,
      lessonId: widget.lessonId,
    )));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: quizAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (quiz) {
          if (quiz == null) {
            return const Center(child: Text('No quiz found for this lesson.'));
          }

          final questions = quiz.questions;
          final question = questions[currentIndex];
          final selectedOption = ref.watch(selectedOptionProvider);
          final showFeedback = ref.watch(showFeedbackProvider);
          final isCorrect = ref.watch(isCorrectProvider);

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Progress indicator
                _buildProgressIndicator(questions.length),
                const SizedBox(height: 24),

                // Question content
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Media content
                        if (question.mediaType == MediaType.image)
                          _buildImageContent(question.mediaUrl)
                        else if (question.mediaType == MediaType.video)
                          _buildVideoContent(question.mediaUrl),

                        const SizedBox(height: 16),

                        // Question text
                        if (question.questionText != null)
                          _buildQuestionText(question.questionText!),

                        const SizedBox(height: 24),

                        // Multi-choice options
                        MultiChoiceWidget(
                          options: question.options,
                          correctOptionIndex: question.correctOptionIndex,
                          showFeedback: showFeedback,
                          isCorrect: isCorrect,
                          onOptionSelected: (index) {
                            // Option selected callback
                            debugPrint('Selected option: $index');
                          },
                        ),

                        const SizedBox(height: 24),

                        // Feedback message
                        if (showFeedback) _buildFeedbackMessage(isCorrect),
                      ],
                    ),
                  ),
                ),

                // Action buttons
                _buildActionButtons(
                  questions.length,
                  selectedOption,
                  showFeedback,
                  question.correctOptionIndex,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProgressIndicator(int totalQuestions) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Question ${currentIndex + 1} of $totalQuestions',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Text(
              '${((currentIndex + 1) / totalQuestions * 100).round()}%',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: (currentIndex + 1) / totalQuestions,
          backgroundColor: Colors.grey.shade200,
          valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildImageContent(String imageUrl) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey.shade200,
              child: const Icon(
                Icons.image_not_supported,
                size: 64,
                color: Colors.grey,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildVideoContent(String videoUrl) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: Colors.black87,
            ),
            const Icon(
              Icons.play_circle_outline,
              size: 64,
              color: Colors.white,
            ),
            Positioned(
              bottom: 16,
              left: 16,
              child: Text(
                'Video Content',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionText(String questionText) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Text(
        questionText,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildFeedbackMessage(bool? isCorrect) {
    if (isCorrect == null) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCorrect ? Colors.green.shade50 : Colors.red.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isCorrect ? Colors.green : Colors.red,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Icon(
            isCorrect ? Icons.check_circle : Icons.cancel,
            color: isCorrect ? Colors.green : Colors.red,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              isCorrect ? 'Correct! Well done!' : 'Incorrect. Try again!',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color:
                        isCorrect ? Colors.green.shade800 : Colors.red.shade800,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(
    int totalQuestions,
    int? selectedOption,
    bool showFeedback,
    int correctOptionIndex,
  ) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: selectedOption == null
                ? null
                : () {
                    if (!showFeedback) {
                      // Show feedback
                      final isCorrect = selectedOption == correctOptionIndex;
                      MultiChoiceController.showFeedback(ref, isCorrect);
                    } else {
                      // Next question or finish
                      if (currentIndex < totalQuestions - 1) {
                        setState(() {
                          currentIndex++;
                        });
                        MultiChoiceController.reset(ref);
                      } else {
                        // Quiz finished
                        _showQuizCompletionDialog();
                      }
                    }
                  },
            child: Text(
              !showFeedback
                  ? 'Submit Answer'
                  : (currentIndex < totalQuestions - 1
                      ? 'Next Question'
                      : 'Finish Quiz'),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        if (showFeedback && currentIndex < totalQuestions - 1) ...[
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                setState(() {
                  currentIndex++;
                });
                MultiChoiceController.reset(ref);
              },
              child: const Text(
                'Skip to Next',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  void _showQuizCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Complete!'),
        content: const Text('Congratulations! You have completed the quiz.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.router.pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
