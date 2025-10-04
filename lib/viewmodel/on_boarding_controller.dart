import 'package:blood_link/core/base_provider.dart';
import 'package:blood_link/models/on_boarding_model.dart';
import 'package:flutter/material.dart';

class OnBoardingProvider extends BaseProvider {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final PageController pageController = PageController();

  /// Go to next page
  void nextPage() {
    if (_currentIndex < onBoardingContent.length - 1) {
      _currentIndex++;
      pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    }
  }

  /// Skip to last page
  void skipToEnd() {
    _currentIndex = onBoardingContent.length - 1;
    pageController.jumpToPage(_currentIndex);
    notifyListeners();
  }

  /// Update index on page change
  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
