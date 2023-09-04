import 'package:flutter/material.dart';
import 'package:bookly/features/book_details/presentation/views/widgets/book_details_view_body.dart';
import '../../data/screen_arguments.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      body: BookDetailsViewBody(
        book: args.book,
      ),
    );
  }
}
