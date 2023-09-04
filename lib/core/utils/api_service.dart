import 'package:dio/dio.dart';
import 'package:bookly/core/models/book_model/book_model.dart';

class ApiService {
  final _baseUrl = 'https://www.googleapis.com/books/v1';
  final Dio _dio;

  ApiService(this._dio);

  Future<List<BookModel>> getBooks(
      {required String query,
      int maxResults = 40,
      String sorting = 'relevance'}) async {
    List<BookModel> books = [];
    final response = await _dio.get('$_baseUrl/volumes', queryParameters: {
      'q': query,
      'Sorting': sorting,
      'Pagination': "maxResults=$maxResults",
    });
    response.data['items'] != null
        ? response.data['items'].forEach((book) {
            books.add(BookModel.fromJson(book));
          })
        : books = [];
    return books;
  }
}
