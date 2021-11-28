import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/mainBloc/main_bloc.dart';
import '../landingPage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.landing,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Column(
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
              Container(
                width: size.width,
                height: size.height * 0.5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: DefaultTabController(
                      length: 2,
                      child: Scaffold(
                        appBar: AppBar(
                          elevation: 0,
                          toolbarHeight: 5,
                          bottom: TabBar(
                            onTap: (index) {
                              // Tab index when user select it, it start from zero
                            },
                            tabs: [
                              Tab(
                                text: 'Daily',
                              ),
                              Tab(
                                text: 'Technical',
                              ),
                            ],
                          ),
                        ),
                        body: TabBarView(
                          children: [
                            DailyTab(),
                            TechnicalTab(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DailyTab extends StatelessWidget {
  const DailyTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          CustomRowText(
            givenKey: 'Kalan Yakıt',
            givenValue: '116',
          ),
          CustomRowText(
            givenKey: 'Kilometre',
            givenValue: '116',
          ),
          CustomRowText(
            givenKey: 'Ortalama Tüketim',
            givenValue: '116',
          ),
          CustomRowText(
            givenKey: 'Haftalık Kilometre',
            givenValue: '116',
          ),
        ],
      ),
    );
  }
}

class TechnicalTab extends StatelessWidget {
  const TechnicalTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          CustomRowText(
            givenKey: 'Beygir',
            givenValue: '116',
          ),
          CustomRowText(
            givenKey: 'Depo',
            givenValue: '116',
          ),
          CustomRowText(
            givenKey: 'Max Hız',
            givenValue: '116',
          ),
          CustomRowText(
            givenKey: 'Motor',
            givenValue: '116',
          ),
          CustomRowText(
            givenKey: 'Silindir',
            givenValue: '116',
          ),
          CustomRowText(
            givenKey: 'Yakıt',
            givenValue: '116',
          ),
          CustomRowText(
            givenKey: 'Model',
            givenValue: '116',
          ),
        ],
      ),
    );
  }
}

class CustomRowText extends StatelessWidget {
  const CustomRowText({
    required this.givenKey,
    required this.givenValue,
    Key? key,
  }) : super(key: key);

  final String givenKey;
  final String givenValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 1, child: SizedBox()),
          Expanded(
            flex: 6,
            child: Text(
              givenKey,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              givenValue,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(flex: 1, child: SizedBox()),
        ],
      ),
    );
  }
}
