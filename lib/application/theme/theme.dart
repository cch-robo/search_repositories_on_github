import 'package:flutter/material.dart';

ThemeData createThemeData(BuildContext context) {
  final ColorScheme colorScheme = _createColorScheme(isDark: false);
  return ThemeData.from(
    colorScheme: colorScheme,
    useMaterial3: true,
  );
}

ThemeData createDarkThemeData(BuildContext context) {
  final ColorScheme colorScheme = _createColorScheme(isDark: true);
  return ThemeData.from(
    colorScheme: colorScheme,
    useMaterial3: true,
  );
}

ColorScheme _createColorScheme({required bool isDark}) {
  final ColorScheme colorScheme = ColorScheme.fromSeed(
    brightness: isDark ? Brightness.dark : Brightness.light,
    seedColor: _seedColor,
  );
  return colorScheme;
}

const Color _seedColor = Color(0xFF2979FF);
