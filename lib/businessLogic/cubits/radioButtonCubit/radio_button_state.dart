part of 'radio_button_cubit.dart';

abstract class RadioButtonState extends Equatable {
  const RadioButtonState();

  @override
  List<Object> get props => [];

  SortOptions? get sortOptionVal => null;
  FilterOptions? get filterOptionVal => null;
}

class RadioButtonInitial extends RadioButtonState {}

class SortSelectionChanged extends RadioButtonState {
  @override
  final SortOptions? sortOptionVal;
  SortSelectionChanged({
    required this.sortOptionVal,
  });
}
class FilterSelectionChanged extends RadioButtonState {
  @override
  final FilterOptions? filterOptionVal;
  FilterSelectionChanged({
    required this.filterOptionVal,
  });
}
