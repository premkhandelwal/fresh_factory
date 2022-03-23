part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignInRequestedEvent extends AuthEvent {
  final User user;
  SignInRequestedEvent({
    required this.user,
  });
}

class SignUpRequestedEvent extends AuthEvent {
  final User user;
  SignUpRequestedEvent({
    required this.user,
  });
}

class GenerateAccessTokenEvent extends AuthEvent {
  final User user;
  GenerateAccessTokenEvent({
    required this.user,
  });
}

class ForgotPasswordEvent extends AuthEvent {
  final String email;
  ForgotPasswordEvent({
    required this.email,
  });
}
class SetPasswordEvent extends AuthEvent {
  final String email;
  final String password;
  SetPasswordEvent({
    required this.email,
    required this.password,
  });
}
