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
