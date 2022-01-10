import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:template/carPage/carPage.dart';
import 'package:template/router.dart';

class RepairPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<RepairPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<CarBloc, CarState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.service,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(RouteGenerator.bookServiceRoute);
                },
                child: Container(
                    width: size.width,
                    height: size.height * 0.15,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child:
                                          Icon(Icons.room_service, size: 32)),
                                  Expanded(
                                    flex: 8,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!
                                              .bookAService,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          AppLocalizations.of(context)!
                                              .bookAServiceForYourCar,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(RouteGenerator.onGoingServiceRoute);
                },
                child: Container(
                  width: size.width,
                  height: size.height * 0.15,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: SizedBox(),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child:
                                        Icon(Icons.nordic_walking, size: 32)),
                                Expanded(
                                  flex: 8,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!
                                            .onGoingService,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!
                                            .checkHowYouCarDoing,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
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
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(RouteGenerator.allPreviousServices);
                },
                child: Container(
                  width: size.width,
                  height: size.height * 0.15,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: SizedBox(),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Icon(Icons.history, size: 32)),
                                Expanded(
                                  flex: 8,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!
                                            .checkPreviousService,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!
                                            .lookAtYourHistory,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
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
                ),
              ),
              Center(
                child: Image.asset('assets/service.png'),
              )
            ],
          ),
        );
      },
    );
  }
}
