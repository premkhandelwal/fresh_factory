import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fresh/data/enums.dart';

part 'radio_button_state.dart';

class RadioButtonCubit extends Cubit<RadioButtonState> {
  RadioButtonCubit() : super(RadioButtonInitial());

  void sortOptionSelected(SortOptions? sortOption) {
    emit(SortSelectionChanged(sortOptionVal: sortOption));
  }
  void filterOptionSelected(FilterOptions? filterOption) {
    emit(FilterSelectionChanged(filterOptionVal: filterOption));
  }
}
