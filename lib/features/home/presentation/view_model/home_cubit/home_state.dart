part of 'home_cubit.dart';

@immutable
abstract class HomeState {
  final int index;
  const HomeState(this.index);
}

class HomeInitial extends HomeState {
  const HomeInitial(super.index);
}

class HomeSwitchPage extends HomeState {
  const HomeSwitchPage(super.index);
}
