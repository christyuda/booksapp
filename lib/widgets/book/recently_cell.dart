import 'package:bookapps/constant/color_constant.dart';
import 'package:bookapps/models/book.dart';
import 'package:bookapps/screens/book_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookapps/provider/book_providers.dart';

class RecentlyCell extends StatelessWidget {
  final int index;

  RecentlyCell({required this.index});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Consumer<BookProvider>(
      builder: (context, bookProvider, child) {
        if (index < bookProvider.recentArr.length) {
          final book = bookProvider.recentArr[index];
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
                      child: CachedNetworkImage(
                        imageUrl: book.thumbnail,
                        width: media.width * 0.32,
                        height: media.height * 0.22,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
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
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: TColor.text,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    book.authors.toString(),
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
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
