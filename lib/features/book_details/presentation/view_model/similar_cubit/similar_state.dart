part of 'similar_cubit.dart';

@immutable
abstract class SimilarState {}

class SimilarInitial extends SimilarState {}

class SimilarLoading extends SimilarState {}

class SimilarFailure extends SimilarState {
  final String message;

  SimilarFailure(this.message);
}

class SimilarSuccess extends SimilarState {
  final List<BookModel> books;

  SimilarSuccess(this.books);
}
