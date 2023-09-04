import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/models/book_model/BookModel.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() async {
    try {
      List<BookModel> books = [];
      books = await apiService.getBooks(
          query: 'inauthor:Rowling', filtering: 'free-ebooks', sorting: 'relevance');
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
      books = await apiService.getBooks(
          query: 'subject:programming', filtering: 'free-ebooks', sorting: 'relevance');
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure('Something went wrong, ${e.toString()}}'));
    }
  }
}
