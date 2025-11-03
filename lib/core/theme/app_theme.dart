import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'theme_constants.dart';

/// AppTheme centralizes the application's ThemeData for light and dark modes.
class AppTheme {
  const AppTheme._();

  /// Material 3 compliant light theme using FlexColorScheme
  static ThemeData get lightTheme {
    return FlexThemeData.light(
      useMaterial3: true,
      colors: FlexSchemeColor(
        primary: ThemeConstants.primary,
        primaryContainer: ThemeConstants.primary.shade200,
        secondary: ThemeConstants.accent,
        secondaryContainer: ThemeConstants.accent.shade200,
      ),
      scaffoldBackground: ThemeConstants.backgroundLight,
    );
  }

  /// Material 3 compliant dark theme using FlexColorScheme
  static ThemeData get darkTheme {
    return FlexThemeData.dark(
      useMaterial3: true,
      colors: FlexSchemeColor(
        primary: ThemeConstants.primary.shade200,
        primaryContainer: ThemeConstants.primary.shade700,
        secondary: ThemeConstants.accent.shade200,
        secondaryContainer: ThemeConstants.accent.shade700,
      ),
      scaffoldBackground: ThemeConstants.backgroundDark,
    );
  }
}


