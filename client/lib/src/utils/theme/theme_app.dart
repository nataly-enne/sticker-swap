import 'package:flutter/material.dart';

class ThemeApp{

  static ThemeData get themeData{
    return ThemeData(
    colorScheme: colorScheme,
    elevatedButtonTheme: elevatedButtonThemeData(colorScheme),
    outlinedButtonTheme: outlinedButtonThemeData(colorScheme),
    primaryColor: colorScheme.primary,
    brightness: Brightness.light,
    inputDecorationTheme: inputDecorationTheme(colorScheme),
    floatingActionButtonTheme: floatingActionButtonThemeData(colorScheme),
  );
  }


  static ColorScheme colorScheme = const ColorScheme.light(
    primary: Color(0xff9A1032),
    primaryContainer: Color(0xff757AA3),
    onPrimary: Colors.white,
    secondary: Color(0xffcbe2e5),
    secondaryContainer:Color(0xffcbe2e5),
    onSecondary: Colors.white,
    background: Colors.white,
    onBackground: Colors.black87,
    surface: Colors.white,
    error: Colors.red,
    onError: Colors.white,
  );

  static ElevatedButtonThemeData elevatedButtonThemeData(ColorScheme colorScheme) =>
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            disabledForegroundColor: colorScheme.primaryContainer,
            foregroundColor: colorScheme.onPrimary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.fromLTRB(3, 2, 3, 2),
            minimumSize: const Size(double.infinity, 36.0),
          ).copyWith(
              foregroundColor: MaterialStateProperty.resolveWith((states) {
                return states.contains(MaterialState.disabled) ?
                colorScheme.onBackground.withOpacity(0.4):
                colorScheme.onPrimary;
              })
          )
      );

  static OutlinedButtonThemeData outlinedButtonThemeData(ColorScheme colorScheme) =>
      OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              foregroundColor: colorScheme.onBackground,
              disabledForegroundColor: colorScheme.onBackground,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.fromLTRB(3, 2, 3, 2),
              minimumSize: const Size(double.infinity, 36.0),
              backgroundColor: colorScheme.background,
              side: BorderSide(width: 1.0, color: colorScheme.secondaryContainer)
          )
      );

  static InputDecorationTheme inputDecorationTheme(ColorScheme colorScheme) {
    return InputDecorationTheme(
      alignLabelWithHint: true,
      hintStyle: TextStyle(color: colorScheme.onBackground.withOpacity(0.6)),
    );
  }

  static FloatingActionButtonThemeData floatingActionButtonThemeData(ColorScheme colorScheme) =>
      FloatingActionButtonThemeData(
          foregroundColor: colorScheme.onSecondary,
          backgroundColor: colorScheme.secondaryContainer
      );

}