import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:template/preferencesBloc/preferences_bloc.dart';

class ChangeLanguage extends StatelessWidget {
  String? getCurrentLocale(String locale) {
    switch (locale) {
      case 'en':
        return 'English';
      case 'de':
        return 'Deutsch';
      case 'tr':
        return 'Turkish';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.settingsLanguage,
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
                        AppLocalizations.of(context)!.settingsLanguage,
                        style: TextStyle(fontSize: 20),
                      ),
                      DropdownButton<String>(
                        items: <String>['English', 'Turkish', 'Deutsch']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        value: getCurrentLocale(state.locale!),
                        onChanged: (value) {
                          String givenLocale;
                          if (value == 'English') {
                            givenLocale = 'en';
                          } else if (value == 'Deutsch') {
                            givenLocale = 'de';
                          } else {
                            givenLocale = 'tr';
                          }
                          BlocProvider.of<PreferencesBloc>(context)
                              .add(LocaleChangedEvent(locale: givenLocale));
                        },
                      )
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
