import 'package:flutter/material.dart';

import '../../../../common/commons.dart';
import '../../../../core/core.dart';

class LessonsNavigationButton extends StatelessWidget {
  const LessonsNavigationButton({
    super.key,
    required this.boolOptions,
  });

  final List<bool> boolOptions;

  @override
  Widget build(BuildContext context) {
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
