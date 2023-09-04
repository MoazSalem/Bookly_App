import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/models/book_model/BookModel.dart';
import 'package:bookly/features/book_details/data/repos/similar_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dio/dio.dart';

class SimilarRepImpl extends SimilarRepo {
  final ApiService apiService;

  SimilarRepImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSimilarBooks({required String category}) async {
    try {
      List<BookModel> books = [];
      books = await apiService.getBooks(
          query: 'subject:$category', filtering: 'free-ebooks', sorting: 'relevance');
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure('Something went wrong, ${e.toString()}}'));
    }
  }
}
