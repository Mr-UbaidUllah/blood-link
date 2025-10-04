import 'package:blood_link/core/base_provider.dart';
import 'package:blood_link/utils/app_themes.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends BaseProvider {
  ThemeData _themeData = AppThemes.lightTheme;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == AppThemes.darkTheme;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == AppThemes.lightTheme) {
      _themeData = AppThemes.darkTheme;
    } else {
      _themeData = AppThemes.lightTheme;
    }
    notifyListeners();
  }
}
