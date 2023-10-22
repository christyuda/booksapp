import 'package:bookapps/provider/navigation_provider.dart';
import 'package:bookapps/screens/book_detail.dart';
import 'package:bookapps/screens/home_content.dart';
import 'package:bookapps/screens/home_page.dart';
import 'package:bookapps/screens/my_books.dart';
import 'package:bookapps/screens/settings.dart';
import 'package:bookapps/widgets/drawer/drawer.dart';
import 'package:bookapps/widgets/navigationBottomBar/nav_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookapps/provider/book_providers.dart';
import 'package:bookapps/widgets/navigationBottomBar/nav_bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigation_provider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      body: IndexedStack(
        index: navigation_provider.currentIndex,
        children: [
          // MainTabView(),
          MainPage(),

          MyBooksScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(context),
      endDrawer: buildDrawer(),
    );
  }
}
