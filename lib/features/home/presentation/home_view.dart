// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/common/components/components.dart';

import 'package:sign_learn/core/constants/constants.dart';
import 'package:sign_learn/features/lessons/data/models/category_levels.dart';
import 'package:sign_learn/features/lessons/presentation/widgets/lesson_list_view.dart';
import 'package:sign_learn/features/profile/riverpod/user_payload_provider.dart';
import 'package:sign_learn/features/home/presentation/widgets/home_calender.dart';
import 'package:sign_learn/routes/router.dart';
import 'package:sign_learn/routes/sign_learn_router.gr.dart';

@RoutePage()
class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    ref.read(userNotiferProvider.notifier).initUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _widgetSize = Size(Dims.availableWidth, 141.dy);
    final tt = Theme.of(context).textTheme;
    return SafeArea(
      minimum: safeAreaPadding,
      child: Scaffold(
        body: Column(
          children: [
            // YBox(.2.dyPercent),
            StreakWeekCalander(size: _widgetSize),
            YBox(.05.dyPercent),
            SizedBox(
              height: .4.dyPercent,
              child: ListView.separated(
                itemBuilder: (context, index) {
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
                  );
                },
                separatorBuilder: (context, index) => YBox(padding.dy),
                itemCount: CategoryLevel.values.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
