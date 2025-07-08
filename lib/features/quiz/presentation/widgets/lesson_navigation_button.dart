import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/commons.dart';
import '../../../../core/core.dart';
import '../providers/quiz_controller.dart';

class LessonsNavigationButton extends ConsumerWidget {
  const LessonsNavigationButton({
    super.key,
    this.selectedIndex,
    this.onSubmit,
    this.onPrevious,
  });

  final int? selectedIndex;
  final VoidCallback? onSubmit;
  final VoidCallback? onPrevious;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(quizControllerProvider.notifier);
    final session = ref.watch(currentQuizSessionProvider);
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Previous button
        TextButton(
          onPressed: onPrevious,
          child: Row(
            children: [
              Icon(
                Icons.arrow_back, 
                color: onPrevious != null 
                    ? appColors.grey767676 
                    : appColors.grey767676.withOpacity(0.5),
              ),
              Text(
                'Previous',
                style: TextTheme.of(context)
                    .labelMedium!
                    .copyWith(
                      color: onPrevious != null 
                          ? appColors.grey767676 
                          : appColors.grey767676.withOpacity(0.5),
                    ),
              ),
            ],
          ),
        ),
        
        // Submit/Next button
        SignActionButton(
          onPressed: onSubmit,
          labelWidget: Text(
            session?.isLastQuestion ?? false ? 'Finish' : 'Submit',
          ),
          backgroundColor: selectedIndex != null 
              ? appColors.blue 
              : appColors.grey767676,
        ),
      ],
    );
  }
}

/// Legacy version for backward compatibility with old quiz option provider
class LegacyLessonsNavigationButton extends ConsumerWidget {
  const LegacyLessonsNavigationButton({
    super.key,
    required this.boolOptions,
  });

  final List<bool> boolOptions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {}, // ~ Previous logic
          child: Row(
            children: [
              Icon(Icons.arrow_back, color: appColors.grey767676),
              Text(
                'Previous',
                style: TextTheme.of(context)
                    .labelMedium!
                    .copyWith(color: appColors.grey767676),
              ),
            ],
          ),
        ),
        SignActionButton(
          onPressed: () {
            // ~ Next logic
            final selectedIndex =
                boolOptions.indexWhere((v) => v == true);
            if (selectedIndex != -1) {
              print('Selected option: Option ${selectedIndex + 1}');
            } else {
              print('No option selected');
            }
          },
          labelWidget: const Text('Submit'),
        ),
      ],
    );
  }
}
