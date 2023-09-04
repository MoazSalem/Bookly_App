import 'package:blur/blur.dart';
import 'package:bookly/features/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:bookly/core/models/book_model/BookModel.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../book_details/data/screen_arguments.dart';

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
