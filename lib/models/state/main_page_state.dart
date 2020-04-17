import 'package:flutter/material.dart';

class MainPageState extends ChangeNotifier {
  int tabIndex = 0;

  changeTabIndex(int index) {
    tabIndex = index;
    notifyListeners();
  }
}
