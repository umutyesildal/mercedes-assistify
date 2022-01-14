import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:template/constants.dart';
import 'package:template/preferencesBloc/preferences_bloc.dart';
import 'package:template/router.dart';
import 'package:template/settingsPage/bloc/settings_bloc.dart';
import 'widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsMain extends StatefulWidget {
  static String routeName = 'Settings Page';

  @override
  State<SettingsMain> createState() => _SettingsMainState();
}

class _SettingsMainState extends State<SettingsMain> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDetails();
  }

  Future? fetchDetails() async {
    BlocProvider.of<SettingsBloc>(context).add(GetUserName());
  }

  final GlobalKey<ExpansionTileCardState> card0 = GlobalKey();

  final GlobalKey<ExpansionTileCardState> card1 = GlobalKey();

  final GlobalKey<ExpansionTileCardState> card2 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.settings,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              SpaceBetweenWidgets(),
              Padding(
                  padding: const EdgeInsets.only(right: 40.0, left: 40.0),
                  child: NameAndPhoto()),
              SpaceBetweenWidgets(),
              DividerWithPadding(),
              Padding(
                padding: const EdgeInsets.only(right: 40.0, left: 40.0),
                child: ExpansionTileCard(
                  elevation: 0,
                  key: card0,
                  initiallyExpanded: false,
                  onExpansionChanged: (value) {
                    if (value) {
                      Future.delayed(const Duration(milliseconds: 500), () {
                        card1.currentState?.collapse();
                        card2.currentState?.collapse();
                      });
                    }
                  },
                  trailing: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.transparent,
                  ),
                  leading: Icon(
                    Icons.keyboard_arrow_down,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.appearance,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  children: <Widget>[
                    ExpansionTileItem(
                      givenText:
                          AppLocalizations.of(context)!.languageAndCountry,
                      givenFunction: () {
                        Navigator.of(context)
                            .pushNamed(RouteGenerator.languageRoute);
                      },
                    ),
                    ExpansionTileItem(
                      givenText: AppLocalizations.of(context)!.darkMode,
                      givenFunction: () {
                        Navigator.of(context)
                            .pushNamed(RouteGenerator.darkModeRoute);
                      },
                    ),
                  ],
                ),
              ),
              DividerWithPadding(),
              Padding(
                padding: const EdgeInsets.only(right: 40.0, left: 40.0),
                child: ExpansionTileCard(
                  onExpansionChanged: (value) {
                    if (value) {
                      Future.delayed(const Duration(milliseconds: 500), () {
                        card0.currentState?.collapse();
                        card2.currentState?.collapse();
                      });
                    }
                  },
                  key: card1,
                  elevation: 0,
                  initiallyExpanded: false,
                  trailing: Icon(Icons.keyboard_arrow_down,
                      color: Colors.transparent),
                  leading: Icon(
                    Icons.keyboard_arrow_down,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.help,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  children: <Widget>[
                    ExpansionTileItem(
                      givenText: AppLocalizations.of(context)!.helpFAQ,
                      givenFunction: () {},
                    ),
                    ExpansionTileItem(
                      givenText: AppLocalizations.of(context)!.contactSupport,
                      givenFunction: () {},
                    ),
                    ExpansionTileItem(
                      givenText: AppLocalizations.of(context)!.feedback,
                      givenFunction: () {},
                    ),
                  ],
                ),
              ),
              DividerWithPadding(),
              Padding(
                padding: const EdgeInsets.only(right: 40.0, left: 40.0),
                child: ExpansionTileCard(
                  elevation: 0,
                  onExpansionChanged: (value) {
                    if (value) {
                      Future.delayed(const Duration(milliseconds: 500), () {
                        card0.currentState?.collapse();
                        card1.currentState?.collapse();
                      });
                    }
                  },
                  key: card2,
                  initiallyExpanded: false,
                  trailing: Icon(Icons.keyboard_arrow_down,
                      color: Colors.transparent),
                  leading: Icon(
                    Icons.keyboard_arrow_down,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.legal,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  children: <Widget>[
                    ExpansionTileItem(
                      givenText: AppLocalizations.of(context)!.privacyPolicy,
                      givenFunction: () {},
                    ),
                    ExpansionTileItem(
                      givenText: AppLocalizations.of(context)!.termsConditions,
                      givenFunction: () {},
                    ),
                    ExpansionTileItem(
                      givenText: AppLocalizations.of(context)!.legalNotice,
                      givenFunction: () async {
                        if (await canLaunch(kLegalUrl)) await launch(kLegalUrl);
                      },
                    ),
                    ExpansionTileItem(
                      givenText: AppLocalizations.of(context)!.guidelines,
                      givenFunction: () {},
                    ),
                    ExpansionTileItem(
                      givenText: AppLocalizations.of(context)!.licenses,
                      givenFunction: () {},
                    ),
                  ],
                ),
              ),
              DividerWithPadding(),
              BlocBuilder<PreferencesBloc, PreferencesState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 40.0, left: 40.0),
                    child: ExpansionTileCard(
                      onExpansionChanged: (bool x) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            RouteGenerator.changeOwnership, (route) => false);
                      },
                      elevation: 0,
                      initiallyExpanded: false,
                      trailing: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.transparent,
                      ),
                      leading: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.transparent,
                      ),
                      title: Text(
                        'Change ownership',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
              DividerWithPadding(),
              BlocBuilder<PreferencesBloc, PreferencesState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 40.0, left: 40.0),
                    child: ExpansionTileCard(
                      onExpansionChanged: (bool x) {
                        print(x);
                        BlocProvider.of<PreferencesBloc>(context)
                            .add(AuthChangedEvent(auth: false));

                        Navigator.of(context).pushNamedAndRemoveUntil(
                            RouteGenerator.loginRoute, (route) => false);
                      },
                      elevation: 0,
                      initiallyExpanded: false,
                      trailing: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.transparent,
                      ),
                      leading: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.transparent,
                      ),
                      title: Text(
                        AppLocalizations.of(context)!.logout,
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NameAndPhoto extends StatelessWidget {
  const NameAndPhoto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 70, backgroundColor: Theme.of(context).accentColor),
            SizedBox(
              height: 10,
            ),
            Text(
              state.nameStatus == NameFetchedStatus.success
                  ? state.user!.name
                  : '',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        );
      },
    );
  }
}

/// For now its only for Notifications.
class SettingsTextRow extends StatelessWidget {
  const SettingsTextRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40, left: 40, top: 12, bottom: 12),
      child: Row(
        children: [
          Icon(
            Icons.keyboard_arrow_down,
          ),
          SizedBox(
            width: 30,
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              AppLocalizations.of(context)!.notifications,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class DividerWithPadding extends StatelessWidget {
  const DividerWithPadding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 25.0),
      child: Divider(
        thickness: 1.5,
      ),
    );
  }
}

class UsernameText extends StatelessWidget {
  const UsernameText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppLocalizations.of(context)!.username,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SpaceBetweenWidgets extends StatelessWidget {
  const SpaceBetweenWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
    );
  }
}
