import 'package:bookly/features/constants.dart';
import 'package:bookly/features/search/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/presentation/views/widgets/best_seller_item.dart';
import '../../../../home/presentation/views/widgets/best_seller_item_loading.dart';
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
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
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
                      onChanged: (value) =>
                          value != "" ? context.read<SearchCubit>().getBooks(query: value) : null,
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
            if (state is SearchSuccess)
              SliverToBoxAdapter(
                  child: state.books.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.books.length,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(0),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => BestSellerItem(
                                book: state.books[index],
                              ))
                      : const Text('No results found')),
            if (state is SearchFailed)
              SliverToBoxAdapter(child: Center(child: Text(state.message))),
            if (state is SearchInitial)
              const SliverFillRemaining(
                child: BestSellerList(),
              ),
            if (state is SearchLoading)
              SliverFillRemaining(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(0),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => const BestSellerItemLoading())),
          ],
        );
      },
    );
  }
}
