import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/features/profile/presentation/presentation.dart';

import '../../../common/commons.dart';
import '../../auth/domain/domain.dart';

import '../../../core/core.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../routes/router.dart';

@RoutePage()
class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tt = TextTheme.of(context);
    return SafeArea(
      minimum: safeAreaPadding,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Account",
            style: tt.headlineMedium!
                .copyWith(fontFamily: FontFamily.clashDisplay),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            YBox(padding),
            ProfileImage(),
            Text(
              ref.watch(userNotiferProvider).displayName ?? "Hello",
              style:
                  tt.headlineMedium!.copyWith(fontFamily: FontFamily.satoshi),
            ),
            YBox(61.dy),
            Divider(),
            // ~ Account Info
            ProfileOptionButton(
              onTap: () => SignNavigator.of(context).push(ProfileEditRoute()),
              iconAsset: Assets.icons.profileIcons.profileAccountInfoIcon,
              label: "Account Information",
              subLabel: "Get information about your account",
            ),
            Divider(),
            // ~ Security
            ProfileOptionButton(
              onTap: () {},
              iconAsset: Assets.icons.profileIcons.profileSecurityIcon,
              label: "Security",
              subLabel: "Protect your account from intruders",
            ),
            Divider(),
            // ~ Help
            ProfileOptionButton(
              onTap: () {},
              iconAsset: Assets.icons.profileIcons.profileHelpIcon,
              label: "Help",
              subLabel: "Need help with something",
            ),
            Divider(),
            // ~ Logout
            ProfileOptionButton(
              onTap: () => ref
                  .read(authNotifierProvider.notifier)
                  .logOut(context: context),
              iconAsset: Assets.icons.profileIcons.profileLogoutIcon,
              label: "Log Out",
              subLabel: "Exit app",
              role: ButtonRole.destructive,
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
