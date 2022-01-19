import 'dart:ui';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/loginSignup/bloc/auth_bloc.dart';
import 'package:template/preferencesBloc/preferences_bloc.dart';
import 'package:template/router.dart';
import '../models/models.dart';
import 'widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.authLoginStatus == loginStatus.submissionFailure) {
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
          if (state.authLoginStatus == loginStatus.submissionSuccess) {
            BlocProvider.of<PreferencesBloc>(context)
                .add(AuthChangedEvent(auth: true));
            if (state.isOwnership) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  RouteGenerator.landingRoute, (route) => false);

              BlocProvider.of<AuthBloc>(context).add(OwnershipAlreadyExist());
            } else {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  RouteGenerator.addCarRoute, (route) => false);
            }
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                height: size.height * 0.9,
                width: size.width,
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
                            /*  Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pushNamed(
                                          RouteGenerator.forgotPasswordRoute);
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)!.forgotPassword,
                                      style: TextStyle(
                                          color: Theme.of(context).accentColor),
                                    ))
                              ],
                            ), */
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
                            AppLocalizations.of(context)!.createAccount,
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                          )),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
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
            child: Text(AppLocalizations.of(context)!.login));
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
          errorText: AppLocalizations.of(context)!.passwordCanNotBeEmpty,
          labelText: AppLocalizations.of(context)!.password,
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
          errorText: AppLocalizations.of(context)!.pleaseCorrectYourmail,
          labelText: AppLocalizations.of(context)!.emailAdress,
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
