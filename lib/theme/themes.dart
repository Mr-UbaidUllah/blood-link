import 'package:flutter/material.dart';

//Light Theme
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: Color(0xFFE53935),      // Bright Blood Red
    secondary: Color(0xFFFF6F61),    // Soft Coral
    surface: Color(0xFFFFFFFF),      // white
    onPrimary: Color(0xFF1C1C1C),         // Text/Icon on Primary
    onSecondary: Colors.white,       // Text/Icon on Secondary
    onSurface: Color(0xFF4B5563),    // Muted Gray Text
    tertiary: Color(0xFF2E7D32),     // Green for success/health
  ),
);

   //Dark Theme
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFFFF5252),      // Vivid Blood Red
    secondary: Color(0xFFFF8A65),    // Warm Coral
    surface: Color(0xFF121212),
    // onPrimary: Colors.white,         // Text/Icon on Primary
    onSecondary: Colors.white,       // Text/Icon on Secondary
    onSurface: Color(0xFF9CA3AF),    // Muted Gray Text
    tertiary: Color(0xFF66BB6A),     // Light Green for health cues
  ),
);
