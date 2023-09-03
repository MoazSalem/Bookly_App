import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/data/models/book_model/BookModel.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() async {
    try {
      List<BookModel> books = [];
      ApiService apiService = ApiService();
      books = await apiService.getBooks(
          query: 'Comics', filtering: 'free-ebooks', sorting: 'relevance');
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure('Something went wrong, ${e.toString()}}'));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      List<BookModel> books = [];
      ApiService apiService = ApiService();
      books = await apiService.getBooks(
          query: 'Science-fiction', filtering: 'free-ebooks', sorting: 'relevance');
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure('Something went wrong, ${e.toString()}}'));
    }
  }
}
