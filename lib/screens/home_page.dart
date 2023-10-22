import 'package:bookapps/constant/color_constant.dart';
import 'package:bookapps/provider/book_providers.dart';
import 'package:bookapps/widgets/book/bestselers_cell.dart';
import 'package:bookapps/widgets/book/genres_cell.dart';
import 'package:bookapps/widgets/book/recently_cell.dart';
import 'package:bookapps/widgets/book/top_cell.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);
    final media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.bg,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  child: Transform.scale(
                    scale: 1.5,
                    origin: Offset(0, media.width * 0.8),
                    child: Container(
                      width: media.width,
                      height: media.width,
                      decoration: BoxDecoration(
                        color: TColor.dekorasi,
                        borderRadius: BorderRadius.circular(media.width * 0.8),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      title: Row(
                        children: [
                          Text(
                            "Top Picks Books",
                            style: TextStyle(
                              color: TColor.judulBesar,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                      leading: Container(),
                      leadingWidth: 1,
                      actions: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.menu),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: media.width,
                      height: media.width * 0.8,
                      child: CarouselSlider.builder(
                        itemCount: bookProvider.topPicksArr.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) {
                          final book = bookProvider.topPicksArr[itemIndex];
                          return TopPicksCell(book: book);
                        },
                        options: CarouselOptions(
                          autoPlay: false,
                          aspectRatio: 1,
                          enlargeCenterPage: true,
                          viewportFraction: 0.45,
                          enlargeFactor: 0.4,
                          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            "Bestsellers",
                            style: TextStyle(
                              color: TColor.judulBesar,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.9,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 8),
                        scrollDirection: Axis.horizontal,
                        itemCount: bookProvider.bestArr.length,
                        itemBuilder: (context, index) {
                          final book = bookProvider.bestArr[index];
                          return GestureDetector(
                            onTap: () {},
                            child: BestSellerCell(book: book),
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            "Genres",
                            style: TextStyle(
                              color: TColor
                                  .judulBesar, // Ganti dengan warna yang sesuai
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.6,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 8),
                        scrollDirection: Axis.horizontal,
                        itemCount: bookProvider.genresArr.length,
                        itemBuilder: (context, index) {
                          var book = bookProvider.genresArr[index];
                          return GenresCell(
                              book: book,
                              bgcolor: index % 2 == 0
                                  ? Colors.red
                                  : Colors
                                      .green); // Ganti dengan warna yang sesuai
                        },
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            "Recently Viewed",
                            style: TextStyle(
                              color: TColor
                                  .judulBesar, // Ganti dengan warna yang sesuai
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.7,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 8),
                        scrollDirection: Axis.horizontal,
                        itemCount: bookProvider.recentArr.length,
                        itemBuilder: (context, index) {
                          var book = bookProvider.recentArr[index];
                          return RecentlyCell(book: book);
                        },
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
