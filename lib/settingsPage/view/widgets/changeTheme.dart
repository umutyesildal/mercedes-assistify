import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:template/mainBloc/main_bloc.dart';

class ChangeTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.theme,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.darkMode,
                        style: TextStyle(fontSize: 20),
                      ),
                      CupertinoSwitch(
                        value: state.darkMode!,
                        onChanged: (value) {
                          BlocProvider.of<MainBloc>(context)
                              .add(ThemeChangedEvent(theme: value));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: SizedBox(),
              )
            ],
          ),
        ),
      );
    });
  }
}
