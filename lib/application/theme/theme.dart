import 'package:flutter/material.dart';

ThemeData createThemeData(BuildContext context) {
  final ColorScheme colorScheme = _createColorScheme(isDark: false);
  final TextTheme textTheme = _createTextTheme(context, colorScheme);
  return ThemeData.from(
    colorScheme: colorScheme,
    textTheme: textTheme,
    useMaterial3: true,
  );
}

ThemeData createDarkThemeData(BuildContext context) {
  final ColorScheme colorScheme = _createColorScheme(isDark: true);
  final TextTheme textTheme = _createTextTheme(context, colorScheme);
  return ThemeData.from(
    colorScheme: colorScheme,
    textTheme: textTheme,
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

TextTheme _createTextTheme(BuildContext context, ColorScheme colorScheme) {
  final ThemeData baseThemeData = Theme.of(context);
  final TextTheme baseTextTheme = baseThemeData.textTheme;
  return TextTheme(
    displayLarge: _convertColor(baseTextTheme.displayLarge, colorScheme),
    displayMedium: _convertColor(baseTextTheme.displayMedium, colorScheme),
    displaySmall: _convertColor(baseTextTheme.displaySmall, colorScheme),
    headlineLarge: _convertColor(baseTextTheme.headlineLarge, colorScheme),
    headlineMedium: _convertColor(baseTextTheme.headlineMedium, colorScheme),
    headlineSmall: _convertColor(baseTextTheme.headlineSmall, colorScheme),
    titleLarge: _convertColor(baseTextTheme.titleLarge, colorScheme),
    titleMedium: _convertColor(baseTextTheme.titleMedium, colorScheme),
    titleSmall: _convertColor(baseTextTheme.titleSmall, colorScheme),
    bodyLarge: _convertColor(baseTextTheme.bodyLarge, colorScheme),
    bodyMedium: _convertColor(baseTextTheme.bodyMedium, colorScheme),
    bodySmall: _convertColor(baseTextTheme.bodySmall, colorScheme),
    labelLarge: _convertColor(baseTextTheme.labelLarge, colorScheme),
    labelMedium: _convertColor(baseTextTheme.labelMedium, colorScheme),
    labelSmall: _convertColor(baseTextTheme.labelSmall, colorScheme),
  );
}

// ダークテーマ対応
TextStyle? _convertColor(TextStyle? textStyle, ColorScheme colorScheme) {
  if (textStyle == null) {
    return null;
  }
  final Color color = colorScheme.onSurface;
  return textStyle.copyWith(color: color);
}

const Color _seedColor = Color(0xFF2979FF);
