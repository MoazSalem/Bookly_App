import 'package:flutter/material.dart';
import 'package:bookly/features/constants.dart';
import 'package:shimmer/shimmer.dart';

class BestSellerItemLoading extends StatelessWidget {
  const BestSellerItemLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSidePadding, vertical: 6),
      child: Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 110,
                child: AspectRatio(
                  aspectRatio: 0.65,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: 128,
                        height: 192,
                        color: Colors.white24,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .6,
                      child: Container(
                        height: 14,
                        color: Colors.white24,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 100,
                      height: 14,
                      color: Colors.white24,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .6,
                      child: Container(
                        height: 14,
                        color: Colors.white24,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
