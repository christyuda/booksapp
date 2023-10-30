import 'package:bookapps/models/book.dart';
import 'package:bookapps/services/base_url.dart';
import 'package:bookapps/services/best_seller_api.dart';
import 'package:bookapps/services/genres_api.dart';
import 'package:bookapps/services/recently_viewed_api.dart';
import 'package:bookapps/services/top_picks_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class BookProvider with ChangeNotifier {
  final Dio dio = Dio();

  List<Book> topPicksArr = [];
  List<Book> bestArr = [];
  List<Book> genresArr = [];
  List<Book> recentArr = [];

  Future<void> fetchBooks() async {
    try {
      final urlbase =
          'https://bukukitabe-8ece94dbd6dd.herokuapp.com/api/randombooks';
      ;
      // Fetch Top Picks Books
      topPicksArr = await TopPicksApi().fetchTopPicks(urlbase);
      // Fetch Best Books
      bestArr = await BestSellerApi().fetchBestsellers(urlbase);
      // ambil data genres
      genresArr = await GenresApi().fetchGenres(urlbase);
      // ini untuk mengambil data recently
      recentArr = await RecentlyApi().fetchRecentlyViewed(urlbase);

      notifyListeners();
    } catch (error) {
      throw Exception('Failed to fetch books: $error');
    }
  }

  List<Book> savedBooks = [];
  void addToReadingList(Book book) {
    savedBooks.add(book);
    notifyListeners();
  }

  void removeBook(int index) {
    savedBooks.removeAt(index);
    notifyListeners();
  }
}
