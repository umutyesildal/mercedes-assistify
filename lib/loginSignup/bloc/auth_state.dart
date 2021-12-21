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
    this.ownershipStatus = OwnershipStatus.notStarted,
    this.readyToLogin = false,
    this.readyToSignUp = false,
    this.fullname,
    this.isOwnership = false,
    this.ownershipAdd,
  });
  final Status authStatus;
  final OwnershipStatus ownershipStatus;

  final FormzStatus status;
  final Password passwordLogin;
  final Password passwordSignup;
  final Password confirmPassword;
  final String? fullname;
  final String? ownershipAdd;
  final Email emailLogin;
  final Email emailSignup;
  final Email emailForgotPassword;
  final String errorReason;
  final bool readyToLogin;
  final bool readyToSignUp;
  final bool isOwnership;

  AuthState copywith({
    FormzStatus? status,
    Password? passwordLogin,
    Password? passwordSignup,
    Password? confirmPassword,
    String? fullname,
    String? ownershipAdd,
    Email? emailLogin,
    Email? emailSignup,
    Email? emailForgotPassword,
    String? errorReason,
    Status? authStatus,
    OwnershipStatus? ownershipStatus,
    bool? readyToLogin,
    bool? readyToSignUp,
    bool? isOwnership,
  }) {
    return AuthState(
      errorReason: errorReason ?? this.errorReason,
      emailLogin: emailLogin ?? this.emailLogin,
      emailSignup: emailSignup ?? this.emailSignup,
      fullname: fullname ?? this.fullname,
      ownershipAdd: ownershipAdd ?? this.ownershipAdd,
      emailForgotPassword: emailForgotPassword ?? this.emailForgotPassword,
      status: status ?? this.status,
      passwordLogin: passwordLogin ?? this.passwordLogin,
      passwordSignup: passwordSignup ?? this.passwordSignup,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      authStatus: authStatus ?? this.authStatus,
      ownershipStatus: ownershipStatus ?? this.ownershipStatus,
      readyToLogin: readyToLogin ?? this.readyToLogin,
      readyToSignUp: readyToSignUp ?? this.readyToSignUp,
      isOwnership: isOwnership ?? this.isOwnership,
    );
  }

  @override
  List<Object?> get props => [
        status,
        fullname,
        ownershipAdd,
        passwordLogin,
        passwordSignup,
        confirmPassword,
        emailSignup,
        emailLogin,
        emailForgotPassword,
        errorReason,
        authStatus,
        ownershipStatus,
        readyToLogin,
        readyToSignUp,
        isOwnership,
      ];
}
