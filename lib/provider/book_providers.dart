import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bookapps/models/book.dart';

class BookProvider with ChangeNotifier {
  List<Book> _books = [
    Book(
        "Book 1",
        "Author 1",
        "Description 1",
        "https://cdn.gramedia.com/uploads/items/9781473692435-the_book_of_two_ways.jpg",
        "kategori1"),
    Book(
        "Book 2",
        "Author 2",
        "Description 2",
        "https://cdn.gramedia.com/uploads/items/9781473692435-the_book_of_two_ways.jpg",
        "kategori2"),
    Book(
        "Book 3",
        "Author 3",
        "Description 3",
        "https://cdn.gramedia.com/uploads/items/9781473692435-the_book_of_two_ways.jpg",
        "kategori3"),
    Book(
        "Book 4",
        "Author 4",
        "Description 4",
        "https://cdn.gramedia.com/uploads/items/9781473692435-the_book_of_two_ways.jpg",
        "kategori3"),
    Book(
        "Book 5",
        "Author 5",
        "Description 5",
        "https://cdn.gramedia.com/uploads/items/9781473692435-the_book_of_two_ways.jpg",
        "kategori5"),
  ];

  List<Book> get books => _books;

  void addBook(Book book) {
    _books.add(book);
    notifyListeners();
  }
}
