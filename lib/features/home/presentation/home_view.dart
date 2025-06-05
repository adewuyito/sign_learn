// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/features/profile/profile.dart';

import '../../../common/commons.dart';
import '../../../core/core.dart';
import '../../../gen/fonts.gen.dart';

import 'widgets/home_calender.dart';
import 'widgets/module_buttons.dart';

@RoutePage()
class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userName = ref.watch(userNotiferProvider).displayName;
    final fullname = userName ?? "Welcome Back";
    final _widgetSize = Size(Dims.availableWidth, 141.dy);
    final tt = Theme.of(context).textTheme;
    return SafeArea(
      minimum: safeAreaPadding,
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(onPressed: () async {
        //   // debugPrint("User Profile ==> ${ref.watch(userNotiferProvider)}");
        //   // debugPrint("User Profile ==> ${ref.watch(authNotifierProvider)}");

        //   final lessonLocks = ref.watch(lessonLocksProvider);
        //   await ref.read(lessonLocksProvider.notifier).unlockLesson(3);

        //   debugPrint("Lesson lock ${lessonLocks}");
        //   // SignNavigator.of(context).push(SignQuizRoute());
        // }),
        appBar: AppBar(
          centerTitle: false,
          title: Row(
            children: [
              ProfileImage(size: Size.square(32)),
              XBox(padding),
              RichTextWidget(
                styleForAll: TextStyle(color: appColors.black),
                texts: [
                  BaseText.plain(
                    text: "Hello, ",
                    style: tt.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontFamily: FontFamily.satoshi,
                    ),
                  ),
                  BaseText(
                    text: fullname,
                    style: tt.headlineMedium!.copyWith(
                      fontFamily: FontFamily.clashDisplay,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // YBox(.2.dyPercent),
            StreakWeekCalander(size: _widgetSize),
            YBox(.05.dyPercent),
            Text(
              "Learning Units",
              style: tt.headlineMedium!.copyWith(
                fontFamily: FontFamily.satoshi,
                fontWeight: FontWeight.bold,
              ),
            ),
            YBox(padding.dy),
            ModuleButtons(),
          ],
        ),
      ),
    );
  }
}
