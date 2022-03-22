import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottomnavigationbar_state.dart';

class BottomnavigationbarCubit extends Cubit<PageState> {
  BottomnavigationbarCubit() : super(PageState(0));

  void changePage(int index) {
    emit(PageState(index));
  }
}
