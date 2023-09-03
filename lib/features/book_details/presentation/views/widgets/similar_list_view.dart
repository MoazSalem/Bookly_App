import 'package:flutter/material.dart';
import 'package:bookly/features/constants.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_list_view_item.dart';

class SimilarListView extends StatelessWidget {
  const SimilarListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: kSidePadding),
          itemBuilder: (context, index) {
            return const SizedBox(
                height: 140,
                child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: FeaturedListViewItem(
                    index: 0,
                    playButton: false,
                    imageUrl:
                        "https://books.google.com/books/content?id=G6lHXQWOx6sC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
                  ),
                ));
          }),
    );
  }
}
