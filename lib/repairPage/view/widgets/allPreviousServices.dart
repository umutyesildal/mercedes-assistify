import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/repairPage/bloc/bloc/service_bloc.dart';
import 'package:template/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AllPreviousServices extends StatefulWidget {
  const AllPreviousServices({Key? key}) : super(key: key);

  @override
  State<AllPreviousServices> createState() => _AllPreviousServicesState();
}

class _AllPreviousServicesState extends State<AllPreviousServices> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDetails();
  }

  Future? fetchDetails() async {
    BlocProvider.of<ServiceBloc>(context).add(GetAllPreviousServices());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ServiceBloc, ServiceState>(
      builder: (context, state) {
        return state.previousServiceFetchedStatus ==
                PreviousServicesFetchedStatus.success
            ? Scaffold(
                appBar: AppBar(
                  title: Text(
          AppLocalizations.of(context)!.allServices,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                body: ListView.builder(
                  itemCount: state.allPreviousServices!.length,
                  itemBuilder: (context, index) {
                    return ServiceRow(
                      size: size,
                      id: 'ID: ' +
                          state.currentOwnership!.previousServices[index],
                      date: state.allPreviousServices![index].arriveDate,
                    );
                  },
                ))
            : Scaffold(
                appBar: AppBar(
                  title: Text(
                    'All Services',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                body: CircularProgressIndicator(),
              );
      },
    );
  }
}

class ServiceRow extends StatelessWidget {
  const ServiceRow({
    Key? key,
    required this.size,
    required this.id,
    required this.date,
  }) : super(key: key);

  final Size size;
  final String id;
  final String date;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(RouteGenerator.previousService);
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
                      Expanded(flex: 2, child: Icon(Icons.receipt, size: 32)),
                      Expanded(
                        flex: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              id,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              date,
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
    );
  }
}
