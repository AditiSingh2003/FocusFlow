import 'package:flutter/material.dart';

/// ThemeConstants stores design tokens and base colors for FocusFlow.
/// Uses Flutter's Material color palette for consistency.
class ThemeConstants {
  ThemeConstants._();

  // Brand colors
  static const MaterialColor primary = Colors.teal;
  static const MaterialColor accent = Colors.amber;

  // Neutrals (use Material greys for backgrounds and text)
  static final Color backgroundLight = Colors.grey.shade50;
  static final Color backgroundDark = Colors.grey.shade900;

  static final Color textPrimaryLight = Colors.grey.shade900;
  static final Color textSecondaryLight = Colors.grey.shade700;

  static final Color textPrimaryDark = Colors.grey.shade100;
  static final Color textSecondaryDark = Colors.grey.shade400;
}


