import 'package:bookapps/models/book.dart';
import 'package:dio/dio.dart';

class TopPicksApi {
  final Dio dio = Dio();
  Future<List<Book>> fetchTopPicks(String apiUrl) async {
    final response = await dio.get(apiUrl);
    final data = response.data['data'] as List<dynamic>;
    return data.map((item) => Book.fromJson(item)).toList();
  }
}
