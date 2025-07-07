import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/common/components/dialog/view/dissmisable_dialog.dart';
import 'package:sign_learn/features/lessons/data/models/category_levels.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/core.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../routes/router.dart';
import '../../../../common/commons.dart';
import '../../../profile/presentation/provider/lesson_locks_provider.dart';

class ModuleButtons extends ConsumerWidget {
  const ModuleButtons({
    super.key,
  });

  // TODO: This button is getting the different users data correctly - REPRODUCTION: Login to an account and change the lessonLock remote then check another account lesson lock.
  @override
  Widget build(context, ref) {
    final tt = Theme.of(context).textTheme;
    // final lL = ref.read(sharedPrefStorageProvider).get(lessonLock);
    final lessonLocks = ref.watch(lessonLocksProvider);
    var getASLLock = lessonLocks.map((e) => e == 'open').toList();

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
                      // LessonListRoute(
                      //   categoryLevel: CategoryLevel.values[index],
                      // ),

                      LessonsByLevelRoute(
                        levelId: CategoryLevel.values[index].toString(),
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
