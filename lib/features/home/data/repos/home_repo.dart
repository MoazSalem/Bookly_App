import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly/core/models/book_model/book_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
}
