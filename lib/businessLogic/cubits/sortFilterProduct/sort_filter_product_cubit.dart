import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sort_filter_product_state.dart';

class SortFilterProductCubit extends Cubit<SortFilterProductState> {
  SortFilterProductCubit() : super(SortFilterProductInitial());

  void changeTabIndex(int index) {
    emit(TabBarSelectionChanged(tabIndex: index));
  }
}
