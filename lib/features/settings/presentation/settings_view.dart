import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:sign_learn/common/commons.dart';
import 'package:sign_learn/core/core.dart';
import 'package:sign_learn/features/auth/domain/domain.dart';

@RoutePage()
class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsViewState();
}

class _SettingsViewState extends ConsumerState<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: safeAreaPadding,
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [],
              ),
            ),
            SignUpButton(
              label: 'Sign Out',
              onPressed: () => ref
                  .read(authNotifierProvider.notifier)
                  .logOut(context: context),
              role: ButtonRole.destructive,
            )
          ],
        ),
      ),
    );
  }
}
