import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import '../models/book_model/BookModel.dart';

abstract class HomeRepo {
  Either<Failure, List<BookModel>> fetchBestSellerBooks();
  Either<Failure, List<BookModel>> fetchFeaturedBooks();
}
