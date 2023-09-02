import 'package:bookly/features/constants.dart';
import 'package:flutter/material.dart';

class AppBarDetails extends StatelessWidget {
  const AppBarDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSidePadding, vertical: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.close,
              color: Colors.white,
              size: kIconsSize,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}
