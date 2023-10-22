import 'package:bookapps/provider/navigation_provider.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget buildBottomNavigationBar(BuildContext context) {
  final navigation_provider = Provider.of<NavigationProvider>(context);

  return FlashyTabBar(
    animationCurve: Curves.linear,
    selectedIndex: navigation_provider.currentIndex,
    iconSize: 30,
    showElevation: false,
    onItemSelected: (index) {
      Provider.of<NavigationProvider>(context, listen: false)
          .setIndexnya(index);
    },
    items: [
      FlashyTabBarItem(
        icon: Icon(Icons.home),
        title: Text('Home'),
      ),
      FlashyTabBarItem(
        icon: Icon(Icons.book),
        title: Text('Books'),
      ),
      FlashyTabBarItem(
        icon: Icon(Icons.person),
        title: Text('Profile'),
      ),
    ],
  );
}
