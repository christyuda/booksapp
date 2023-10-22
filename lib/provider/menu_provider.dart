import 'package:flutter/material.dart';

class MenuProvider with ChangeNotifier {
  int _selectedMenuItem = 0;
  int get selectedMenuItem => _selectedMenuItem;

  List<Map<String, dynamic>> _menuItems = [
    {"name": "Home", "icon": Icons.home},
    {"name": "Our Books", "icon": Icons.book},
    {"name": "Account", "icon": Icons.account_circle},
  ];
  List<Map<String, dynamic>> get menuItems => _menuItems;

  void setSelectedMenuItem(int index) {
    _selectedMenuItem = index;
    notifyListeners();
  }
}
