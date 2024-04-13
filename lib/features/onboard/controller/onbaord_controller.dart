import 'package:flutter/material.dart';

class OnboardingProvider extends ChangeNotifier {
  PageController _pageController = PageController();
  int _currentPageIndex = 0;

  PageController get pageController => _pageController;
  int get currentPageIndex => _currentPageIndex;

  void setCurrentPageIndex(int index) {
    _currentPageIndex = index;
    notifyListeners(); // Notify listeners of the change
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
