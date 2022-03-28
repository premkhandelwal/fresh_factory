import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:fresh/data/dataProviders/auth_provider.dart';
import 'package:fresh/data/models/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthProvider authProvider;
  AuthBloc({required this.authProvider}) : super(AuthInitial()) {
    on<SignInRequestedEvent>((event, emit) async {
      emit(SignInProgressState());
      String? isSuccess = await authProvider.login(event.user);
      if (isSuccess != null) {
        if (isSuccess == "Success") {
          emit(SignInSuccessState());
        } else if (isSuccess == "UnAuthorized") {
          emit(UserUnauthorizedState());
        } else {
          emit(SignInFailureState());
        }
      } else {
        emit(SignInFailureState());
      }
    });
    on<SignUpRequestedEvent>((event, emit) async {
      emit(SignUpProgressState());
      User _user = await authProvider.signUp(event.user);
      if (_user.accessToken != null) {
        emit(SignUpSuccessState());
      } else {
        emit(SignUpFailureState());
      }
    });
    on<GenerateAccessTokenEvent>((event, emit) async {
      emit(GenerateAccessTokenInProgressState());
      User? user = await authProvider.generateToken(event.user);
      if (user != null) {
        add(SignInRequestedEvent(user: user));
        emit(GenerateAccessTokenSuccessState());
      } else {
        emit(GenerateAccessTokenFailureState());
      }
    });
    on<ForgotPasswordEvent>((event, emit) async {
      emit(ResetPasswordInProgressState());
      bool isSuccess = await authProvider.resetPassword(event.email);
      if (isSuccess) {
        emit(ResetPasswordSuccessState());
      } else {
        emit(ResetPasswordFailureState());
      }
    });
    on<SetPasswordEvent>((event, emit) async {
      emit(SetPasswordInProgressState());
      bool isSuccess =
          await authProvider.setPassword(event.email, event.password);
      if (isSuccess) {
        emit(SetPasswordSuccessState());
      } else {
        emit(SetPasswordFailureState());
      }
    });
    on<VerifyOtpEvent>((event, emit) async {
      emit(VerifyOTPInProgressState());
      bool isSuccess = await authProvider.verifyOtp(event.email, event.otp);
      if (isSuccess) {
        emit(VerifyOTPSuccessState());
      } else {
        emit(VerifyOTPFailureState());
      }
    });
    on<ChangePasswordEvent>((event, emit) async {
      emit(ChangePasswordInProgressState());
      bool isSuccess = await authProvider.changePassword(
          event.userName, event.oldPassword, event.newPassword);
      if (isSuccess) {
        emit(ChangePasswordSuccessState());
      } else {
        emit(ChangePasswordFailureState());
      }
    });
  }
}
