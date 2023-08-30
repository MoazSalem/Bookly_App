import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bookly/core/utils/assets.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 26.0, right: 26.0, top: 40.0, bottom: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AssetsData.logo, height: 20, semanticsLabel: 'bookly logo'),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(24),
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
