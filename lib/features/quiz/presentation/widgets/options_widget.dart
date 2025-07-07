
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/core.dart';
import '../providers/quiz_option_provider.dart';

class OptionWidget extends ConsumerWidget {
  const OptionWidget({super.key, required this.boolOptions});
  final List<bool> boolOptions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 1.dxPercent,//screenWidth,
      height: 200,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 24,
          crossAxisSpacing: 24,
          childAspectRatio: 2.5,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              ref.read(quizOptionNotifierProvider.notifier).toggleOption(index);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: boolOptions[index]
                      ? appColors.blue
                      : appColors.black.withAlpha(100),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),
                color:
                    boolOptions[index] ? appColors.paleGreen : appColors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Option ${index + 1}',
                    style: TextStyle(
                      color: appColors.black,
                      fontWeight: boolOptions[index]
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
