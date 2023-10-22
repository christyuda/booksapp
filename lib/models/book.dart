class Book {
  final String name;
  final String author;
  final String img;
  final double? rating;

  Book({
    required this.name,
    required this.author,
    required this.img,
    this.rating,
  });
}
