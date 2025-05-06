// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/common/commons.dart';
import 'package:sign_learn/core/services/storage/shared_pref_storage_service.dart';
import 'package:sign_learn/features/profile/presentation/widget/sign_profile_image.dart';

import 'package:sign_learn/gen/fonts.gen.dart';

import 'package:sign_learn/core/constants/extensions.dart';

import 'widgets/home_calender.dart';
import 'widgets/module_buttons.dart';
import '../../../core/constants/constants.dart';
import '../../profile/presentation/provider/user_payload_provider.dart';

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

    // // Schedule the provider update to run after the widget is built
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (mounted) {
    //     ref.read(userNotiferProvider.notifier).initUser();
    //   }
    // });
    Future(() {
      ref.read(userNotiferProvider.notifier).initUser();
    });
    
  }

  @override
  Widget build(BuildContext context) {
  
    final userName = ref.watch(userNotiferProvider).fullname;
    final _widgetSize = Size(Dims.availableWidth, 141.dy);
    final tt = Theme.of(context).textTheme;
    return SafeArea(
      minimum: safeAreaPadding,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Row(
            children: [
              ProfileImage(image: "image", size: Size.square(32)),
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
                    text: userName.isEmpty ? "Welcome Back" : userName,
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
