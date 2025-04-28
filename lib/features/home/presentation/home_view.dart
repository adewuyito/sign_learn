// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/common/components/components.dart';

import 'package:sign_learn/core/constants/constants.dart';
import 'package:sign_learn/core/services/storage/shared_pref_storage_service.dart';
import 'package:sign_learn/features/auth/domain/providers/auth_state_provider.dart';
import 'package:sign_learn/features/lessons/data/models/category_levels.dart';
import 'package:sign_learn/features/lessons/presentation/lesson_list_view.dart';
import 'package:sign_learn/features/profile/presentation/provider/user_payload_provider.dart';
import 'package:sign_learn/features/home/presentation/widgets/home_calender.dart';
import 'package:sign_learn/features/splash_view.dart';
import 'package:sign_learn/gen/fonts.gen.dart';
import 'package:sign_learn/routes/router.dart';
import 'package:sign_learn/routes/sign_learn_router.gr.dart';

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
    final _widgetSize = Size(Dims.availableWidth, 141.dy);
    final tt = Theme.of(context).textTheme;
    return SafeArea(
      minimum: safeAreaPadding,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Hello, ${ref.watch(userNotiferProvider).fullname}",
            style: tt.headlineMedium,
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
