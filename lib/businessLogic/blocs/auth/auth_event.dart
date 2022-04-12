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

class VerifyOtpEvent extends AuthEvent {
  final String email;
  final String otp;
  VerifyOtpEvent({
    required this.email,
    required this.otp,
  });
}

class ChangePasswordEvent extends AuthEvent {
  final String userName;
  final String oldPassword;
  final String newPassword;
  ChangePasswordEvent({
    required this.userName,
    required this.oldPassword,
    required this.newPassword,
  });
}

class SendOTPAfterSignUpEvent extends AuthEvent {
  final String emailId;
  SendOTPAfterSignUpEvent({
    required this.emailId,
  });
}
class VerifyOTPAfterSignUpEvent extends AuthEvent {
  final String emailId;
  final String otp;
  VerifyOTPAfterSignUpEvent({
    required this.emailId,
    required this.otp,
  });
}
