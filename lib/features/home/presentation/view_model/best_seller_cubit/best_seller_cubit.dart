import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

import '../../../data/models/book_model/BookModel.dart';

part 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit(this._homeRepo) : super(BestSellerInitial());

  final HomeRepo _homeRepo;

  Future<void> fetchBestSellerBooks() async {
    emit(BestSellerLoading());
    final result = await _homeRepo.fetchBestSellerBooks();
    result.fold(
      (failure) => emit(BestSellerFailure(failure.message)),
      (books) => emit(BestSellerSuccess(books)),
    );
  }
}
