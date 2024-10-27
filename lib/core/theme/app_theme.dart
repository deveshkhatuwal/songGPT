import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryBackgroundLight,
    scaffoldBackgroundColor: AppColors.primaryBackgroundLight,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.textColorLight,
        fontFamily: AppFonts.primaryFont,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: AppColors.primaryBackgroundLight,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.buttonBackgroundLight,
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryBackgroundLight,
      secondary: AppColors.accentColor,
      surface: AppColors.secondaryBackgroundLight,
      error: Colors.red,
      onPrimary: AppColors.textColorLight,
      onSecondary: AppColors.textColorLight,
      onSurface: AppColors.textColorLight,
      onError: Colors.white,
      brightness: Brightness.light,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primaryBackgroundDark,
    scaffoldBackgroundColor: AppColors.primaryBackgroundDark,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.textColorDark,
        fontFamily: AppFonts.primaryFont,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: AppColors.primaryBackgroundDark,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.buttonBackgroundDark,
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryBackgroundDark,
      secondary: AppColors.accentColor,
      surface: AppColors.secondaryBackgroundDark,
      error: Colors.red,
      onPrimary: AppColors.textColorDark,
      onSecondary: AppColors.textColorDark,
      onSurface: AppColors.textColorDark,
      onError: Colors.white,
      brightness: Brightness.dark,
    ),
  );
}