import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:template/landingPage/landingPage.dart';
import 'package:url_launcher/url_launcher.dart';

class FavoritePage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();
    launchWebView();
  }

  Future? launchWebView() async {
    await launch(
        'https://www.mercedes-benz.com.tr/passengercars/mercedes-benz-cars/dealer-locator.html');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LandingBloc, LandingState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.yourFavorites,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
