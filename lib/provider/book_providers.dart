import 'package:flutter/material.dart';
import 'package:bookapps/models/book.dart';

class BookProvider with ChangeNotifier {
  List<Book> _books = [
    Book("Book 1", "Author 1", "Description 1"),
    Book("Book 2", "Author 2", "Description 2"),
    Book("Book 3", "Author 3", "Description 3"),
  ];

  List<Book> get books => _books;

  void addBook(Book book) {
    _books.add(book);
    notifyListeners();
  }
}
