part of 'bottom_nav_bar_cubit.dart';

class BottomNavBarState extends Equatable {
  final int currIndex;
  const BottomNavBarState(
    this.currIndex,
  );

  @override
  List<Object> get props => [DateTime.now()];
}
