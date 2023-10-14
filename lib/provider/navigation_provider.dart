import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  int indexCurrent = 0;
  int get currentIndex => indexCurrent;

  void setIndexnya(int index) {
    indexCurrent = index;
    notifyListeners();
  }
}
