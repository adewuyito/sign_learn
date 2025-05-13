import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../core/core.dart';
import '../gen/fonts.gen.dart';
import '../routes/sign_learn_router.gr.dart';
import 'profile/presentation/provider/provider.dart';

@RoutePage()
class SkeletonTabView extends ConsumerStatefulWidget {
  const SkeletonTabView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SkeletonTabViewState();
}

class _SkeletonTabViewState extends ConsumerState<SkeletonTabView> {
  @override
  void initState() {
    Future(() {
      ref.read(userNotiferProvider.notifier).initUser();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      physics: NeverScrollableScrollPhysics(),
      builder: (context, child, tabController) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: DashBoardNavigationBar(tabsRouter: tabsRouter),
        );
      },
      homeIndex: 0,
      routes: [
        HomeRoute(),
        DictionaryRoute(),
        ProfileRoute(),
      ],
    );
  }
}

class KNavigationDestination extends StatefulWidget {
  final String? inActiveIcon;
  final String label;
  final String activeIcon;

  const KNavigationDestination({
    super.key,
    this.inActiveIcon,
    required this.label,
    required this.activeIcon,
  });

  @override
  State<KNavigationDestination> createState() => _KNavigationDestinationState();
}

class _KNavigationDestinationState extends State<KNavigationDestination> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => setState(() {
        isActive = !isActive;
      }),
      style: OutlinedButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        side: BorderSide(
          width: 2,
          color: isActive ? appColors.black : appColors.transparent,
        ),
      ),
      child: Row(
        mainAxisAlignment:
            isActive ? MainAxisAlignment.start : MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          isActive
              ? SvgPicture.asset(widget.activeIcon)
              : SvgPicture.asset(widget.inActiveIcon ?? widget.activeIcon),
          XBox(isActive ? padding.dx : 0),
          isActive
              ? Text(
                  widget.label,
                  style: TextTheme.of(context).labelMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontFamily: FontFamily.satoshi,
                      ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}

class DashBoardNavigationBar extends StatelessWidget {
  const DashBoardNavigationBar({
    super.key,
    required this.tabsRouter,
  });

  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          thickness: 0.33,
          height: 0,
          color: appColors.appbarUnderline,
        ),
        NavigationBar(
          selectedIndex: tabsRouter.activeIndex,
          onDestinationSelected: tabsRouter.setActiveIndex,
          backgroundColor: appColors.white,
          indicatorColor: appColors.transparent,
          overlayColor: WidgetStateColor.transparent,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.house_outlined),
              selectedIcon: Icon(Icons.house),
              label: "Explore",
            ),
            NavigationDestination(
              icon: Icon(Icons.book),
              label: "Vocabulary",
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ],
    );
  }
}
