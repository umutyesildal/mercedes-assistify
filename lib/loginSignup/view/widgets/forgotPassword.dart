import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/loginSignup/bloc/auth_bloc.dart';
import '../../models/models.dart';
import 'widgets.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if ((state.authLoginStatus == loginStatus.submissionFailure) ||
              (state.authLoginStatus ==
                  loginStatus.forgotPasswordSubmissionSuccess)) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(
                    state.errorReason,
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor:
                      state.authLoginStatus == loginStatus.submissionFailure
                          ? Colors.red
                          : Colors.green,
                  behavior: SnackBarBehavior.floating,
                ),
              );
          }
          if (state.authLoginStatus ==
              loginStatus.forgotPasswordSubmissionSuccess) {
            Future.delayed(const Duration(milliseconds: 1000), () {
              Navigator.pop(context);
            });
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Icon(Icons.arrow_back),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    )),
                Expanded(
                  flex: 12,
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
                  flex: 4,
                  child: Center(
                    child: Text(
                      'Please Enter your Email Adress',
                      style: TextStyle(
                          fontSize: 17, color: Theme.of(context).accentColor),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: _EmailInput(),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: _SendMailButton(),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ));
  }
}

class _SendMailButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return ElevatedButton(
            onPressed: state.emailForgotPassword.valid &&
                    state.authLoginStatus == loginStatus.submissionNotStarted
                ? () {
                    BlocProvider.of<AuthBloc>(context)
                        .add(ForgotPasswordSubmitted());
                  }
                : null,
            child: Text('Send Email'));
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previous, current) =>
          previous.emailForgotPassword != current.emailForgotPassword,
      builder: (context, state) {
        return AuthField(
          isObsecure: false,
          isError: state.emailForgotPassword.invalid,
          errorText: 'Please correct your mail',
          labelText: 'E-mail Adress',
          onChangeCallback: (email) {
            BlocProvider.of<AuthBloc>(context)
                .add(ForgotPasswordEmailChanged(input: email));
          },
        );
      },
    );
  }
}
