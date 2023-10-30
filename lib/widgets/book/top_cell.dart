import 'package:bookapps/constant/color_constant.dart';
import 'package:bookapps/models/book.dart';
import 'package:bookapps/screens/book_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TopPicksCell extends StatelessWidget {
  final Book book;

  TopPicksCell({required this.book});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final String imageUrl = book.thumbnail;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailScreen(book: book),
          ),
        );
      },
      child: SizedBox(
        width: media.width * 0.32,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: media.width * 0.32,
                  height: media.width * 0.50,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              book.title,
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: TColor.text,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              book.authors.toString(),
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: TColor.subTitle,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
