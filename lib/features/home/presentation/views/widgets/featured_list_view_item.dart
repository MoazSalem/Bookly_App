import 'package:blur/blur.dart';
import 'package:bookly/features/constants.dart';
import 'package:flutter/material.dart';

class FeaturedListViewItem extends StatelessWidget {
  final int index;
  const FeaturedListViewItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/book_details'),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: index == 0 ? 0 : 12.0),
            child: AspectRatio(
              aspectRatio: 0.65,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://books.google.com/books/content?id=G6lHXQWOx6sC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: index == 0 ? 8 : 18),
            child: const CircleAvatar(
              backgroundColor: Colors.white12,
              radius: 23,
              child: Icon(Icons.play_arrow, color: Colors.white, size: 16),
            ).frosted(
                blur: 3.0,
                frostColor: kPrimaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(kBorderRadius)),
          )
        ],
      ),
    );
  }
}