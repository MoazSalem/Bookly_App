import 'package:bookly/features/home/data/models/book_model/BookModel.dart';
import 'package:flutter/material.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/constants.dart';

class BestSellerItem extends StatelessWidget {
  final BookModel book;
  const BestSellerItem({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/book_details'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSidePadding, vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 110,
              child: AspectRatio(
                aspectRatio: 0.6,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    image: DecorationImage(
                      image: NetworkImage(book.volumeInfo!.imageLinks?.thumbnail ?? ""),
                      fit: BoxFit.fill,
                    ),
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
                  Text(
                    book.volumeInfo!.authors![0],
                    style: Styles.titleSmall14.copyWith(color: Colors.grey, fontFamily: ""),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Free",
                            style: Styles.titleMedium18.copyWith(fontWeight: FontWeight.w500)),
                        book.volumeInfo!.averageRating == null ? const Text("Not Rated") : Row(
                          children: [
                            const Icon(
                              Icons.star_rate_rounded,
                              color: Color(0xffffdd4f),
                              size: 22,
                            ),
                            Text("${book.volumeInfo!.averageRating}", style: Styles.titleSmall16),
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
