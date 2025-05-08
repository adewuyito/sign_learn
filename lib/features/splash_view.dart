import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/core/services/services.dart';
import 'package:sign_learn/routes/router.dart';


const String introScreenPrefKey = 'hasCompletedOnboarding';
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
    __navigateToNextScreen();
  }

  Future<void> __navigateToNextScreen() async {
    final storage = ref.read(sharedPrefStorageProvider);
    final completedOnboarding = storage.get(introScreenPrefKey) ?? false;
    if (!mounted) return;
    if (completedOnboarding) {
      SignNavigator.of(context).replace(SkeletonTabRoute());
    } else {
      SignNavigator.of(context).replace(SignIntroRoute());
    }
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

