part of 'sort_filter_product_cubit.dart';

abstract class SortFilterProductState extends Equatable {
  const SortFilterProductState();

  @override
  List<Object> get props => [];
}

class SortFilterProductInitial extends SortFilterProductState {}

class TabBarSelectionChanged extends SortFilterProductState {
  final int tabIndex;
  TabBarSelectionChanged({
    required this.tabIndex,
  });
  @override
  // TODO: implement props
  List<Object> get props => [DateTime.now()];
}
