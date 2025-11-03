import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'core/theme/app_theme.dart';
import 'core/theme/theme_manager.dart';
import 'core/routing/app_router.dart';
import 'core/routing/route_names.dart';

final ThemeManager themeManager = ThemeManager();

Future<void> main() async {
  // Entry point for FocusFlow.
  WidgetsFlutterBinding.ensureInitialized();
  await themeManager.loadThemePreference();
  runApp(const FocusFlowApp());
}

/// Root widget for FocusFlow.
///
/// - Wraps the app with MultiBlocProvider (empty for now)
/// - Applies centralized theming via AppTheme
/// - Uses an initial route for onboarding
class FocusFlowApp extends StatelessWidget {
  const FocusFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Prepare BLoC providers. Keep empty until real BLoCs are added.
    final List<BlocProvider<dynamic>> providers = [];

    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeManager.themeMode,
      builder: (context, mode, _) {
        final app = MaterialApp.router(
          title: 'FocusFlow',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: mode,
          routerConfig: AppRouter.router(),
        );

        // Only wrap with MultiBlocProvider when providers are present.
        return providers.isEmpty
            ? app
            : MultiBlocProvider(providers: providers, child: app);
      },
    );
  }
}

/// Minimal placeholder for the onboarding flow.
/// Replace with a full onboarding using the `introduction_screen` package.
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Onboarding'),
        actions: [
          IconButton(
            onPressed: () => themeManager.toggleTheme(),
            icon: const Icon(Icons.brightness_6),
            tooltip: 'Toggle theme',
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to Home using GoRouter
            context.go(RouteNames.home);
          },
          child: const Text('Get Started'),
        ),
      ),
    );
  }
}
