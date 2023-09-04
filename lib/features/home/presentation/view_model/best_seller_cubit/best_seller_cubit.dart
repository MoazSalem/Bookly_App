import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
