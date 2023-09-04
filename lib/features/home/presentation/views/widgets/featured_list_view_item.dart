import 'package:blur/blur.dart';
import 'package:bookly/features/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:bookly/core/models/book_model/BookModel.dart';
import '../../../../book_details/data/screen_arguments.dart';

class FeaturedListViewItem extends StatelessWidget {
  final BookModel book;
  final int index;
  final bool playButton;
  const FeaturedListViewItem({
    super.key,
    required this.book,
    required this.index,
    this.playButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/book_details', arguments: ScreenArguments(book)),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          AspectRatio(
            aspectRatio: 0.65,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: book.volumeInfo!.imageLinks?.thumbnail ?? "https://raw.githubusercontent.com/julien-gargot/images-placeholder/master/placeholder-portrait.png",
                placeholder: (context, url) => Center(
                    child: SizedBox(
                        height: playButton ? 100 : 50,
                        width: playButton ? 100 : 50,
                        child: const CircularProgressIndicator())),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          playButton
              ? Padding(
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
              : Container(),
        ],
      ),
    );
  }
}
