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

@RoutePage()
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _numPages = 3;

  List<OnboardingPage> pages = [
    OnboardingPage(
      title: 'Welcome to SignLearn',
      description:
          'Learn sign language with our interactive lessons and practice exercises.',
      image: 'assets/onboarding/page1.png',
    ),
    OnboardingPage(
      title: 'Practice Anytime',
      description:
          'Practice at your own pace with our comprehensive library of signs.',
      image: 'assets/onboarding/page2.png',
    ),
    OnboardingPage(
      title: 'Track Your Progress',
      description:
          'Monitor your learning journey and celebrate your achievements.',
      image: 'assets/onboarding/page3.png',
    ),
  ];

  void _completeOnboarding() async {
    // Mark onboarding as completed
    await ref
        .read(sharedPrefStorageProvider)
        .set('hasCompletedOnboarding', true);

    if (!mounted) return;

    // Navigate to the main app
    context.router.replace(const SkeletonTabRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Skip button
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: _completeOnboarding,
                child: const Text('Skip'),
              ),
            ),

            // Page content
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemCount: _numPages,
                itemBuilder: (context, index) {
                  return OnboardingPageView(page: pages[index]);
                },
              ),
            ),

            // Page indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _numPages,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: _currentPage == index ? 24 : 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),

            // Navigation buttons
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back button (hidden on first page)
                  _currentPage > 0
                      ? TextButton(
                          onPressed: () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                          child: const Text('Back'),
                        )
                      : const SizedBox(width: 80),

                  // Next/Done button
                  ElevatedButton(
                    onPressed: () {
                      if (_currentPage < _numPages - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      } else {
                        _completeOnboarding();
                      }
                    },
                    child: Text(
                        _currentPage < _numPages - 1 ? 'Next' : 'Get Started'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Onboarding page model
class OnboardingPage {
  final String title;
  final String description;
  final String image;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.image,
  });
}

// Onboarding page view
class OnboardingPageView extends StatelessWidget {
  final OnboardingPage page;

  const OnboardingPageView({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            page.image,
            height: 240,
          ),
          const SizedBox(height: 40),
          Text(
            page.title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            page.description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
