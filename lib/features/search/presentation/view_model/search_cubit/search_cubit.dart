import 'package:bookly/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/models/book_model/BookModel.dart';
import 'package:bookly/core/utils/api_service.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  Future<void> getBooks({required String query}) async {
    emit(SearchLoading());
    try {
      final books = await getIt.get<ApiService>().getBooks(query: query);
      emit(SearchSuccess(books));
    } catch (e) {
      emit(SearchFailed(e.toString()));
    }
  }
}
