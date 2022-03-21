part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class SignInProgressState extends AuthState {}

class SignInSuccessState extends AuthState {
  final User user;
  SignInSuccessState({
    required this.user,
  });
}

class SignInFailureState extends AuthState {}

class UserUnauthorizedState extends AuthState {}

class SignUpProgressState extends AuthState {}

class SignUpSuccessState extends AuthState {}

class SignUpFailureState extends AuthState {}

class GenerateAccessTokenInProgressState extends AuthState {}

class GenerateAccessTokenSuccessState extends AuthState {}

class GenerateAccessTokenFailureState extends AuthState {}
