import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:fresh/data/dataProviders/profile_provider.dart';
import 'package:fresh/data/models/bank_details.dart';
import 'package:fresh/data/models/user.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileProvider profileProvider;
  ProfileBloc({
    required this.profileProvider,
  }) : super(ProfileInitial()) {
    on<UpdateUserDetailsEvent>((event, emit) async {
      emit(UpdateUserDetailsInProgressState());
      String? res = await profileProvider.updateProfileDetails(event.user);
      if (res == null) {
        emit(UpdateUserDetailsFailureState());
      } else if (res == "Success") {
        emit(UpdateUserDetailsSuccessState());
      }
    });
    on<UpdateBankDetailsEvent>((event, emit) async {
      emit(UpdateBankDetailsInProgressState());
      String? res = await profileProvider.updateBankDetails(event.bankDetails);
      if (res == null) {
        emit(UpdateBankDetailsFailureState());
      } else if (res == "Success") {
        emit(UpdateBankDetailsSuccessState());
      }
    });
  }
}
