import 'package:bookapps/models/book.dart';
import 'package:flutter/material.dart';

class BookProvider extends ChangeNotifier {
  List<Book> savedBooks = [];
  void addToReadingList(Book book) {
    savedBooks.add(book);
    notifyListeners();
  }

  List<Book> topPicksArr = [
    Book(
      name: "The Dissapearance of Emila Zola",
      author: "Michael Rosen",
      img: "assets/img/1.jpg",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,",
      rating: 4.0,
    ),
    Book(
      name: "Fatherhood",
      author: "Michael Rosen",
      img: "assets/img/2.jpg",
      description: "buku ini menceritakan tentang bla bla",
      rating: 4.0,
    ),
    Book(
      name: "The Time Travellers Handbook",
      author: "Stride Lottie",
      img: "assets/img/3.jpg",
      description: "buku ini menceritakan tentang bla bla",
      rating: 4.0,
    ),
  ];

  List<Book> bestArr = [
    Book(
      name: "Fatherhood",
      author: "by Christopher Wilson",
      img: "assets/img/4.jpg",
      rating: 4.0,
      description: "buku ini menceritakan tentang bla bla",
    ),
    Book(
      name: "Fatherhood",
      author: "by Christopher Wilson",
      img: "assets/img/4.jpg",
      description: "buku ini menceritakan tentang bla bla",
      rating: 4.0,
    ),
    Book(
      name: "Fatherhood",
      author: "by Christopher Wilson",
      img: "assets/img/4.jpg",
      description: "buku ini menceritakan tentang bla bla",
      rating: 4.0,
    ),
    Book(
      name: "Fatherhood",
      author: "by Christopher Wilson",
      img: "assets/img/4.jpg",
      description: "buku ini menceritakan tentang bla bla",
      rating: 4.0,
    ),
    Book(
      name: "Fatherhood",
      author: "by Christopher Wilson",
      img: "assets/img/4.jpg",
      description: "buku ini menceritakan tentang bla bla",
      rating: 4.0,
    ),
  ];

  List<Book> genresArr = [
    Book(
      name: "Graphic Novels",
      img: "assets/img/g1.png",
      author: 'by Jake Arnott',
      description: "buku ini menceritakan tentang bla bla",
      rating: 4.0,
    ),
    Book(
      name: "Graphic Novels",
      img: "assets/img/g1.png",
      author: 'by Jake Arnott',
      description: "buku ini menceritakan tentang bla bla",
      rating: 4.0,
    ),
  ];

  List<Book> recentArr = [
    Book(
      name: "The Fatal Tree",
      author: "by Jake Arnott",
      img: "assets/img/10.jpg",
      description: "buku ini menceritakan tentang bla bla",
      rating: 4.0,
    ),
    Book(
      name: "The Fatal Tree",
      author: "by Jake Arnott",
      img: "assets/img/11.jpg",
      description: "buku ini menceritakan tentang bla bla",
      rating: 4.0,
    ),
    Book(
      name: "The Fatal Tree",
      author: "by Jake Arnott",
      img: "assets/img/12.jpg",
      description: "buku ini menceritakan tentang bla bla",
      rating: 4.0,
    ),
  ];
}
