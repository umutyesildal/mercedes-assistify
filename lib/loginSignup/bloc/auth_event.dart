part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginPasswordChanged extends AuthEvent {
  final String password;

  LoginPasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class SignUpPasswordChanged extends AuthEvent {
  final String password;

  SignUpPasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class SignUpConfirmPasswordChanged extends AuthEvent {
  final String password;

  SignUpConfirmPasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class LoginSubmitted extends AuthEvent {
  const LoginSubmitted();
}

class SignUpSubmitted extends AuthEvent {
  const SignUpSubmitted();
}

class OwnershipSubmitted extends AuthEvent {
  const OwnershipSubmitted();
}

class OwnershipAlreadyExist extends AuthEvent {
  const OwnershipAlreadyExist();
}

class ForgotPasswordSubmitted extends AuthEvent {
  const ForgotPasswordSubmitted();
}

class CheckLoginReady extends AuthEvent {
  const CheckLoginReady();
}

class CheckSignUpReady extends AuthEvent {
  const CheckSignUpReady();
}

class LoginEmailChanged extends AuthEvent {
  final String input;

  LoginEmailChanged({required this.input});

  @override
  List<Object> get props => [input];
}

class OwnershipChanged extends AuthEvent {
  final String input;

  OwnershipChanged({required this.input});

  @override
  List<Object> get props => [input];
}

class SignUpEmailChanged extends AuthEvent {
  final String input;

  SignUpEmailChanged({required this.input});

  @override
  List<Object> get props => [input];
}

class ForgotPasswordEmailChanged extends AuthEvent {
  final String input;

  ForgotPasswordEmailChanged({required this.input});

  @override
  List<Object> get props => [input];
}

class SignUpNameChanged extends AuthEvent {
  final String input;

  SignUpNameChanged({required this.input});

  @override
  List<Object> get props => [input];
}
