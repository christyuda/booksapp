import 'package:bookapps/models/book.dart';
import 'package:flutter/material.dart';

// class BookDetailScreen extends StatelessWidget {
//   final Book? book;
//   BookDetailScreen({this.book});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Detail Buku"),
//       ),
//       body: Center(
//         child: Text("Halaman Detail Buku"),
//       ),
//     );
//   }
// }

class BookDetailScreen extends StatelessWidget {
  final Book? book;

  BookDetailScreen({this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Detail'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              book!.img,
              width: MediaQuery.of(context).size.width,
              height: 300.0,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Text(
              book!.name,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Author: ${book!.author}',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Rating: ${book!.rating}',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Description:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              // Tambahkan deskripsi buku di sini
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer varius justo nec urna volutpat, eu vulputate sapien malesuada. Proin tincidunt eros vitae ultrices. Phasellus eu libero vitae lectus malesuada laoreet non eget neque.',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
