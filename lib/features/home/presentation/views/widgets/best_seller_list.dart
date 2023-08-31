import 'package:flutter/material.dart';

import 'best_seller_item.dart';

class BestSellerList extends StatelessWidget {
  const BestSellerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => const BestSellerItem());
  }
}
