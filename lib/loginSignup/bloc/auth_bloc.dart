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
    } else if (event is OwnershipChanged) {
      yield _mapOwnershipChangedToState(event, state);
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
    } else if (event is OwnershipSubmitted) {
      yield* _mapOwnershipSubmittedToState(event, state);
    } else if (event is OwnershipAlreadyExist) {
      yield* _mapOwnershipAlreadyExistToState(event, state);
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

  AuthState _mapOwnershipChangedToState(
      OwnershipChanged event, AuthState state) {
    print(state.ownershipAdd);
    return state.copywith(
      ownershipAdd: event.input,
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
        (state.passwordSignup.valid && state.confirmPassword.valid) &&
        (state.passwordSignup.value == state.confirmPassword.value)) {
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
    yield state.copywith(authLoginStatus: loginStatus.submissionProgress);
    print('bloc login');
    try {
      UserEntity user = UserEntity(
          name: '',
          mail: state.emailLogin.value,
          ownership: [''],
          password: state.passwordLogin.value);
      bool checkUser = await userRepository.checkAuth(user);
      if (checkUser) {
        bool checkOwnership = await userRepository.checkOwnership(user);
        UserEntity currentUser =
            await userRepository.getUser(state.emailLogin.value);
        await localStorageRepository.changeUser(user: currentUser);

        yield state.copywith(
          currentUser: currentUser,
          authLoginStatus: loginStatus.submissionSuccess,
          isOwnership: checkOwnership,
        );
      } else {
        yield state.copywith(
            authLoginStatus: loginStatus.submissionFailure,
            errorReason: 'Email or Password wrong.');
      }
    } catch (e) {
      print(e);
    }

    yield state.copywith(authLoginStatus: loginStatus.submissionNotStarted);
  }

  Stream<AuthState> _mapOwnershipSubmittedToState(
      OwnershipSubmitted event, AuthState state) async* {
    yield state.copywith(authLoginStatus: loginStatus.submissionProgress);
    print('bloc ownership');
    try {
      UserEntity newUser = UserEntity(
          name: '',
          mail: state.emailLogin.value,
          ownership: [state.ownershipAdd!],
          password: state.passwordLogin.value);
      print('here1');
      bool addOwnership = await userRepository.addOwnership(newUser);
      print('here6');
      if (!addOwnership) {
        UserEntity currentUser =
            await userRepository.getUser(state.emailLogin.value);
        await localStorageRepository.changeUser(user: currentUser);
        await localStorageRepository.changeOwnership(
            givenOwnership: currentUser.ownership[0]);
        yield state.copywith(ownershipStatus: OwnershipStatus.success);
      }
    } catch (e) {
      print(e);
      yield state.copywith(ownershipStatus: OwnershipStatus.fail);
    }

    yield state.copywith(authLoginStatus: loginStatus.submissionNotStarted);
  }

  Stream<AuthState> _mapOwnershipAlreadyExistToState(
      OwnershipAlreadyExist event, AuthState state) async* {
    print('bloc ownership already exists');
    UserEntity? currentUser = await localStorageRepository.getUser();
    await localStorageRepository.changeOwnership(
        givenOwnership: currentUser!.ownership[0]);
  }

  Stream<AuthState> _mapSignUpSubmittedToState(
      SignUpSubmitted event, AuthState state) async* {
    yield state.copywith(authSignupStatus: signUpStatus.submissionProgress);
    print('bloc sign up');
    try {
      UserEntity newUser = UserEntity(
          name: state.fullname!,
          mail: state.emailSignup.value,
          ownership: [''],
          password: state.passwordSignup.value);
      await userRepository.setUser(newUser);
      yield state.copywith(authSignupStatus: signUpStatus.submissionSuccess);
    } catch (e) {
      print(e);
    }

    yield state.copywith(authSignupStatus: signUpStatus.submissionNotStarted);
  }
}
