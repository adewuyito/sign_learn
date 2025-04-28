import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/core/services/services.dart';
import 'package:sign_learn/routes/router.dart';

const String introScreenPrefKey = "is_passed_intro_flow";

@RoutePage()
class SignSplashScreen extends ConsumerStatefulWidget {
  const SignSplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SignSplashScreenState();
}

class _SignSplashScreenState extends ConsumerState<SignSplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () async {
      final storage = ref.read(sharedPrefStorageProvider);
      final bool? isViewdIntro = storage.get(introScreenPrefKey);
      if (isViewdIntro != true) {
        if (isViewdIntro == null) {
          await storage.set(introScreenPrefKey, false);
        }

        if (mounted) {
          SignNavigator.of(context).replace(SignIntroRoute());
        }
      } else {
        // User has already seen the intro
        if (mounted) {
          SignNavigator.of(context).replace(HomeRoute());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FlutterLogo(size: 100), // or your app logo
      ),
    );
  }
}

