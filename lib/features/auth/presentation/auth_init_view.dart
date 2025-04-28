import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../routes/router.dart';
import '../auth.dart';
import '../domain/providers/is_logged_provider.dart';

@RoutePage()
class AuthInitPage extends ConsumerStatefulWidget {
  const AuthInitPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthInitPageState();
}

class _AuthInitPageState extends ConsumerState<AuthInitPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      final isLoggedIn = ref.read(isLoggedInProvider);

      if (isLoggedIn) {
        context.replaceRoute(SkeletonTabRoute()); // Go to home
      } else {
        context.replaceRoute(SignSplashRoute()); // Show splash once
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    ref.listen<bool>(isLoggedInProvider, (prev, next) {
      final userId = ref.read(authNotifierProvider).userId;
      if (next && userId != null) {
        context.replaceRoute(const HomeRoute());
      } else {
        context.replaceRoute(const LoginRoute());
      }
    });

    return const Scaffold(
      body: Center(child: SizedBox.shrink()),
    );
  }
}
