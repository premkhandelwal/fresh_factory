part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class UpdateUserDetailsEvent extends ProfileEvent {
  final User user;
  UpdateUserDetailsEvent({
    required this.user,
  });
}
class UpdateBankDetailsEvent extends ProfileEvent {
  final BankDetails bankDetails;
  UpdateBankDetailsEvent({
    required this.bankDetails,
  });
}
