import 'package:flutter/material.dart';
import 'package:sign_learn/routes/sign_learn_router.gr.dart';
import 'package:sign_learn/features/lessons/data/models/category_levels.dart';

import '../../../../core/core.dart';
import '../../../../routes/router.dart';
import '../../../../common/commons.dart';

class ModuleButtons extends StatelessWidget {
  const ModuleButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return SizedBox(
      height: .4.dyPercent,
      child: ListView.separated(
        itemBuilder: (context, index) {
          final buttonColor = [
            Color(0xFF66D765),
            Color(0xFFF1E068),
            Color(0xFFBFBEF7),
            appColors.gradientHigh,
          ];
          return SignActionButton(
            onPressed: () {
              SignNavigator.of(context).push(
                LessonListRoute(
                  categoryLevel: CategoryLevel.values[index],
                ),
              );
            },
            size: buttonSize(ButtonSize.full),
            labelWidget: Row(
              children: [
                Text(
                  CategoryLevel.values[index].name,
                  style: tt.labelLarge!,
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: appColors.black,
                )
              ],
            ),
            color: buttonColor[index],
          );
        },
        separatorBuilder: (context, index) => YBox(padding.dy),
        itemCount: CategoryLevel.values.length,
      ),
    );
  }
}
