import 'package:bookapps/models/book.dart';
import 'package:flutter/material.dart';

class BookDetailScreen extends StatelessWidget {
  final Book? book;
  BookDetailScreen({this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Buku"),
      ),
      body: Center(
        child: Text("Halaman Detail Buku"),
      ),
    );
  }
}
