import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'route_names.dart';
import 'route_paths.dart';
import '../../presentation/screens/home_screen.dart' as screens; // Home screen exists

/// AppRouter centralizes GoRouter configuration for FocusFlow.
class AppRouter {
  AppRouter._();

  static GoRouter router() {
    return GoRouter(
      initialLocation: RouteNames.onboarding,
      routes: <RouteBase>[
        GoRoute(
          path: RoutePaths.onboarding,
          name: RouteNames.onboarding,
          builder: (context, state) => const _OnboardingPlaceholder(),
        ),
        GoRoute(
          path: RoutePaths.home,
          name: RouteNames.home,
          builder: (context, state) => const screens.HomeScreen(),
        ),
        GoRoute(
          path: RoutePaths.addHabit,
          name: RouteNames.addHabit,
          builder: (context, state) => const _AddHabitPlaceholder(),
        ),
        GoRoute(
          path: '${RoutePaths.habitDetail}/:id',
          name: RouteNames.habitDetail,
          builder: (context, state) {
            final String id = state.pathParameters['id'] ?? '';
            return _HabitDetailPlaceholder(id: id);
          },
        ),
        GoRoute(
          path: RoutePaths.statistics,
          name: RouteNames.statistics,
          builder: (context, state) => const _StatisticsPlaceholder(),
        ),
        GoRoute(
          path: RoutePaths.settings,
          name: RouteNames.settings,
          builder: (context, state) => const _SettingsPlaceholder(),
        ),
      ],
    );
  }
}

// Temporary placeholders for routes until real screens are wired.
class _OnboardingPlaceholder extends StatelessWidget {
  const _OnboardingPlaceholder();
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(child: Text('Onboarding')),
      );
}

class _AddHabitPlaceholder extends StatelessWidget {
  const _AddHabitPlaceholder();
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(child: Text('Add Habit')),
      );
}

class _HabitDetailPlaceholder extends StatelessWidget {
  final String id;
  const _HabitDetailPlaceholder({required this.id});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Habit Detail')),
        body: Center(child: Text('Habit ID: $id')),
      );
}

class _StatisticsPlaceholder extends StatelessWidget {
  const _StatisticsPlaceholder();
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(child: Text('Statistics')),
      );
}

class _SettingsPlaceholder extends StatelessWidget {
  const _SettingsPlaceholder();
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(child: Text('Settings')),
      );
}


