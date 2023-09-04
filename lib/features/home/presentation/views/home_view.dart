import 'package:bookly/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/home_view_body.dart';
import 'widgets/placeholder_view_body.dart';
import 'widgets/nav_bar.dart';

List<Widget> _pageList = [
  const HomeViewBody(),
  const PlaceHolderViewBody(),
  const PlaceHolderViewBody(),
  const PlaceHolderViewBody(),
];

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                _pageList[state.index],
                NavBar(index: state.index),
              ],
            ));
      },
    );
  }
}
