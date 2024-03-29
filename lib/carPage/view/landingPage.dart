import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:template/carPage/carPage.dart';
import 'package:template/preferencesBloc/preferences_bloc.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDetails();
  }

  Future? fetchDetails() async {
    BlocProvider.of<CarBloc>(context).add(GetOwnershipAndCar());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<CarBloc, CarState>(
      builder: (context, state) {
        return state.OwnershipStatus == OwnershipFetchedStatus.success
            ? Scaffold(
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
                                      text: AppLocalizations.of(context)!.daily,
                                    ),
                                    Tab(
                                      text: AppLocalizations.of(context)!
                                          .technical,
                                      // context çalışmadı.
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
              )
            : Scaffold(
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
                        child: Center(
                          child: CircularProgressIndicator(),
                        )),
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
    return BlocBuilder<CarBloc, CarState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              CustomRowText(
                givenKey: AppLocalizations.of(context)!.remainingFuel,
                givenValue: state.currentCar!.remainingFuel,
              ),
              CustomRowText(
                givenKey: AppLocalizations.of(context)!.kilometer,
                givenValue: state.currentCar!.kilometer,
              ),
              CustomRowText(
                givenKey: AppLocalizations.of(context)!.averageConsumption,

                givenValue: state.currentCar!.averageConsumption + "L/ 100 KM",

              ),
              CustomRowText(
                givenKey: AppLocalizations.of(context)!.weeklyKilometer,
                givenValue: state.currentCar!.weeklyKilometer,
              ),
            ],
          ),
        );
      },
    ); //BlockBuilder 
  }
}

class TechnicalTab extends StatelessWidget {
  const TechnicalTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarBloc, CarState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              CustomRowText(
                givenKey: AppLocalizations.of(context)!.horsepower,
                givenValue: state.currentCar!.horsepower,
              ),
              CustomRowText(
                givenKey: AppLocalizations.of(context)!.tank,
                givenValue: state.currentCar!.tank,
              ),
              CustomRowText(
                givenKey: AppLocalizations.of(context)!.maxSpeed,
                givenValue: state.currentCar!.maxSpeed,
              ),
              CustomRowText(
                givenKey: AppLocalizations.of(context)!.engine,
                givenValue: state.currentCar!.engine,
              ),
              CustomRowText(
                givenKey: AppLocalizations.of(context)!.cylinder,
                givenValue: state.currentCar!.cylinder,
              ),
              CustomRowText(
                  givenKey: AppLocalizations.of(context)!.fuel,
                  givenValue: state.currentCar!.fuel),
              CustomRowText(
                givenKey: AppLocalizations.of(context)!.model,
                givenValue: state.currentCar!.model,
              ),
            ],
          ),
        );
      },
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
          Expanded(flex: 2, child: SizedBox()),
          Expanded(
            flex: 8,
            child: Text(
              givenKey,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Expanded(flex: 2, child: SizedBox()),
          Expanded(
            flex: 8,
            child: Text(
              givenValue,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(flex: 2, child: SizedBox()),
        ],
      ),
    );
  }
}
