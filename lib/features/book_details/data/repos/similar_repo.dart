import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly/core/models/book_model/BookModel.dart';

abstract class SimilarRepo {
  Future<Either<Failure, List<BookModel>>> fetchBestSimilarBooks({required String category});
}
