part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class SignInProgressState extends AuthState {}

class SignInSuccessState extends AuthState {}

class SignInFailureState extends AuthState {}

class UserUnauthorizedState extends AuthState {}

class SignUpProgressState extends AuthState {}

class SignUpSuccessState extends AuthState {}

class SignUpFailureState extends AuthState {}

class UserAlreadyExistsState extends AuthState{}

class GenerateAccessTokenInProgressState extends AuthState {}

class GenerateAccessTokenSuccessState extends AuthState {}

class GenerateAccessTokenFailureState extends AuthState {}

class ResetPasswordInProgressState extends AuthState {}

class ResetPasswordSuccessState extends AuthState {}

class ResetPasswordFailureState extends AuthState {}

class SetPasswordInProgressState extends AuthState {}

class SetPasswordSuccessState extends AuthState {}

class SetPasswordFailureState extends AuthState {}

class VerifyOTPInProgressState extends AuthState {}

class VerifyOTPSuccessState extends AuthState {}

class VerifyOTPFailureState extends AuthState {}

class ChangePasswordInProgressState extends AuthState {}

class ChangePasswordSuccessState extends AuthState {}

class ChangePasswordFailureState extends AuthState {}
