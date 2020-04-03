import 'package:flutter/material.dart';

class PageSliderController {
  final PageController pageController;

  PageSliderController({
    int initialPage = 0,
  }) : pageController = PageController(initialPage: initialPage);

  void next() {
    animateTo(pageController.page.toInt() + 1);
  }

  void animateTo(int position) {
    pageController.animateToPage(
      position,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
