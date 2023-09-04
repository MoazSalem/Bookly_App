import 'package:dio/dio.dart';
import 'package:bookly/core/models/book_model/BookModel.dart';

class ApiService {
  final _baseUrl = 'https://www.googleapis.com/books/v1';
  final Dio _dio;

  ApiService(this._dio);

  Future<List<BookModel>> getBooks(
      {required String query,
      String filtering = 'free-ebooks',
      String sorting = 'relevance'}) async {
    List<BookModel> books = [];
    final response = await _dio.get('$_baseUrl/volumes', queryParameters: {
      'q': query,
      'Filtering': filtering,
      'Sorting': sorting,
    });
    response.data['items'].forEach((book) {
      books.add(BookModel.fromJson(book));
    });
    return books;
  }
}
