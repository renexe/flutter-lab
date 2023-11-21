import 'package:flutter/material.dart';

const Color yellow = Color.fromARGB(255, 252, 213, 53);
const Color blue = Color.fromARGB(255, 0, 0, 238);
const Color white = Color.fromARGB(255, 255, 242, 190);
const Color black = Color.fromARGB(255, 11, 14, 17);
const Color red = Color.fromARGB(255, 208, 0, 0);

var colorScheme = ColorScheme.fromSeed(
  seedColor: yellow,
  primary: yellow,
  onPrimary: black,
  secondary: blue,
  onSecondary: white,
  brightness: Brightness.light,
  background: white,
  onBackground: black,
  surface: yellow,
  onSurface: black,
  error: red,
  onError: white,
);

class MainTheme {
  ThemeData mainTheme = ThemeData().copyWith(
    useMaterial3: true,
    colorScheme: colorScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
    ),
    textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.normal,
            color: colorScheme.onBackground,
          ),
        ),
    scaffoldBackgroundColor: colorScheme.background,
    cardTheme: const CardTheme().copyWith(
      color: colorScheme.surface,
      elevation: 2,
      margin: const EdgeInsets.all(8),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData().copyWith(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
    ),
    bottomSheetTheme: const BottomSheetThemeData().copyWith(
      backgroundColor: colorScheme.background,
    ),
    datePickerTheme: const DatePickerThemeData().copyWith(
      backgroundColor: colorScheme.surface,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surface,
      ),
    ),
  );

  ThemeData get theme => mainTheme;
}
