import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:maintenance_repository/maintenance_repository.dart';
import 'package:service_repository/template_repository.dart';

import 'package:template/repairPage/bloc/bloc/service_bloc.dart';
import 'package:template/router.dart';

class BookService extends StatefulWidget {
  const BookService({Key? key}) : super(key: key);

  @override
  _BookServiceState createState() => _BookServiceState();
}

class _BookServiceState extends State<BookService> {
  String? dropdownValue = '10k Service';
  DateTime? _selectedDate;

  bool brakes = false;
  bool oil = false;
  bool tires = false;
  bool cleaning = false;
  bool battery = false;
  bool headlights = false;
  bool saat9 = false;
  bool saat11 = false;
  bool saat13 = false;
  bool saat15 = false;
  bool saat17 = false;
  bool saat19 = false;

  bool serviceA = false;
  bool serviceB = false;

  String getHour() {
    if (saat9 == true) {
      return '09.00';
    } else if (saat11 == true) {
      return '11.00';
    } else if (saat13 == true) {
      return '13.00';
    } else if (saat15 == true) {
      return '15.00';
    } else if (saat17 == true) {
      return '17.00';
    } else if (saat19 == true) {
      return '19.00';
    } else {
      return '';
    }
  }

  String getService() {
    if (serviceA == true) {
      return 'Service A';
    } else {
      return 'Service B';
    }
  }

  List<String> getExtraServices() {
    List<String> extraServicesList = [];
    if (brakes == true) {
      extraServicesList.add('Brakes');
    }
    if (oil == true) {
      extraServicesList.add('Oil');
    }
    if (tires == true) {
      extraServicesList.add('Tires');
    }
    if (cleaning == true) {
      extraServicesList.add('Cleaning');
    }
    if (battery == true) {
      extraServicesList.add('Battery');
    }
    if (headlights == true) {
      extraServicesList.add('Headlights');
    }
    return extraServicesList;
  }

  //Method for showing the date picker
  void _pickDateDialog() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            //which date will display when user open the picker
            firstDate: DateTime.now(),
            //what will be the previous supported year in picker
            lastDate: DateTime(
                2023)) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        //for rebuilding the ui
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<ServiceBloc, ServiceState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.bookService),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.14,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.seviceType),
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: serviceA == false
                                        ? MaterialStateProperty.all<Color>(
                                            Theme.of(context).primaryColor)
                                        : MaterialStateProperty.all<Color>(
                                            Theme.of(context)
                                                .colorScheme
                                                .secondary)),
                                onPressed: () {
                                  setState(() {
                                    serviceA = true;
                                    serviceB = false;
                                  });
                                },
                                child: Text(AppLocalizations.of(context)!.serviceA),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: serviceB == false
                                        ? MaterialStateProperty.all<Color>(
                                            Theme.of(context).primaryColor)
                                        : MaterialStateProperty.all<Color>(
                                            Theme.of(context)
                                                .colorScheme
                                                .secondary)),
                                onPressed: () {
                                  setState(() {
                                    serviceA = false;
                                    serviceB = true;
                                  });
                                },
                                child: Text(AppLocalizations.of(context)!.serviceB),
                              ),
                              SizedBox(),
                              SizedBox(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.23,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.extraServices,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    brakes = !brakes;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: brakes
                                        ? Theme.of(context)
                                            .colorScheme
                                            .secondary
                                        : Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Center(child: Text(AppLocalizations.of(context)!.brakes)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    oil = !oil;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: oil
                                        ? Theme.of(context)
                                            .colorScheme
                                            .secondary
                                        : Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Center(child: Text(AppLocalizations.of(context)!.oil)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    tires = !tires;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: tires
                                          ? Theme.of(context)
                                              .colorScheme
                                              .secondary
                                          : Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Center(child: Text(AppLocalizations.of(context)!.tires)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    cleaning = !cleaning;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: cleaning
                                        ? Theme.of(context)
                                            .colorScheme
                                            .secondary
                                        : Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Center(child: Text(AppLocalizations.of(context)!.cleaning)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    battery = !battery;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: battery
                                        ? Theme.of(context)
                                            .colorScheme
                                            .secondary
                                        : Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Center(child: Text(AppLocalizations.of(context)!.battery)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    headlights = !headlights;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: headlights
                                          ? Theme.of(context)
                                              .colorScheme
                                              .secondary
                                          : Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Center(child: Text(AppLocalizations.of(context)!.headlights)),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.25,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.dateTime,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          _selectedDate == null
                              ? ElevatedButton(
                                  child: Text(AppLocalizations.of(context)!.pressHereToSelectADay),
                                  onPressed: _pickDateDialog)
                              : SizedBox(),
                          _selectedDate !=
                                  null //ternary expression to check if date is null
                              ? Text(
                                  _selectedDate ==
                                          null //ternary expression to check if date is null
                                      ? AppLocalizations.of(context)!.noDateWasChosen
                                      : '${DateFormat.yMMMd().format(_selectedDate!)}',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                )
                              : SizedBox(),
                          SizedBox(
                            height: 12,
                          ),
                          Text(AppLocalizations.of(context)!.availableTimes),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            width: size.width,
                            height: size.height * 0.04,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      saat9 = true;
                                      saat11 = false;
                                      saat13 = false;
                                      saat15 = false;
                                      saat17 = false;
                                      saat19 = false;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: saat9
                                            ? Theme.of(context)
                                                .colorScheme
                                                .secondary
                                            : Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '09.00',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      saat9 = false;
                                      saat11 = true;
                                      saat13 = false;
                                      saat15 = false;
                                      saat17 = false;
                                      saat19 = false;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: saat11
                                            ? Theme.of(context)
                                                .colorScheme
                                                .secondary
                                            : Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '11.00',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      saat9 = false;
                                      saat11 = false;
                                      saat13 = true;
                                      saat15 = false;
                                      saat17 = false;
                                      saat19 = false;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: saat13
                                            ? Theme.of(context)
                                                .colorScheme
                                                .secondary
                                            : Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '13.00',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      saat9 = false;
                                      saat11 = false;
                                      saat13 = false;
                                      saat15 = true;
                                      saat17 = false;
                                      saat19 = false;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: saat15
                                            ? Theme.of(context)
                                                .colorScheme
                                                .secondary
                                            : Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '15.00',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      saat9 = false;
                                      saat11 = false;
                                      saat13 = false;
                                      saat15 = false;
                                      saat17 = true;
                                      saat19 = false;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: saat17
                                            ? Theme.of(context)
                                                .colorScheme
                                                .secondary
                                            : Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '17.00',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      saat9 = false;
                                      saat11 = false;
                                      saat13 = false;
                                      saat15 = false;
                                      saat17 = false;
                                      saat19 = true;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: saat19
                                            ? Theme.of(context)
                                                .colorScheme
                                                .secondary
                                            : Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '19.00',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    String tarih = (_selectedDate!.day.toString() +
                        '/' +
                        _selectedDate!.month.toString() +
                        '/' +
                        _selectedDate!.year.toString());

                    String gelis_tarihi = tarih + ' ' + getHour();
                    ServiceEntity service = ServiceEntity(
                        service_id: 'fdsafdsfds',
                        gelis_tarihi: gelis_tarihi,
                        teslim_tarihi: '15/12/2021',
                        ownership: 'a3802021',
                        bakim_asamasi: 1,
                        maintenance: MaintenanceEntity(
                            extraServices: getExtraServices(),
                            serviceType: getService()));

                    BlocProvider.of<ServiceBloc>(context)
                        .add((SendService(service: service)));

                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              title: SizedBox(
                                height: size.height * .2,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(AppLocalizations.of(context)!.serviceAppointmentCreated,
                                              style: TextStyle(
                                                  color: Colors.green)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              contentPadding: EdgeInsets.zero,
                              content: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                child: ElevatedButton(
                                    onPressed: () async {
                                      Navigator.popAndPushNamed(
                                          context, RouteGenerator.landingRoute);
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)!.continue, // HATA OLABİLİR
                                      style: TextStyle(fontSize: 18),
                                    )),
                              ),
                            ));
                  },
                  child: Container(
                      width: size.width,
                      height: size.height * 0.15,
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
                                    flex: 1,
                                    child: SizedBox(),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!.bookAService,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            fontSize: 22,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          AppLocalizations.of(context)!.bookAServiceForYourCar,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child:
                                        Icon(Icons.arrow_forward_ios, size: 32),
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
                      )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
