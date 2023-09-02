import 'package:flutter/material.dart';
import 'widgets/home_view_body.dart';
import 'widgets/audio_books_view_body.dart';
import 'widgets/bookmarked_view_body.dart';
import 'widgets/profile_view_body.dart';
import 'widgets/nav_bar.dart';

int _pageIndex = 0;
List<Widget> _pageList = [
  const HomeViewBody(),
  const AudioBooksViewBody(),
  const BookmarkedViewBody(),
  const ProfileViewBody(),
];

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // TODO: update with a state management solution
        _pageList[_pageIndex],
        NavBar(index: _pageIndex),
      ],
    ));
  }
}
