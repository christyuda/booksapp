import 'package:bookapps/constant/color_constant.dart';
import 'package:bookapps/models/book.dart';
import 'package:bookapps/screens/book_detail.dart';
import 'package:flutter/material.dart';

class RecentlyCell extends StatelessWidget {
  final Book book;

  RecentlyCell({required this.book});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
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
        margin: const EdgeInsets.symmetric(horizontal: 15),
        width: media.width * 0.32,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  book.img,
                  width: media.width * 0.32,
                  height: media.height * 0.25,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              book.name,
              maxLines: 3,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: TColor.text,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              book.author,
              maxLines: 1,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: TColor.subTitle,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
