import 'dart:async';
import 'package:user_repository/user_repository.dart';

import 'package:bloc/bloc.dart';
import 'package:local_storage/local_storage.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import '../models/models.dart';
import 'package:formz/formz.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.localStorageRepository, required this.userRepository})
      : super(AuthState());

  final LocalStorage localStorageRepository;
  final UserRepository userRepository;
  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is LoginEmailChanged) {
      yield _mapLoginEmailChangedToState(event, state);
    } else if (event is LoginPasswordChanged) {
      yield _mapLoginPasswordChangedToState(event, state);
    } else if (event is SignUpNameChanged) {
      yield _mapSignUpNameChangedToState(event, state);
    } else if (event is SignUpEmailChanged) {
      yield _mapSignUpEmailChangedToState(event, state);
    } else if (event is SignUpPasswordChanged) {
      yield _mapSignUpPasswordChangedToState(event, state);
    } else if (event is SignUpConfirmPasswordChanged) {
      yield _mapSignUpConfirmPasswordChangedToState(event, state);
    } else if (event is ForgotPasswordEmailChanged) {
      yield _mapForgotPasswordEmailChangedToState(event, state);
    } else if (event is CheckLoginReady) {
      yield _mapCheckReadyToLoginToState(event, state);
    } else if (event is LoginSubmitted) {
      yield* _mapLoginSubmittedToState(event, state);
    } else if (event is CheckSignUpReady) {
      yield _mapCheckReadyToSignUpToState(event, state);
    } else if (event is SignUpSubmitted) {
      yield* _mapSignUpSubmittedToState(event, state);
    }
  }

  AuthState _mapLoginEmailChangedToState(
      LoginEmailChanged event, AuthState state) {
    final input = Email.dirty(value: event.input);
    return state.copywith(
      emailLogin: input,
      status: Formz.validate([input, state.passwordLogin]),
    );
  }

  AuthState _mapSignUpNameChangedToState(
      SignUpNameChanged event, AuthState state) {
    final input = event.input;
    print(' name: ' + input);
    return state.copywith(
      fullname: input,
    );
  }

  AuthState _mapSignUpEmailChangedToState(
      SignUpEmailChanged event, AuthState state) {
    final input = Email.dirty(value: event.input);
    return state.copywith(
      emailSignup: input,
      status: Formz.validate([input, state.passwordLogin]),
    );
  }

  AuthState _mapForgotPasswordEmailChangedToState(
      ForgotPasswordEmailChanged event, AuthState state) {
    final input = Email.dirty(value: event.input);
    return state.copywith(
      emailForgotPassword: input,
      status: Formz.validate([input, state.passwordLogin]),
    );
  }

  AuthState _mapLoginPasswordChangedToState(
      LoginPasswordChanged event, AuthState state) {
    final password = Password.dirty(value: event.password);
    return state.copywith(
      passwordLogin: password,
    );
  }

  AuthState _mapSignUpPasswordChangedToState(
      SignUpPasswordChanged event, AuthState state) {
    final password = Password.dirty(value: event.password);
    return state.copywith(
      passwordSignup: password,
    );
  }

  AuthState _mapSignUpConfirmPasswordChangedToState(
      SignUpConfirmPasswordChanged event, AuthState state) {
    final password = Password.dirty(value: event.password);
    return state.copywith(
      confirmPassword: password,
    );
  }

  AuthState _mapCheckReadyToLoginToState(
      CheckLoginReady event, AuthState state) {
    if (state.emailLogin.valid && state.passwordLogin.valid) {
      print('email: ' +
          state.emailLogin.valid.toString() +
          ' password: ' +
          state.passwordLogin.valid.toString());
      return state.copywith(
        readyToLogin: true,
      );
    } else {
      print('email: ' +
          state.emailLogin.valid.toString() +
          'password: ' +
          state.passwordLogin.valid.toString());
      return state.copywith(
        readyToLogin: false,
      );
    }
  }

  AuthState _mapCheckReadyToSignUpToState(
      CheckSignUpReady event, AuthState state) {
    if (state.emailSignup.valid &&
        state.passwordSignup.valid &&
        state.confirmPassword.valid) {
      print('email: ' +
          state.emailSignup.valid.toString() +
          ' password: ' +
          state.passwordSignup.valid.toString());
      return state.copywith(
        readyToSignUp: true,
      );
    } else {
      print('email: ' +
          state.emailLogin.valid.toString() +
          'password: ' +
          state.passwordLogin.valid.toString());
      return state.copywith(
        readyToSignUp: false,
      );
    }
  }

  Stream<AuthState> _mapLoginSubmittedToState(
      LoginSubmitted event, AuthState state) async* {
    yield state.copywith(authStatus: Status.submissionProgress);
    print('bloc login');

    /*  try {
      UserEntity user = UserEntity(
          name: '',
          mail: state.emailLogin.value,
          ownership: '',
          password: state.passwordLogin.value);
      bool checkUser = await userRepository.checkUser(user);
      if (checkUser) {
        yield state.copywith(authStatus: Status.submissionSuccess);
      } else {
        yield state.copywith(
            authStatus: Status.submissionFailure,
            errorReason: 'Email or Password wrong.');
      }
    } catch (e) {
      print(e);
    } */

    if (state.passwordLogin.value == 'deneme' &&
        state.emailLogin.value == 'assistify@assistify.com') {
      yield state.copywith(authStatus: Status.submissionSuccess);
    } else {
      yield state.copywith(
          authStatus: Status.submissionFailure,
          errorReason: 'Email or Password wrong.');
    }

    yield state.copywith(authStatus: Status.submissionNotStarted);
  }

  Stream<AuthState> _mapSignUpSubmittedToState(
      SignUpSubmitted event, AuthState state) async* {
    yield state.copywith(authStatus: Status.submissionProgress);
    print('bloc sign up');

    try {
      UserEntity newUser = UserEntity(
          name: state.fullname!,
          mail: state.emailSignup.value,
          ownership: '',
          password: state.passwordSignup.value);
      await userRepository.setUser(newUser);
      yield state.copywith(authStatus: Status.submissionSuccess);
    } catch (e) {
      print(e);
    }

    yield state.copywith(authStatus: Status.submissionNotStarted);
  }
}



/*

  Stream<AuthState> _mapLoginSubmittedToState(
      LoginSubmitted event, AuthState state) async* {
    yield state.copywith(authStatus: Status.submissionProgress);
    try {
      print('bloc sign in');
      await authRepository.signInWithCredentials(
        email: state.emailLogin.value,
        password: state.password.value,
      );
      localStorageRepository.changeAuth(auth: true);

      yield state.copywith(authStatus: Status.submissionSuccess);
    } on EmailUsernameNotExist {
      yield state.copywith(
          authStatus: Status.submissionFailure,
          errorReason: 'Email does not exist.');
    } on WrongPassword {
      yield state.copywith(
          authStatus: Status.submissionFailure, errorReason: 'Wrong password');
    } on Exception {
      yield state.copywith(
          authStatus: Status.submissionFailure,
          errorReason: 'Something bad happened');
    }
    yield state.copywith(authStatus: Status.submissionNotStarted);
  }

  Stream<AuthState> _mapForgotPasswordSubmittedToState(
      ForgotPasswordSubmitted event, AuthState state) async* {
    yield state.copywith(authStatus: Status.submissionProgress);
    try {
      await authRepository.forgotPasswordMail(
        email: state.emailForgotPassword.value,
      );
      yield state.copywith(
          authStatus: Status.forgotPasswordSubmissionSuccess,
          errorReason: 'Please check your mail.');
    } on EmailUsernameNotExist {
      yield state.copywith(
          authStatus: Status.submissionFailure,
          errorReason: 'Email does not exist.');
    } on EmailAlreadySent {
      yield state.copywith(
          authStatus: Status.submissionFailure,
          errorReason: 'Email already sent.');
    } on Exception {
      yield state.copywith(
          authStatus: Status.submissionFailure,
          errorReason: 'Something bad happened');
    }
    yield state.copywith(authStatus: Status.submissionNotStarted);
  }
*/