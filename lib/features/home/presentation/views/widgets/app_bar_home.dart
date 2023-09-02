import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/features/constants.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kSidePadding, right: kSidePadding, top: 40.0, bottom: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AssetsData.logo, height: kIconsHeight, semanticsLabel: 'bookly logo'),
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/search'),
            borderRadius: BorderRadius.circular(kBorderRadius),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(AssetsData.search, height: 28, semanticsLabel: 'search icon'),
            ),
          )
        ],
      ),
    );
  }
}
