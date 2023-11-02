import 'package:bookapps/constant/color_constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookapps/provider/book_providers.dart';

class GenresCell extends StatelessWidget {
  final int index;
  final Color bgcolor;

  GenresCell({required this.index, required this.bgcolor});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Consumer<BookProvider>(
      builder: (context, bookProvider, child) {
        if (index < bookProvider.genresArr.length) {
          final book = bookProvider.genresArr[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: bgcolor,
              borderRadius: BorderRadius.circular(15),
            ),
            width: media.width * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: book.thumbnail,
                  width: media.width * 0.7,
                  height: media.width * 0.25,
                  fit: BoxFit.fitWidth,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  book.categories.toString(),
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: TColor.textGenre,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
