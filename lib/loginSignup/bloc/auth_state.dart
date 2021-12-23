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
    this.authLoginStatus = loginStatus.submissionNotStarted,
    this.authSignupStatus = signUpStatus.submissionNotStarted,
    this.ownershipStatus = OwnershipStatus.notStarted,
    this.readyToLogin = false,
    this.readyToSignUp = false,
    this.fullname,
    this.isOwnership = false,
    this.ownershipAdd,
    this.currentUser,
  });
  final loginStatus authLoginStatus;
  final signUpStatus authSignupStatus;
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
  final UserEntity? currentUser;

  AuthState copywith(
      {FormzStatus? status,
      Password? passwordLogin,
      Password? passwordSignup,
      Password? confirmPassword,
      String? fullname,
      String? ownershipAdd,
      Email? emailLogin,
      Email? emailSignup,
      Email? emailForgotPassword,
      String? errorReason,
      loginStatus? authLoginStatus,
      signUpStatus? authSignupStatus,
      OwnershipStatus? ownershipStatus,
      bool? readyToLogin,
      bool? readyToSignUp,
      bool? isOwnership,
      UserEntity? currentUser}) {
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
      authLoginStatus: authLoginStatus ?? this.authLoginStatus,
      authSignupStatus: authSignupStatus ?? this.authSignupStatus,
      ownershipStatus: ownershipStatus ?? this.ownershipStatus,
      readyToLogin: readyToLogin ?? this.readyToLogin,
      readyToSignUp: readyToSignUp ?? this.readyToSignUp,
      isOwnership: isOwnership ?? this.isOwnership,
      currentUser: currentUser ?? this.currentUser,
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
        authLoginStatus,
        authSignupStatus,
        ownershipStatus,
        readyToLogin,
        readyToSignUp,
        isOwnership,
        currentUser
      ];
}
