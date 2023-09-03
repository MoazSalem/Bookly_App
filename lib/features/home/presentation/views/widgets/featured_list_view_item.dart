import 'package:blur/blur.dart';
import 'package:bookly/features/constants.dart';
import 'package:flutter/material.dart';

class FeaturedListViewItem extends StatelessWidget {
  final String imageUrl;
  final int index;
  final bool playButton;
  const FeaturedListViewItem({
    super.key,
    required this.imageUrl,
    required this.index,
    this.playButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/book_details'),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          AspectRatio(
            aspectRatio: 0.65,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.fill,
                ),
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
