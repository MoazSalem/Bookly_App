import 'package:bookly/features/home/presentation/view_model/best_seller_cubit/best_seller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'best_seller_item.dart';

class BestSellerList extends StatelessWidget {
  const BestSellerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerCubit, BestSellerState>(
      builder: (context, state) {
        if (state is BestSellerFailure) {
          return Center(
            child: Text(state.message),
          );
        }
        if (state is BestSellerSuccess) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: state.books.length,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(0),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => BestSellerItem(
                    book: state.books[index],
                  ));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
