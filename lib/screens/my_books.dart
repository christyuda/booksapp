import 'package:bookapps/constant/color_constant.dart';
import 'package:bookapps/screens/book_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:bookapps/provider/book_providers.dart';
import 'package:bookapps/models/book.dart';

class MyBooksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);
    final media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Koleksi Buku",
          style: TextStyle(color: TColor.judulBesar),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 25, top: 25),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: bookProvider.savedBooks.length,
                itemBuilder: (BuildContext context, int index) {
                  Book savedBook = bookProvider.savedBooks[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookDetailScreen(
                            book: savedBook,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 19, right: 25, left: 25),
                      height: 91,
                      width: media.width * 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      // Ganti warna sesuai kebutuhan
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 80,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    savedBook.thumbnail),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            width: media.width * 0.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        savedBook.title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        savedBook.authors.toString(),
                                        style: TextStyle(
                                          fontSize: 7,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      IgnorePointer(
                                        ignoring: true,
                                        child: RatingBar.builder(
                                          initialRating:
                                              savedBook.averageRating,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 10,
                                          itemPadding:
                                              const EdgeInsets.symmetric(
                                            horizontal: 1.0,
                                          ),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.deepOrange,
                                          ),
                                          onRatingUpdate: (rating) {},
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      bookProvider.removeBook(index);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
