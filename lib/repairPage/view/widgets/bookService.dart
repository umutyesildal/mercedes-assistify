import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookService extends StatefulWidget {
  const BookService({Key? key}) : super(key: key);

  @override
  _BookServiceState createState() => _BookServiceState();
}

class _BookServiceState extends State<BookService> {
  String? dropdownValue = '10k Service';
  DateTime? _selectedDate;
  String? _selectedTime1;
  String? _selectedTime2;

  Future<void> _pickTime1() async {
    final TimeOfDay? result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        _selectedTime1 = result.format(context);
      });
    }
  }

  Future<void> _pickTime2() async {
    final TimeOfDay? result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        _selectedTime2 = result.format(context);
      });
    }
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
              height: size.height * 0.15,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Service Type',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        dropdownColor: Theme.of(context).primaryColor,
                        icon: Icon(
                          Icons.arrow_drop_down_outlined,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.secondary,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>[
                          '10k Service',
                          '100k Service',
                          'Custom Service',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: size.width,
              height: size.height * 0.2,
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
                                  : 'Picked Date: ${DateFormat.yMMMd().format(_selectedDate!)}',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            )
                          : SizedBox(),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _pickTime1();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _selectedTime1 != null
                                      ? _selectedTime1!
                                      : '00.00',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              _pickTime2();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _selectedTime2 != null
                                      ? _selectedTime2!
                                      : '00.00',
                                ),
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
              height: size.height * 0.23,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Notes',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        minLines: 3,
                        maxLines: 5,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: 'Write your notes...',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {}, child: Text('Book a Service Appointment!')),
            )
          ],
        ),
      ),
    );
  }
}
