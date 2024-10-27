import 'package:flutter/material.dart';

class AppColors {
  //Common Color

  static const Color generatedMusicCard = Color(0xFF7345E5);
  static const Gradient cardGredient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF663CCB),
      Color(0xFF7748EC),
      Color(0xFF987EFB),
    ],
  );
  static const Color backgroundColorLight = Color(0xFFFFFFFF);
  static const Color backgroundColorDark = Color(0xFF2E2E2E);

  // Dark Mode
  static const Color primaryBackgroundDark = Color(0xFF1E1E1E);
  static const Color secondaryBackgroundDark = Color(0xFF2D2D2D);
  static const Color accentColor = Color(0xFF6C63FF);
  static const Color textColorDark = Color(0xFFFFFFFF);
  static const Color textFieldTitleColorDark = Color(0xFF6D6D6D);
  static const Color textFieldBackgroundColorDark = Color(0xFF2E2E2E);
  static const Color buttonBackgroundDark = Color(0xFF6C63FF);
  static const Color buttonTextDark = Color(0xFFFFFFFF);

  // Light Mode
  static const Color primaryBackgroundLight = Color(0xFFFFFFFF);
  static const Color secondaryBackgroundLight = Color(0xFFF8F8F8);
  static const Color textColorLight = Color(0xFF000000);
  static const Color textFieldTitleColorLight = Color(0xFF6D6D6D);
  static const Color textFieldBackgroundColorLight = Color(0xFFF3F4F6);
  static const Color buttonBackgroundLight = Color(0xFF6C63FF);
  static const Color buttonTextLight = Color(0xFFFFFFFF);
}