import 'package:shared_preferences/shared_preferences.dart';

/// OnboardingManager handles first-launch checks and persistence.
class OnboardingManager {
  static const String _keyHasCompletedOnboarding = 'has_completed_onboarding';

  /// Returns true if the app is launched for the first time (onboarding not completed).
  Future<bool> isFirstLaunch() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return !(prefs.getBool(_keyHasCompletedOnboarding) ?? false);
  }

  /// Saves that onboarding has been completed.
  Future<void> setCompleted() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyHasCompletedOnboarding, true);
  }

  // Convenience API expected by callers
  Future<bool> checkFirstLaunch() => isFirstLaunch();

  Future<void> completeOnboarding() => setCompleted();
}


