import 'package:flutter/material.dart';
import 'package:bookly/features/constants.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_list_view_item.dart';

class SimilarListView extends StatelessWidget {
  final String bookCategory;
  const SimilarListView({Key? key, required this.bookCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: kSidePadding),
          itemBuilder: (context, index) {
            return SizedBox(
              height: 140,
              // child: Padding(
              //   padding: const EdgeInsets.all(6.0),
              //   child: FeaturedListViewItem(
              //     index: 0,
              //     playButton: false,
              //     book: book,
              //   ),
              // )
            );
          }),
    );
  }
}
