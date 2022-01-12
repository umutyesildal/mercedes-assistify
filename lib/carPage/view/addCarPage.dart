import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:template/loginSignup/bloc/auth_bloc.dart';
import 'package:template/loginSignup/models/models.dart';
import 'package:template/loginSignup/view/widgets/widgets.dart';
import 'package:template/router.dart';

class AddCar extends StatelessWidget {
  const AddCar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.ownershipStatus == OwnershipStatus.fail) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  'Something wrong happened',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
              ),
            );
        }
        if (state.ownershipStatus == OwnershipStatus.success) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              RouteGenerator.landingRoute, (route) => false);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
          AppLocalizations.of(context)!.addCar,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/offroad.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Center(
                child: Container(
                  width: size.width * 0.7,
                  height: size.height * 0.225,
                  child: Card(
                    elevation: 15,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Expanded(child: AddOwnershipTextField()),
                          AddOwnershipButton()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddOwnershipButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return ElevatedButton(
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(OwnershipSubmitted());
            },
            child: Text(AppLocalizations.of(context)!.login));
      },
    );
  }
}

class AddOwnershipTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previous, current) =>
          previous.ownershipAdd != current.ownershipAdd,
      builder: (context, state) {
        return AuthField(
          isObsecure: false,
          isError: false,
          errorText: AppLocalizations.of(context)!.pleaseEnterOwnership,
          labelText: AppLocalizations.of(context)!.pleaseEnterOwnership,
          onChangeCallback: (ownership) {
            BlocProvider.of<AuthBloc>(context)
                .add(OwnershipChanged(input: ownership));
          },
        );
      },
    );
  }
}
