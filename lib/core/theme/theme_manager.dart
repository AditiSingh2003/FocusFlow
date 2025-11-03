import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// ThemeManager controls ThemeMode and notifies listeners of changes.
///
/// You can later persist the choice (e.g., SharedPreferences/Isar)
/// and/or expose this via BLoC/Cubit if preferred.
class ThemeManager {
  static const String _prefKey = 'theme_mode';

  /// Holds the current ThemeMode and notifies listeners on change.
  final ValueNotifier<ThemeMode> themeMode = ValueNotifier<ThemeMode>(ThemeMode.system);

  /// Load stored preference (if any). Defaults to ThemeMode.system.
  Future<void> loadThemePreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? stored = prefs.getString(_prefKey);
    switch (stored) {
      case 'light':
        themeMode.value = ThemeMode.light;
        break;
      case 'dark':
        themeMode.value = ThemeMode.dark;
        break;
      case 'system':
      default:
        themeMode.value = ThemeMode.system;
    }
  }

  /// Toggle between light and dark (system remains unchanged if currently set).
  Future<void> toggleTheme() async {
    final ThemeMode next = themeMode.value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    themeMode.value = next;
    await saveThemePreference();
  }

  /// Persist the current theme mode to local storage.
  Future<void> saveThemePreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String value;
    switch (themeMode.value) {
      case ThemeMode.light:
        value = 'light';
        break;
      case ThemeMode.dark:
        value = 'dark';
        break;
      case ThemeMode.system:
        value = 'system';
        break;
    }
    await prefs.setString(_prefKey, value);
  }
}


