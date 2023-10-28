// class Book {
//   final String name;
//   final String author;
//   final String img;
//   final double rating;
//   final String description;
//   Book({
//     required this.name,
//     required this.author,
//     required this.img,
//     required this.rating,
//     required this.description,
//   });
// }
class Book {
  final String id;
  final String title;
  final List<String> authors;
  final String publisher;
  final String publishedDate;
  final String description;
  final String smallThumbnail;
  final String thumbnail;
  final String previewLink;
  final List<String> categories;
  final double averageRating; // Berikut ini adalah double

  Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.publisher,
    required this.publishedDate,
    required this.description,
    required this.smallThumbnail,
    required this.thumbnail,
    required this.previewLink,
    required this.categories,
    required this.averageRating,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    // Parsing data dari JSON ke dalam model Book
    return Book(
      id: json['id'],
      title: json['title'],
      authors: List<String>.from(json['authors']),
      publisher: json['publisher'],
      publishedDate: json['publishedDate'],
      description: json['description'],
      smallThumbnail: json['smallThumbnail'],
      thumbnail: json['thumbnail'],
      previewLink: json['previewLink'],
      categories: List<String>.from(json['categories']),
      averageRating: double.tryParse(json['averageRating'].toString()) ?? 0.0,
    );
  }
}
