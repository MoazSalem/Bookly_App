part of 'best_seller_cubit.dart';

@immutable
abstract class BestSellerState {}

class BestSellerInitial extends BestSellerState {}

class BestSellerLoading extends BestSellerState {}

class BestSellerFailure extends BestSellerState {
  final String message;

  BestSellerFailure(this.message);
}

class BestSellerSuccess extends BestSellerState {
  final List<BookModel> books;

  BestSellerSuccess(this.books);
}
