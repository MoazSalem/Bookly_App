import 'package:bookly/features/constants.dart';
import 'package:flutter/material.dart';
import '../../../../home/presentation/views/widgets/best_seller_list.dart';
import 'app_bar_search.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
          children: [
              const AppBarSearch(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kSidePadding),
                child: TextField(
                  controller: _searchController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                ),
              ),
          ],
        ),
            )),
        const SliverFillRemaining(
          child: BestSellerList(),
        )
      ],
    );
  }
}
