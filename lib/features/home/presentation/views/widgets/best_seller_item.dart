import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/constants.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../book_details/data/screen_arguments.dart';

class BestSellerItem extends StatelessWidget {
  final BookModel book;
  const BestSellerItem({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/book_details', arguments: ScreenArguments(book)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSidePadding, vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 110,
              child: AspectRatio(
                aspectRatio: 0.65,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: book.volumeInfo!.imageLinks?.thumbnail ??
                        "https://raw.githubusercontent.com/julien-gargot/images-placeholder/master/placeholder-portrait.png",
                    placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.white,
                        child: Container(
                          width: 128,
                          height: 192,
                          color: Colors.white24,
                        )),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .6,
                    child: Text(
                      book.volumeInfo!.title!,
                      style: Styles.titleMedium20,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .6,
                    child: Text(
                      book.volumeInfo!.authors!.isNotEmpty? book.volumeInfo!.authors!.first : "Unknown Author",
                      style: Styles.titleSmall14.copyWith(color: Colors.grey, fontFamily: ""),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(book.saleInfo?.listPrice != null ? "${book.saleInfo!.listPrice!.amount} ${book.saleInfo!.listPrice!.currencyCode}" : "Free",
                            style: Styles.titleMedium18.copyWith(fontWeight: FontWeight.w500)),
                        book.volumeInfo!.averageRating == null
                            ? const Text("Not Rated")
                            : Row(
                                children: [
                                  const Icon(
                                    Icons.star_rate_rounded,
                                    color: Color(0xffffdd4f),
                                    size: 22,
                                  ),
                                  Text("${book.volumeInfo!.averageRating}",
                                      style: Styles.titleSmall16),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "(${book.volumeInfo!.ratingsCount})",
                                    style: Styles.titleSmall14.copyWith(color: Colors.grey),
                                  )
                                ],
                              )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
