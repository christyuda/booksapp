import 'package:bookapps/constant/color_constant.dart';
import 'package:bookapps/screens/book_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:bookapps/provider/book_providers.dart';

class BestSellerCell extends StatelessWidget {
  final int index;

  BestSellerCell({required this.index});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Consumer<BookProvider>(
      builder: (context, bookProvider, child) {
        final book = bookProvider.bestArr[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookDetailScreen(book: book),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            width: media.width * 0.32,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 5,
                        offset: Offset(0, 2),
                        color: Colors.black,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: book.thumbnail,
                      width: media.width * 0.32,
                      height: media.width * 0.55,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  book.title,
                  maxLines: 3,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: TColor.text,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  book.authors.toString(),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: TColor.subTitle,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 7),
                RatingBar.builder(
                  initialRating: book.averageRating ?? 1.0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 15,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => Icon(Icons.star),
                  onRatingUpdate: (rating) {},
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
