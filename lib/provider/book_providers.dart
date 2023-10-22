import 'package:bookapps/models/book.dart';
import 'package:flutter/material.dart';

class BookProvider extends ChangeNotifier {
  List<Book> topPicksArr = [
    Book(
      name: "The Dissapearance of Emila Zola",
      author: "Michael Rosen",
      img: "assets/img/1.jpg",
    ),
    Book(
      name: "Fatherhood",
      author: "Michael Rosen",
      img: "assets/img/2.jpg",
    ),
    Book(
        name: "The Time Travellers Handbook",
        author: "Stride Lottie",
        img: "assets/img/3.jpg")
  ];

  List<Book> bestArr = [
    Book(
      name: "Fatherhood",
      author: "by Christopher Wilson",
      img: "assets/img/4.jpg",
      rating: 4.0,
    ),
    Book(
      name: "Fatherhood",
      author: "by Christopher Wilson",
      img: "assets/img/4.jpg",
      rating: 4.0,
    ),
    Book(
      name: "Fatherhood",
      author: "by Christopher Wilson",
      img: "assets/img/4.jpg",
      rating: 4.0,
    ),
    Book(
      name: "Fatherhood",
      author: "by Christopher Wilson",
      img: "assets/img/4.jpg",
      rating: 4.0,
    ),
    Book(
      name: "Fatherhood",
      author: "by Christopher Wilson",
      img: "assets/img/4.jpg",
      rating: 4.0,
    ),
  ];

  List<Book> genresArr = [
    Book(
      name: "Graphic Novels",
      img: "assets/img/g1.png",
      author: 'by Jake Arnott',
    ),
    Book(
      name: "Graphic Novels",
      img: "assets/img/g1.png",
      author: 'by Jake Arnott',
    ),
  ];

  List<Book> recentArr = [
    Book(
      name: "The Fatal Tree",
      author: "by Jake Arnott",
      img: "assets/img/10.jpg",
    ),
    Book(
      name: "The Fatal Tree",
      author: "by Jake Arnott",
      img: "assets/img/11.jpg",
    ),
    Book(
      name: "The Fatal Tree",
      author: "by Jake Arnott",
      img: "assets/img/12.jpg",
    ),
  ];
}
