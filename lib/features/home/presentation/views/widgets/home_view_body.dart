import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:bookly/features/home/presentation/views/widgets/app_bar_home.dart';
import 'featured_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppBarHome(),
        FeaturedListView(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.0, vertical: 10),
          child: Text(
            "Best Seller",
            style: Styles.titleMedium,
          ),
        )
      ],
    );
  }
}
