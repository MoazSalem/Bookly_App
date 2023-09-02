import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'details.dart';
import 'double_buttons.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        AppBarDetails(),
        Details(),
        DoubleButtons(),
      ],
    );
  }
}
