import 'package:bookapps/models/book.dart';
import 'package:bookapps/provider/book_providers.dart';
import 'package:bookapps/screens/my_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('MyBooksScreen widget test', (WidgetTester tester) async {
    // Create a BookProvider and add some saved books for testing.
    final bookProvider = BookProvider();
    bookProvider.savedBooks = [
      Book(
        title: 'Book Title 1',
        authors: ['Author 1'],
        thumbnail: 'image_url_1',
        averageRating: 4.5,
        id: '',
        publisher: '',
        publishedDate: '',
        description: '',
        smallThumbnail: '',
        previewLink: '',
        categories: [],
      ),
    ];

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => bookProvider),
        ],
        child: MaterialApp(
          home: MyBooksScreen(),
        ),
      ),
    );

    // Verify that the MyBooksScreen widget is displayed.
    expect(find.text('Koleksi Buku'), findsOneWidget);

    // Verify that the saved books are displayed on the screen.
    expect(find.text('Book Title 1'), findsOneWidget);

    // You can add more specific test cases for interactions and widget properties.

    // Clean up the mock HttpClient.
  });
}
