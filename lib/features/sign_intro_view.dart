import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/features/splash_view.dart';
import 'package:sign_learn/features/auth/presentation/auth_widgets.dart';

import '../core/core.dart';
import '../routes/router.dart';

@RoutePage()
class SignIntroView extends ConsumerWidget {
  const SignIntroView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
          child: SignButton(
        label: "Sign Up",
        onCall: () {
          ref.read(sharedPrefStorageProvider).set(introScreenPrefKey, true);
          SignNavigator.of(context).replace(HomeRoute());
        },
      )),
    );
  }
}
