import 'package:flutter/material.dart';
import 'package:bookly/features/home/presentation/views/widgets/app_bar_home.dart';
class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AppBarHome(),
      ],
    );
  }
}
