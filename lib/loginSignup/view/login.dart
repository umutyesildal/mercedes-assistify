import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/loginSignup/bloc/auth_bloc.dart';
import 'package:template/mainBloc/main_bloc.dart';
import 'package:template/router.dart';
import '../models/models.dart';
import 'widgets/widgets.dart';

class LoginPage extends StatelessWidget {
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
            BlocProvider.of<MainBloc>(context)
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
                  flex: 9,
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
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: _EmailInput(),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Column(
                      children: [
                        _PasswordInput(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                      RouteGenerator.forgotPasswordRoute);
                                },
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: _LoginButton(),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(RouteGenerator.signUpRoute);
                      },
                      child: Text(
                        'Create Account',
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

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return ElevatedButton(
            onPressed: state.readyToLogin
                ? () {
                    BlocProvider.of<AuthBloc>(context).add(LoginSubmitted());
                  }
                : null,
            child: Text('Login'));
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previous, current) =>
          previous.passwordLogin != current.passwordLogin,
      builder: (context, state) {
        return AuthField(
          isObsecure: true,
          isError: state.passwordLogin.invalid,
          errorText: 'Password can not be empty',
          labelText: 'Password',
          onChangeCallback: (password) {
            BlocProvider.of<AuthBloc>(context)
                .add(LoginPasswordChanged(password: password));
            BlocProvider.of<AuthBloc>(context).add(CheckLoginReady());
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
          previous.emailLogin != current.emailLogin,
      builder: (context, state) {
        return AuthField(
          isObsecure: false,
          isError: state.emailLogin.invalid,
          errorText: 'Please correct your mail',
          labelText: 'E-mail Adress',
          onChangeCallback: (email) {
            BlocProvider.of<AuthBloc>(context)
                .add(LoginEmailChanged(input: email));
            BlocProvider.of<AuthBloc>(context).add(CheckLoginReady());
          },
        );
      },
    );
  }
}
