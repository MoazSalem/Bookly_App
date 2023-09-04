import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FeaturedListViewItemLoading extends StatelessWidget {
  const FeaturedListViewItemLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.65,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child:  Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.white,
          child: Container(
            height: 192,
            width: 128,
            color: Colors.white24,
          ),
        ),
      ),
    );
  }
}
