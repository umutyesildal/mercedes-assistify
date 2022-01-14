import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/loginSignup/bloc/auth_bloc.dart';
import 'package:template/router.dart';
import 'package:template/settingsPage/bloc/settings_bloc.dart';

class ChangeOwnership extends StatelessWidget {
  const ChangeOwnership({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AuthBloc _authBloc = BlocProvider.of<AuthBloc>(context);

    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text('Change Ownership')),
          body: Center(
              child: Container(
            height: size.height / 2,
            width: size.width,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(),
                );
              },
              itemCount: state.user!.ownership.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      _authBloc.add(OwnershipChanged(
                          input: state.user!.ownership[index]));
                      BlocProvider.of<AuthBloc>(context)
                          .add(OwnershipSubmitted());
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          RouteGenerator.landingRoute, (route) => false);
                    },
                    child: Center(child: Text(state.user!.ownership[index])));
              },
            ),
          )),
        );
      },
    );
  }
}
