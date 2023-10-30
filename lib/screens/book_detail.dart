import 'package:bookapps/constant/color_constant.dart';
import 'package:bookapps/models/book.dart';
import 'package:bookapps/provider/book_providers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailScreen extends StatelessWidget {
  final Book? book;

  BookDetailScreen({this.book});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
        height: 60,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: media.width * 0.4,
              child: AnimatedButton(
                selectedTextColor: Colors.black,
                transitionType: TransitionType.RIGHT_TOP_ROUNDER,
                animationDuration: Duration(milliseconds: 450),
                text: 'Baca Buku',
                textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                isReverse: true,
                backgroundColor: Colors.orange,
                borderRadius: 20,
                borderWidth: 2,
                borderColor: TColor.primaryLight,
                onPress: () async {
                  final String urllink = book!.previewLink;
                  final Uri urilink = Uri.parse(urllink);

                  try {
                    if (await canLaunchUrl(urilink)) {
                      await launch(urllink.toString());
                    } else {
                      print('Could not launch the URL: $urllink');
                    }
                  } catch (e) {
                    print('Error: $e');
                  }
                },
              ),
            ),
            Container(
              width: media.width * 0.4,
              child: AnimatedButton(
                selectedTextColor: Colors.black,
                transitionType: TransitionType.RIGHT_TOP_ROUNDER,
                animationDuration: Duration(milliseconds: 450),
                text: 'Simpan Buku',
                textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                isReverse: true,
                backgroundColor: Colors.orange,
                borderRadius: 20,
                borderWidth: 2,
                borderColor: TColor.primaryLight,
                onPress: () {
                  QuickAlert.show(
                    // Menampilkan QuickAlert
                    context: context,
                    type: QuickAlertType.success,
                    text: 'Transaction Completed Successfully!',
                  );
                  final bookProvider =
                      Provider.of<BookProvider>(context, listen: false);
                  bookProvider.addToReadingList(book!);
                },
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.blueGrey,
                expandedHeight: media.height * 0.5,
                flexibleSpace: Container(
                  color: Colors.transparent,
                  height: media.height * 0.5,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 25,
                        top: 35,
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.pop(context);
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 62, top: 62),
                          width: media.width * 0.8,
                          height: media.height * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                book!.thumbnail,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: EdgeInsets.only(top: 24, left: 25),
                      child: Text(
                        book!.title,
                        style: GoogleFonts.openSans(
                            fontSize: 27,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 7, left: 25),
                      child: Text(
                        book!.authors.toString(),
                        style: GoogleFonts.openSans(
                            fontSize: 14,
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 7, left: 22),
                      child: Row(
                        children: <Widget>[
                          RatingBar.builder(
                            initialRating: book!.averageRating ?? 1.0,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 15,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => Icon(Icons.star),
                            onRatingUpdate: (rating) {},
                          ),
                          SizedBox(
                            width: 4,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 28,
                      margin: EdgeInsets.only(top: 23, bottom: 36),
                      padding: EdgeInsets.only(left: 25),
                      child: DefaultTabController(
                        length: 2,
                        child: TabBar(
                          labelColor: Colors.white,
                          isScrollable: true,
                          indicatorPadding: EdgeInsets.all(0),
                          unselectedLabelColor: Colors.grey,
                          labelStyle: GoogleFonts.openSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          indicator: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                ),
                              ),
                              color: Colors.deepOrangeAccent),
                          tabs: [
                            Tab(
                              child: Container(
                                margin: EdgeInsets.only(right: 20),
                                child: Text('Description'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25, bottom: 25, right: 25),
                      child: Text(
                        book!.description,
                        style: GoogleFonts.openSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                            letterSpacing: .2,
                            height: 2),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
