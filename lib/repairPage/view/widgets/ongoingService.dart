import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service_repository/template_repository.dart';
import 'package:template/repairPage/bloc/bloc/service_bloc.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OngoingService extends StatefulWidget {
  const OngoingService({Key? key}) : super(key: key);

  @override
  _OngoingServiceState createState() => _OngoingServiceState();
}

class _OngoingServiceState extends State<OngoingService> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDetails();
  }

  Future? fetchDetails() async {
    BlocProvider.of<ServiceBloc>(context).add(GetOngoingService());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<ServiceBloc, ServiceState>(
      builder: (context, state) {
        return state.ongoingServiceFetchedStatus ==
                OngoingServiceFetchedStatus.success
            ? Scaffold(
                appBar: AppBar(
                  title: Text(
                    AppLocalizations.of(context)!.onGoingService,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: size.width,
                        height: size.height * 0.14,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!
                                          .estimatedTime,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'TBD',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!.serviceID,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      state.currentOwnership!.ongoingService,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            CustomSignalTile(
                              isLast: false,
                              isFirst: true,
                              title: AppLocalizations.of(context)!
                                  .engineMaintenance,
                              description: AppLocalizations.of(context)!
                                  .engineOilChangeFilterChange,
                              order: 1,
                              order_place: state.currentService!.phase,
                            ),
                            CustomSignalTile(
                              isLast: false,
                              isFirst: false,
                              title: AppLocalizations.of(context)!.fuelFilter,
                              description: AppLocalizations.of(context)!
                                  .maintenanceAndIfNecessaryReplacementTheFuelFilter,
                              order: 2,
                              order_place: state.currentService!.phase,
                            ),
                            CustomSignalTile(
                              isLast: false,
                              isFirst: false,
                              title: AppLocalizations.of(context)!
                                  .completionOfExtraServices,
                              description: AppLocalizations.of(context)!
                                  .completingAndArrangingMaintenanceForExtraRequestedServices,
                              order: 3,
                              order_place: state.currentService!.phase,
                            ),
                            CustomSignalTile(
                              isLast: false,
                              isFirst: false,
                              title: AppLocalizations.of(context)!.testsOfCare,
                              description: AppLocalizations.of(context)!
                                  .makingTheTestsOfTheMaintenanceDoneAndCheckingTheAccuracy,
                              order: 4,
                              order_place: state.currentService!.phase,
                            ),
                            CustomSignalTile(
                              isLast: true,
                              isFirst: false,
                              title: AppLocalizations.of(context)!
                                  .serviceCompletion,
                              description: AppLocalizations.of(context)!
                                  .serviceCompleted,
                              order: 5,
                              order_place: state.currentService!.phase,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Ongoing Service',
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

class CustomSignalTile extends StatelessWidget {
  const CustomSignalTile(
      {this.isFirst,
      this.isLast,
      this.description,
      this.title,
      this.order,
      this.order_place});
  final bool? isFirst;
  final bool? isLast;
  final String? title;
  final String? description;
  final int? order;
  final int? order_place;
  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst!,
      isLast: isLast!,
      alignment: TimelineAlign.start,
      indicatorStyle: IndicatorStyle(
        color: order! > order_place!
            ? Theme.of(context).dividerColor
            : Theme.of(context).iconTheme.color!,
      ),
      afterLineStyle: LineStyle(
        thickness: 3,
        color: order! > order_place!
            ? Theme.of(context).dividerColor
            : Theme.of(context).iconTheme.color!,
      ),
      beforeLineStyle: LineStyle(
        thickness: 3,
        color: order! > order_place!
            ? Theme.of(context).dividerColor
            : Theme.of(context).iconTheme.color!,
      ),
      endChild: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(description!),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
