import 'package:flutter/material.dart';

class MyBooksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyBooks"),
      ),
      body: Center(
        child: Text("Halaman Buku ku"),
      ),
    );
  }
}
