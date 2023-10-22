import 'package:bookapps/provider/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget buildBody() {
  return Consumer<MenuProvider>(
    builder: (context, menuProvider, child) {
      switch (menuProvider.selectedMenuItem) {
        case 0:
          return HomeView();
        case 1:
          return OurBooksView();
        // Tambahkan tampilan lain sesuai dengan menu Anda di sini
        default:
          return HomeView();
      }
    },
  );
}

Widget buildDrawer() {
  return Consumer<MenuProvider>(
    builder: (context, menuProvider, child) {
      return Drawer(
        child: ListView.builder(
          itemCount: menuProvider.menuItems.length,
          itemBuilder: (context, index) {
            final menuItem = menuProvider.menuItems[index];
            return ListTile(
              leading: Icon(menuItem['icon']),
              title: Text(menuItem['name']),
              onTap: () {
                menuProvider.setSelectedMenuItem(index);
                Navigator.pop(context); // Tutup drawer setelah memilih menu
              },
            );
          },
        ),
      );
    },
  );
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Home View"),
    );
  }
}

class OurBooksView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Our Books View"),
    );
  }
}
