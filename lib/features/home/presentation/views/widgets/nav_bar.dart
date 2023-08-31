import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/features/constants.dart';

class NavBar extends StatelessWidget {
  final int index;
  const NavBar({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSidePadding),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(kBorderRadius),
            ),
            width: MediaQuery.of(context).size.width * 0.55,
            height: 52,
          ).frosted(
            blur: 3.5,
            borderRadius: BorderRadius.circular(kBorderRadius),
            frostColor: kPrimaryColor.withOpacity(0.2),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(AssetsData.books,
                        height: kIconsSize,
                        semanticsLabel: 'books icon',
                        colorFilter: ColorFilter.mode(
                            index == 0 ? Colors.white : Colors.white54, BlendMode.srcIn)),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(AssetsData.bookmarked,
                        height: kIconsSize,
                        semanticsLabel: 'bookmarked icon',
                        colorFilter: ColorFilter.mode(
                            index == 1 ? Colors.white : Colors.white54, BlendMode.srcIn)),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(AssetsData.audio,
                        height: kIconsSize,
                        semanticsLabel: 'audio icon',
                        colorFilter: ColorFilter.mode(
                            index == 2 ? Colors.white : Colors.white54, BlendMode.srcIn)),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  child: Icon(
                    CupertinoIcons.person_circle_fill,
                    color: index == 3 ? Colors.white : Colors.white54,
                    size: 26,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
