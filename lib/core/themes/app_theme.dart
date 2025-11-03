import 'package:flutter/material.dart';

/// AppTheme centralizes the application's light and dark ThemeData.
///
/// Extend these with typography, color schemes, and component themes
/// to keep styling consistent across the app.
class AppTheme {
  const AppTheme._();

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
    );
  }
}

