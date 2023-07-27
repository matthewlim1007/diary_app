import 'package:flutter/material.dart';

/// Contains the Diary light and dark theme.
class DiaryTheme {
  const DiaryTheme._();

  /// The Diary Material light theme.
  static ThemeData light() => DiaryTheme._createThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
        secondaryColor: const Color(0xff98d602),
        errorColor: const Color(0xffFF3C2E),
      );

  /// The Diary Material dark theme.
  static ThemeData dark() => DiaryTheme._createThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
        secondaryColor: const Color(0xff98d602),
        errorColor: const Color(0xffFF3C2E),
      );

  static ThemeData _createThemeData({
    required Brightness brightness,
    required Color primaryColor,
    required Color secondaryColor,
    required Color errorColor,
  }) {
    final colorScheme = _createColorScheme(
      brightness: brightness,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      errorColor: errorColor,
    );

    final themeData =
        brightness == Brightness.light ? ThemeData.light() : ThemeData.dark();

    final checkboxTheme = _createCheckboxThemeData(
      primary: const Color(0xff98d602),
    );

    return themeData.copyWith(
      typography: Typography.material2018(),
      primaryColor: primaryColor,
      checkboxTheme: checkboxTheme,
      colorScheme: colorScheme.copyWith(error: errorColor),
    );
  }

  static ColorScheme _createColorScheme({
    required Brightness brightness,
    required Color primaryColor,
    required Color secondaryColor,
    required Color errorColor,
  }) {
    final colorScheme = brightness == Brightness.light
        ? const ColorScheme.light()
        : const ColorScheme.dark();

    return colorScheme.copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
      error: errorColor,
    );
  }

  static CheckboxThemeData _createCheckboxThemeData({
    required Color primary,
  }) {
    return CheckboxThemeData(
      checkColor: MaterialStateProperty.resolveWith((states) {
        return Colors.white;
      }),
      fillColor: MaterialStateProperty.resolveWith((states) {
        return primary;
      }),
    );
  }
}
