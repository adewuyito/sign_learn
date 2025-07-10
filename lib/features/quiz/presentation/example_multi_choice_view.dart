import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/features/quiz/data/models/models.dart';
import 'package:sign_learn/features/quiz/presentation/widgets/multi_choice_widget.dart';

@RoutePage()
class ExampleMultiChoiceView extends ConsumerStatefulWidget {
  const ExampleMultiChoiceView({super.key});

  @override
  ConsumerState<ExampleMultiChoiceView> createState() =>
      _ExampleMultiChoiceViewState();
}

class _ExampleMultiChoiceViewState
    extends ConsumerState<ExampleMultiChoiceView> {
  // Sample quiz question data
  final List<QuizOptionModel> sampleOptions = [
    const QuizOptionModel(optionId: '1', text: 'Option A'),
    const QuizOptionModel(optionId: '2', text: 'Option B'),
    const QuizOptionModel(optionId: '3', text: 'Option C'),
    const QuizOptionModel(optionId: '4', text: 'Option D'),
  ];

  final int correctOptionIndex = 1; // Option B is correct

  @override
  Widget build(BuildContext context) {
    final selectedOption = ref.watch(selectedOptionProvider);
    final showFeedback = ref.watch(showFeedbackProvider);
    final isCorrect = ref.watch(isCorrectProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi-Choice Example'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Text(
                'What is the correct answer to this sample question?',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),

            const SizedBox(height: 24),

            // Multi-choice options
            MultiChoiceWidget(
              options: sampleOptions,
              correctOptionIndex: correctOptionIndex,
              showFeedback: showFeedback,
              isCorrect: isCorrect,
              onOptionSelected: (index) {
                debugPrint('Selected option: $index');
              },
            ),

            const SizedBox(height: 24),

            // Feedback message
            if (showFeedback) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isCorrect == true
                      ? Colors.green.shade50
                      : Colors.red.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isCorrect == true ? Colors.green : Colors.red,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      isCorrect == true ? Icons.check_circle : Icons.cancel,
                      color: isCorrect == true ? Colors.green : Colors.red,
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        isCorrect == true
                            ? 'Correct! Well done!'
                            : 'Incorrect. The correct answer is Option B.',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: isCorrect == true
                                      ? Colors.green.shade800
                                      : Colors.red.shade800,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],

            const Spacer(),

            // Action buttons
            Column(
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
                              final isCorrectAnswer =
                                  selectedOption == correctOptionIndex;
                              MultiChoiceController.showFeedback(
                                  ref, isCorrectAnswer);
                            } else {
                              // Reset for next question
                              MultiChoiceController.reset(ref);
                            }
                          },
                    child: Text(
                      !showFeedback ? 'Submit Answer' : 'Try Again',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                if (!showFeedback) ...[
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
                        MultiChoiceController.reset(ref);
                      },
                      child: const Text(
                        'Reset',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
