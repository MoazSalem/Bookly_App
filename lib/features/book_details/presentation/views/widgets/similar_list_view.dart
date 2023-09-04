import 'package:flutter/material.dart';
import 'package:bookly/features/constants.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_list_view_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/presentation/views/widgets/featured_list_view_item_loading.dart';
import '../../view_model/similar_cubit/similar_cubit.dart';

class SimilarListView extends StatelessWidget {
  const SimilarListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarCubit, SimilarState>(
      builder: (context, state) {
        if (state is SimilarFailure) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is SimilarSuccess) {
          return SizedBox(
            height: 140,
            child: ListView.builder(
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: kSidePadding),
                itemBuilder: (context, index) {
                  return SizedBox(
                      height: 140,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FeaturedListViewItem(
                          index: 0,
                          playButton: false,
                          book: state.books[index],
                        ),
                      ));
                }),
          );
        } else {
          return SizedBox(
            height: 140,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: kSidePadding),
              itemBuilder: (context, index) {
                return const SizedBox(
                    height: 140,
                    child: Padding(
                        padding: EdgeInsets.all(6.0),
                        child: FeaturedListViewItemLoading()));
              },
            ),
          );
        }
      },
    );
  }
}
