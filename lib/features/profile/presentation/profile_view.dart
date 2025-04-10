import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../../core/core.dart';
// import '../../../gen/fonts.gen.dart';
// import 'widget/gd_profile_image.dart';

@RoutePage()
class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Text("Profile View"),
      ),
    );
  }
}


/* 
Widget build(BuildContext context, WidgetRef ref) {
    final _profile = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          SizedBox(
            height: 30,
            child: TextButton(
              onPressed: () {
                // ! GDNavigator.of(context).push(const ProfileEditRoute());
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(0),
                overlayColor: appColors.transparent,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: appColors.grey767676.withValues(alpha: .2),
                    width: .5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "Edit",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: appColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        minimum: safeAreaPadding,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: ProfileImage(image: _profile.displayImage!),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _profile.fullname,
                    style: const TextStyle(
                      fontSize: 25,
                      fontFamily: FontFamily.athletics,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 0),
                  Text(
                    _profile.email ?? '',
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: FontFamily.athletics,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            // GDButtonWidget(
            //   buttonRole: ButtonRole.destructive,
            //   label: "Log out",
            //   onPressed: () async {
            //     final shouldLogOut = await LogOutDialog()
            //         .present(context)
            //         .then((value) => value ?? false);
            //     if (shouldLogOut) {
            //       ref.read(authStateProvider.notifier).logOut();
            //     }
            //   },
            // )
          ],
        ),
      ),
    );
  }

*/