import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import '../../../core/routing/route_names.dart';
import 'onboarding_manager.dart';

/// OnboardingScreen built with introduction_screen and Lottie animations.
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingManager _manager = OnboardingManager();

  Future<void> _onDone() async {
    await _manager.completeOnboarding();
    if (!mounted) return;
    context.go(RouteNames.home);
  }

  @override
  Widget build(BuildContext context) {
    final pages = <PageViewModel>[
      PageViewModel(
        title: 'Build Good Habits',
        body: 'Start small, stay consistent, and grow momentum.',
        image: Lottie.asset('assets/lottie/build_habits.json', fit: BoxFit.contain),
      ),
      PageViewModel(
        title: 'Track Your Progress',
        body: 'Visualize streaks and trends with clear charts.',
        image: Lottie.asset('assets/lottie/track_progress.json', fit: BoxFit.contain),
      ),
      PageViewModel(
        title: 'Stay Consistent',
        body: 'Smart reminders keep you on track every day.',
        image: Lottie.asset('assets/lottie/stay_consistent.json', fit: BoxFit.contain),
      ),
      PageViewModel(
        title: 'Achieve Your Goals',
        body: 'Turn daily actions into meaningful outcomes.',
        image: Lottie.asset('assets/lottie/achieve_goals.json', fit: BoxFit.contain),
      ),
    ];

    return IntroductionScreen(
      globalBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      pages: pages,
      showSkipButton: true,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: _onDone,
      onSkip: _onDone,
      dotsDecorator: DotsDecorator(
        activeColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}


