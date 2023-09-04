import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/book_details_view_body.dart';
import '../../data/screen_arguments.dart';
import '../view_model/similar_cubit/similar_cubit.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return BlocProvider(
      create: (context) => SimilarCubit()
        ..fetchSimilarBooks(
            author: args.book.volumeInfo!.authors!.isNotEmpty
                ? args.book.volumeInfo!.authors!.first
                : ""),
      child: Scaffold(
        body: BookDetailsViewBody(
          book: args.book,
        ),
      ),
    );
  }
}
