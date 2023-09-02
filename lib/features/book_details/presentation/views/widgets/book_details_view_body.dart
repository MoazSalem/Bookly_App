import 'package:bookly/features/constants.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'app_bar.dart';
import 'details.dart';
import 'double_buttons.dart';
import 'similar_list_view.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        AppBarDetails(),
        Details(),
        DoubleButtons(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: kSidePadding),
          child: Text(
            "You can also like",
            style: Styles.titleSmall16,
          ),
        ),
        SimilarListView(),
        SizedBox(
          height: 20.0,
        )
      ],
    );
  }
}
