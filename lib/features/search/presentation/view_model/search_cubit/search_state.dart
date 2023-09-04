part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchFailed extends SearchState {
  final String message;

  SearchFailed(this.message);
}

class SearchSuccess extends SearchState {
  final List<BookModel> books;

  SearchSuccess(this.books);
}
