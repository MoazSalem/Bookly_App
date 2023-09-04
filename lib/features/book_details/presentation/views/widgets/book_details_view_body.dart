import 'package:flutter/material.dart';
import 'package:bookly/features/constants.dart';
import 'package:bookly/core/models/book_model/BookModel.dart';
import 'package:bookly/core/utils/styles.dart';
import 'app_bar.dart';
import 'details.dart';
import 'similar_list_view.dart';

class BookDetailsViewBody extends StatelessWidget {
  final BookModel book;
  const BookDetailsViewBody({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const AppBarDetails(),
        Details(
          book: book,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: kSidePadding),
          child: Text(
            "You can also like",
            style: Styles.titleSmall16,
          ),
        ),
        SimilarListView(),
        const SizedBox(
          height: 20.0,
        )
      ],
    );
  }
}
