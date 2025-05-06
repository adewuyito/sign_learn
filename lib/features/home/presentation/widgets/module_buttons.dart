import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/common/components/dialog/view/dissmisable_dialog.dart';
import 'package:sign_learn/features/lessons/data/models/category_levels.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/core.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../routes/router.dart';
import '../../../../common/commons.dart';

class ModuleButtons extends ConsumerWidget {
  const ModuleButtons({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final tt = Theme.of(context).textTheme;
    final lL = ref.read(sharedPrefStorageProvider).get(lessonLock);
    var getASLLock = lL.map((e) => e == 'open').toList();

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
              getASLLock[index]
                  ? SignNavigator.of(context).push(
                      LessonListRoute(
                        categoryLevel: CategoryLevel.values[index],
                      ),
                    )
                  : NextMouleDialog().present(context);
            },
            size: buttonSize(ButtonSize.full),
            labelWidget: Row(
              children: [
                Text(
                  CategoryLevel.values[index].name,
                  style: tt.labelLarge!,
                ),
                Spacer(),
                !getASLLock[index]
                    ? Icon(
                        Icons.lock,
                        color: appColors.black,
                      )
                    : SvgPicture.asset(Assets.icons.miscIcons.nextArrow)
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
