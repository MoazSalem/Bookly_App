import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:bookly/features/home/presentation/views/widgets/app_bar_home.dart';
import 'package:bookly/features/constants.dart';
import 'best_seller_list.dart';
import 'featured_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarHome(),
                  FeaturedListView(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: kSidePadding, vertical: 10),
                    child: Text(
                      "Best Seller",
                      style: Styles.titleMedium18,
                    ),
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              child: BestSellerList(),
            )
          ],
        ),
        NavBar(index: 0),
      ],
    );
  }
}
