import 'package:flutter/material.dart';
import 'package:blood_link/constants/colors.dart';

class AppThemes {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: primaryRed, // Bright Blood Red
      secondary: secondaryCoral, // Soft Coral
      surface: lightSurface, // white
      onPrimary: lightOnPrimary, // Text/Icon on Primary
      onSecondary: fullWhite, // Text/Icon on Secondary
      onSurface: lightOnSurface, // Muted Gray Text
      tertiary: lightGreen, // Green for success/health
    ),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: primaryRedDark, // Vivid Blood Red
      secondary: secondaryCoralDark, // Warm Coral
      surface: darkSurface,
      // onPrimary: fullWhite,         // Text/Icon on Primary
      onSecondary: fullWhite, // Text/Icon on Secondary
      onSurface: darkOnSurface, // Muted Gray Text
      tertiary: darkGreen, // Light Green for health cues
    ),
  );
}
