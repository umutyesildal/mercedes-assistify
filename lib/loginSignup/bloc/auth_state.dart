part of 'auth_bloc.dart';

@immutable
class AuthState extends Equatable {
  const AuthState({
    this.status = FormzStatus.pure,
    this.emailLogin = const Email.pure(),
    this.emailSignup = const Email.pure(),
    this.emailForgotPassword = const Email.pure(),
    this.passwordSignup = const Password.pure(),
    this.passwordLogin = const Password.pure(),
    this.confirmPassword = const Password.pure(),
    this.errorReason = '',
    this.authStatus = Status.submissionNotStarted,
    this.readyToLogin = false,
    this.readyToSignUp = false,
    this.fullname,
  });
  final Status authStatus;
  final FormzStatus status;
  final Password passwordLogin;
  final Password passwordSignup;

  final Password confirmPassword;
  final String? fullname;
  final Email emailLogin;
  final Email emailSignup;

  final Email emailForgotPassword;

  final String errorReason;
  final bool readyToLogin;
  final bool readyToSignUp;

  AuthState copywith({
    FormzStatus? status,
    Password? passwordLogin,
    Password? passwordSignup,
    Password? confirmPassword,
    String? fullname,
    Email? emailLogin,
    Email? emailSignup,
    Email? emailForgotPassword,
    String? errorReason,
    Status? authStatus,
    bool? readyToLogin,
    bool? readyToSignUp,
  }) {
    return AuthState(
        errorReason: errorReason ?? this.errorReason,
        emailLogin: emailLogin ?? this.emailLogin,
        emailSignup: emailSignup ?? this.emailSignup,
        fullname: fullname ?? this.fullname,
        emailForgotPassword: emailForgotPassword ?? this.emailForgotPassword,
        status: status ?? this.status,
        passwordLogin: passwordLogin ?? this.passwordLogin,
        passwordSignup: passwordSignup ?? this.passwordSignup,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        authStatus: authStatus ?? this.authStatus,
        readyToLogin: readyToLogin ?? this.readyToLogin,
        readyToSignUp: readyToSignUp ?? this.readyToSignUp);
  }

  @override
  List<Object?> get props => [
        status,
        fullname,
        passwordLogin,
        passwordSignup,
        confirmPassword,
        emailSignup,
        emailLogin,
        emailForgotPassword,
        errorReason,
        authStatus,
        readyToLogin,
        readyToSignUp
      ];
}
