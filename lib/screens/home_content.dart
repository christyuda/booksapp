import 'package:bookapps/provider/book_providers.dart';
import 'package:bookapps/screens/book_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const names = [
  "Harry Potter and the Sorcerer's Stone",
  "To Kill a Mockingbird",
  "The Great Gatsby",
  "1984",
  "Pride and Prejudice",
  "The Catcher in the Rye",
  "The Hobbit",
  "The Lord of the Rings",
  "The Hunger Games",
  "The Da Vinci Code"
];
var category = [
  true,
  false,
  false,
  false,
  false,
];

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Isi dengan konten halaman utama (Home)
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.amber),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home Screen'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Selamat Datang ',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Di Bukuku',
                    style: TextStyle(
                      letterSpacing: 2,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue.withOpacity(.1),
                    ),
                    child: TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.book_online_outlined,
                          color: Colors.blueAccent,
                        ),
                        border: InputBorder.none,
                        hintText: "Ingin Cari Buku Apa...",
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 0, 92, 153),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    height: 30,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              names[index],
                              style: TextStyle(
                                  color: category[index]
                                      ? Colors.orange
                                      : Colors.blue.withOpacity(.4),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                  //stop disini
                ],
              ),
            ),
            Expanded(
              child: Consumer<BookProvider>(
                builder: (context, bookProvider, child) {
                  return ListView.builder(
                    itemCount: bookProvider.books.length,
                    itemBuilder: (context, index) {
                      final book = bookProvider.books[index];
                      return ListTile(
                        title: Text(book.title),
                        subtitle: Text(book.author),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  BookDetailScreen(book: book),
                            ),
                          );
                        },
                      );
                    },
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
