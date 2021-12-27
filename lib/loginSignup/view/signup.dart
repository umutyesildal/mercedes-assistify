import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/loginSignup/bloc/auth_bloc.dart';
import 'package:template/preferencesBloc/preferences_bloc.dart';
import 'package:template/router.dart';
import '../models/models.dart';
import 'widgets/widgets.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.authStatus == Status.submissionFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(
                    state.errorReason,
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                ),
              );
          }
          if (state.authStatus == Status.submissionSuccess) {
            BlocProvider.of<PreferencesBloc>(context)
                .add(AuthChangedEvent(auth: true));
            Navigator.of(context).pushNamedAndRemoveUntil(
                RouteGenerator.landingRoute, (route) => false);
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Center(
                    child: Text(
                      'Assistify',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Theme.of(context).accentColor),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: _NameInput(),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Column(
                      children: [
                        _EmailInput(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Column(
                      children: [
                        _PasswordInput(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Column(
                      children: [
                        _ConfirmPasswordInput(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: _SignupButton(),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(RouteGenerator.loginRoute);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.login,
                        style: TextStyle(color: Theme.of(context).accentColor),
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ));
  }
}

class _SignupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return ElevatedButton(
            onPressed: state.readyToSignUp
                ? () {
                    BlocProvider.of<AuthBloc>(context).add(SignUpSubmitted());
                  }
                : null,
            child: Text(AppLocalizations.of(context)!.signup));
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previous, current) =>
          previous.passwordSignup != current.passwordSignup,
      builder: (context, state) {
        return AuthField(
          isObsecure: true,
          isError: state.passwordSignup.invalid,
          errorText: AppLocalizations.of(context)!.passwordCanNotBeEmpty,
          labelText: AppLocalizations.of(context)!.password,
          onChangeCallback: (password) {
            BlocProvider.of<AuthBloc>(context)
                .add(SignUpPasswordChanged(password: password));
            BlocProvider.of<AuthBloc>(context).add(CheckSignUpReady());
          },
        );
      },
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previous, current) =>
          previous.confirmPassword != current.confirmPassword ||
          previous.passwordSignup != current.passwordSignup,
      builder: (context, state) {
        return AuthField(
          isObsecure: true,
          isError: state.confirmPassword.invalid ||
              state.confirmPassword.value != state.passwordSignup.value,
          errorText: AppLocalizations.of(context)!.passwordsDoesNotMatch,
          labelText: AppLocalizations.of(context)!.confirmPassword,
          onChangeCallback: (password) {
            BlocProvider.of<AuthBloc>(context)
                .add(SignUpConfirmPasswordChanged(password: password));
            BlocProvider.of<AuthBloc>(context).add(CheckSignUpReady());
          },
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previous, current) =>
          previous.emailSignup != current.emailSignup,
      builder: (context, state) {
        return AuthField(
          isObsecure: false,
          isError: state.emailSignup.invalid,
          errorText: AppLocalizations.of(context)!.pleaseCorrectYourmail,
          labelText: AppLocalizations.of(context)!.emailAdress,
          onChangeCallback: (email) {
            BlocProvider.of<AuthBloc>(context)
                .add(SignUpEmailChanged(input: email));
            BlocProvider.of<AuthBloc>(context).add(CheckSignUpReady());
          },
        );
      },
    );
  }
}

class _NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previous, current) => previous.fullname != current.fullname,
      builder: (context, state) {
        return AuthField(
          isObsecure: false,
          isError: false,
          errorText: '',
          labelText: AppLocalizations.of(context)!.fullName,
          onChangeCallback: (name) {
            BlocProvider.of<AuthBloc>(context)
                .add(SignUpNameChanged(input: name));
          },
        );
      },
    );
  }
}
