import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import '../models/book_model/BookModel.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
}
