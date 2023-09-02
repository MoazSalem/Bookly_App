import 'package:flutter/material.dart';
import 'package:bookly/features/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bookly/core/utils/assets.dart';

class AppBarSearch extends StatelessWidget {
  const AppBarSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kSidePadding, right: kSidePadding, top: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.close,
                size: kIconsSize,
              )),
          const SizedBox(
            width: 18.0,
          ),
          SvgPicture.asset(AssetsData.logo, height: kIconsHeight, semanticsLabel: 'bookly logo'),
        ],
      ),
    );
  }
}
