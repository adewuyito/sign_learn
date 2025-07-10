import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/features/quiz/data/models/models.dart';

// Provider to manage the selected option state
final selectedOptionProvider = StateProvider<int?>((ref) => null);

// Provider to manage feedback state
final showFeedbackProvider = StateProvider<bool>((ref) => false);

// Provider to manage if the answer is correct
final isCorrectProvider = StateProvider<bool?>((ref) => null);

class MultiChoiceWidget extends ConsumerWidget {
  final List<QuizOptionModel> options;
  final int correctOptionIndex;
  final bool showFeedback;
  final bool? isCorrect;
  final Function(int) onOptionSelected;
  final bool disabled;

  const MultiChoiceWidget({
    super.key,
    required this.options,
    required this.correctOptionIndex,
    required this.showFeedback,
    this.isCorrect,
    required this.onOptionSelected,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedOption = ref.watch(selectedOptionProvider);

    return Column(
      children: List.generate(options.length, (index) {
        final option = options[index];
        final isSelected = selectedOption == index;
        final isAnswer = showFeedback && index == correctOptionIndex;
        final isWrong = showFeedback && isSelected && !isAnswer;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: _OptionButton(
            text: option.text,
            isSelected: isSelected,
            isAnswer: isAnswer,
            isWrong: isWrong,
            disabled: disabled || showFeedback,
            onPressed: () {
              if (!disabled && !showFeedback) {
                ref.read(selectedOptionProvider.notifier).state = index;
                onOptionSelected(index);
              }
            },
          ),
        );
      }),
    );
  }
}

class _OptionButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isAnswer;
  final bool isWrong;
  final bool disabled;
  final VoidCallback onPressed;

  const _OptionButton({
    required this.text,
    required this.isSelected,
    required this.isAnswer,
    required this.isWrong,
    required this.disabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color borderColor;
    Color textColor;

    if (isAnswer) {
      backgroundColor = Colors.green.shade100;
      borderColor = Colors.green;
      textColor = Colors.green.shade900;
    } else if (isWrong) {
      backgroundColor = Colors.red.shade100;
      borderColor = Colors.red;
      textColor = Colors.red.shade900;
    } else if (isSelected) {
      backgroundColor = Theme.of(context).primaryColor.withOpacity(0.1);
      borderColor = Theme.of(context).primaryColor;
      textColor = Theme.of(context).primaryColor;
    } else {
      backgroundColor = Colors.transparent;
      borderColor = Colors.grey.shade300;
      textColor = Colors.black87;
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: disabled ? null : onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: borderColor, width: 2),
                    color: isSelected || isAnswer || isWrong
                        ? borderColor
                        : Colors.transparent,
                  ),
                  child: (isSelected || isAnswer || isWrong)
                      ? Icon(
                          isAnswer
                              ? Icons.check
                              : isWrong
                                  ? Icons.close
                                  : Icons.radio_button_checked,
                          size: 12,
                          color: Colors.white,
                        )
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: isSelected || isAnswer || isWrong
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Helper widget to reset the selected state
class MultiChoiceController extends ConsumerWidget {
  final Widget child;

  const MultiChoiceController({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return child;
  }

  static void reset(WidgetRef ref) {
    ref.read(selectedOptionProvider.notifier).state = null;
    ref.read(showFeedbackProvider.notifier).state = false;
    ref.read(isCorrectProvider.notifier).state = null;
  }

  static void showFeedback(WidgetRef ref, bool isCorrect) {
    ref.read(showFeedbackProvider.notifier).state = true;
    ref.read(isCorrectProvider.notifier).state = isCorrect;
  }
}
