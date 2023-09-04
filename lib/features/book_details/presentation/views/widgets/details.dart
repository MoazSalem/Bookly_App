import 'package:bookly/features/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/models/book_model/BookModel.dart';
import 'double_buttons.dart';

class Details extends StatelessWidget {
  final BookModel book;
  const Details({Key? key, required this.book}) : super(key: key);

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
                imageUrl: book.volumeInfo?.imageLinks?.thumbnail ?? "https://raw.githubusercontent.com/julien-gargot/images-placeholder/master/placeholder-portrait.png",
                placeholder: (context, url) => const Center(
                    child: SizedBox(height: 100, width: 100, child: CircularProgressIndicator())),
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
              book.volumeInfo?.title ?? "No Title",
              style: Styles.titleLarge30,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Text(
          book.volumeInfo?.authors?[0] ?? "No Author",
          style: Styles.titleMedium18
              .copyWith(color: Colors.grey, fontFamily: "", fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        book.volumeInfo?.averageRating == null
            ? const Text("Not Rated Yet", style: Styles.titleMedium18)
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star_rate_rounded,
                    color: Color(0xffffdd4f),
                    size: 26.0,
                  ),
                  Text("${book.volumeInfo!.averageRating!}", style: Styles.titleMedium18),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${book.volumeInfo!.ratingsCount!}",
                    style: Styles.titleSmall16
                        .copyWith(color: Colors.grey, fontWeight: FontWeight.w500),
                  )
                ],
              ),
        DoubleButtons(previewUrl: book.volumeInfo?.previewLink ?? ""),
      ],
    );
  }
}
