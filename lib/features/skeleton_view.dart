import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../core/core.dart';
import '../gen/fonts.gen.dart';
import '../routes/sign_learn_router.gr.dart';

@RoutePage()
class SkeletonTabView extends ConsumerStatefulWidget {
  const SkeletonTabView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SkeletonTabViewState();
}

class _SkeletonTabViewState extends ConsumerState<SkeletonTabView> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      // homeIndex: 0,
      routes: [
        HomeRoute(),
        DictionaryRoute(),
        ProfileRoute(),
      ],

      bottomNavigationBuilder: (_, tabsRouter) =>
          DashBoardNavigationBar(tabsRouter: tabsRouter),
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

class CustomBottomNavBar extends StatelessWidget{
  final TabsRouter tabsRouter;

  const CustomBottomNavBar({
    super.key,
    required this.tabsRouter,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      _NavItem(icon: Icons.home, label: 'Home'),
      _NavItem(icon: Icons.school, label: 'Learn'),
      _NavItem(icon: Icons.book, label: 'Dictionary'),
    ];

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: appColors.black, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            final selected = tabsRouter.activeIndex == index;
            final item = items[index];
            return GestureDetector(
              onTap: () => tabsRouter.setActiveIndex(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: selected ? Color(0xFFFFE4C7) : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: selected
                      ? Border.all(
                          width: 2,
                          color: appColors.black,
                        )
                      : null,
                ),
                child: Row(
                  children: [
                    Icon(
                      item.icon,
                      color: selected
                          ? Colors.black
                          : Colors
                              .grey, // ~ Change the color of the selected item
                    ),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      child: selected
                          ? Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                item.label,
                                style:
                                    TextTheme.of(context).labelMedium!.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: FontFamily.satoshi,
                                        ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem({required this.icon, required this.label});
}

