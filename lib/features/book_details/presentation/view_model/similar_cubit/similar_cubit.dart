import 'package:bookly/core/models/book_model/BookModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/similar_repo.dart';

part 'similar_state.dart';

class SimilarCubit extends Cubit<SimilarState> {
  SimilarCubit(this.similarRepo) : super(SimilarInitial());
  final SimilarRepo similarRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarLoading());
    final result = await similarRepo.fetchBestSimilarBooks(category: category);
    result.fold(
      (failure) => emit(SimilarFailure(failure.message)),
      (books) => emit(SimilarSuccess(books)),
    );
  }
}
