import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:service_repository/template_repository.dart';
import 'package:template/repairPage/bloc/service_bloc.dart';
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
            title: Text('Book Service'),
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
                            'Service Type',
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
                                child: Text('Service A'),
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
                                child: Text('Service B'),
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
                            'Extra Services',
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
                                    child: Center(child: Text('Brakes')),
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
                                    child: Center(child: Text('Oil')),
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
                                    child: Center(child: Text('Tires')),
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
                                    child: Center(child: Text('Cleaning')),
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
                                    child: Center(child: Text('Battery')),
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
                                    child: Center(child: Text('Headlights')),
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
                            'Date & Time',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          _selectedDate == null
                              ? ElevatedButton(
                                  child: Text('Press here to select a day'),
                                  onPressed: _pickDateDialog)
                              : SizedBox(),
                          _selectedDate !=
                                  null //ternary expression to check if date is null
                              ? Text(
                                  _selectedDate ==
                                          null //ternary expression to check if date is null
                                      ? 'No date was chosen!'
                                      : '${DateFormat.yMMMd().format(_selectedDate!)}',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                )
                              : SizedBox(),
                          SizedBox(
                            height: 12,
                          ),
                          Text('Available Times'),
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
                    ServiceEntity service = ServiceEntity(
                        gelis_tarihi: _selectedDate.toString() + '12',
                        teslim_tarihi: '27/11/2021',
                        ownership: 'a3802021',
                        maintenance: ['brakes', 'oil', 'tires']);
                    //  BlocProvider.of<ServiceBloc>(context)
                    //      .add((AddServicesEvent(givenService: service)));

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
                                          Text('Service Appointment \n Created',
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
                                      'Continue',
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
                                          'Book a Service',
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
                                          'Book a service for your car.',
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
