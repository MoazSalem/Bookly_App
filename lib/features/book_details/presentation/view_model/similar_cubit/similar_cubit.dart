import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/service_locator.dart';

part 'similar_state.dart';

class SimilarCubit extends Cubit<SimilarState> {
  SimilarCubit() : super(SimilarInitial());

  Future<void> fetchSimilarBooks({required String author}) async {
    emit(SimilarLoading());
    try {
      final books =
          await getIt.get<ApiService>().getBooks(query: "inauthor:$author", maxResults: 12);
      emit(SimilarSuccess(books));
    } catch (e) {
      emit(SimilarFailure(e.toString()));
    }
  }
}
