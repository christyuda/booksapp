import 'dart:math';
import 'package:bookapps/constant/color_constant.dart';
import 'package:bookapps/provider/book_providers.dart';
import 'package:bookapps/widgets/Book/bestselers_cell.dart';
import 'package:bookapps/widgets/Book/genres_cell.dart';
import 'package:bookapps/widgets/Book/recently_cell.dart';
import 'package:bookapps/widgets/Book/top_cell.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final bookProvider = Provider.of<BookProvider>(context, listen: false);
    await bookProvider.fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.bg,
      body: SingleChildScrollView(
        child: Consumer<BookProvider>(
          builder: (context, bookProvider, child) {
            final media = MediaQuery.of(context).size;
            return Column(
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
                            borderRadius:
                                BorderRadius.circular(media.width * 0.8),
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
                          leading: null,
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
                        ),
                        SizedBox(
                          width: media.width,
                          height: media.width * 0.8,
                          child: CarouselSlider.builder(
                            itemCount: bookProvider.topPicksArr.length,
                            itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) {
                              if (itemIndex >= 0 &&
                                  itemIndex < bookProvider.topPicksArr.length) {
                                return TopPicksCell(index: itemIndex);
                              } else {
                                return CircularProgressIndicator();
                              }
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
                              return GestureDetector(
                                onTap: () {},
                                child: BestSellerCell(index: index),
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
                                  color: TColor.judulBesar,
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
                            itemCount: min(5, bookProvider.genresArr.length),
                            itemBuilder: (context, index) {
                              return GenresCell(
                                  index: index,
                                  bgcolor: index % 2 == 0
                                      ? Colors.red
                                      : Colors.green);
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
                                  color: TColor.judulBesar,
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
                            itemCount: min(5, bookProvider.recentArr.length),
                            itemBuilder: (context, index) {
                              return RecentlyCell(index: index);
                            },
                          ),
                        ),
                        SizedBox(
                          height: media.width * 0.1,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
