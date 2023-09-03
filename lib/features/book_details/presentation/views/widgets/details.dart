import 'package:bookly/features/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:bookly/core/utils/styles.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).width * 0.7,
          width: MediaQuery.sizeOf(context).width * 0.45,
          child: AspectRatio(
            aspectRatio: 0.65,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kBorderRadius),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl:
                    "https://books.google.com/books/content?id=G6lHXQWOx6sC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
                placeholder: (context, url) => const Center(
                    child: SizedBox(height: 100,width: 100, child: CircularProgressIndicator())),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40.0, bottom: 8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .8,
            child: Text(
              "Harry Potter and the Philosopher's Stone",
              style: Styles.titleLarge30,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Text(
          "J.K Rowling",
          style: Styles.titleMedium18
              .copyWith(color: Colors.grey, fontFamily: "", fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star_rate_rounded,
              color: Color(0xffffdd4f),
              size: 26.0,
            ),
            Text("4.8", style: Styles.titleMedium18),
            SizedBox(
              width: 5,
            ),
            Text(
              "(2.3k)",
              style: Styles.titleSmall16.copyWith(color: Colors.grey, fontWeight: FontWeight.w500),
            )
          ],
        )
      ],
    );
  }
}
