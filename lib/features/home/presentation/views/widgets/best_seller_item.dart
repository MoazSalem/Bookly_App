import 'package:flutter/material.dart';
import 'package:bookly/core/utils/styles.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 110,
            child: AspectRatio(
              aspectRatio: 0.6,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
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
            padding: const EdgeInsets.only(left: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .6,
                  child: const Text(
                    "Harry Potter and the Philosopher's Stone",
                    style: Styles.titleMedium18,
                  ),
                ),
                Text(
                  "J.K Rowling",
                  style: Styles.titleSmall14.copyWith(color: Colors.grey),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("19.99 \$", style: Styles.titleMedium18),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rate_rounded,
                            color: Colors.amber,
                            size: 22,
                          ),
                          Text("4.8", style: Styles.titleSmall16),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "(2.3k)",
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
    );
  }
}
