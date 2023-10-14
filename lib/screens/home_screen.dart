import 'package:bookapps/provider/navigation_provider.dart';
import 'package:bookapps/screens/book_detail.dart';
import 'package:bookapps/screens/home_content.dart';
import 'package:bookapps/screens/my_books.dart';
import 'package:bookapps/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookapps/provider/book_providers.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigation_provider = Provider.of<NavigationProvider>(context);
    return Scaffold(
      body: IndexedStack(
        index: navigation_provider.currentIndex,
        children: [
          HomeContent(),
          MyBooksScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigation_provider.currentIndex,
        onTap: (index) {
          Provider.of<NavigationProvider>(context, listen: false)
              .setIndexnya(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
