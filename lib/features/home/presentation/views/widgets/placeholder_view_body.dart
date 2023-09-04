import 'package:flutter/material.dart';

import 'app_bar_home.dart';

class PlaceHolderViewBody extends StatelessWidget {
  const PlaceHolderViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarHome(),
              SizedBox(
                height: 300,
              ),
              Center(child: Text("This Page is not Implemented"))
            ],
          ),
        ),

      ],
    );
  }
}
