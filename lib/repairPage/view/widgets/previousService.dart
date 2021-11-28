import 'package:flutter/material.dart';

class PreviousServices extends StatelessWidget {
  const PreviousServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Previous Service',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(flex: 1, child: SizedBox()),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: size.width,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Service ID: i321312'),
                        Text('Date arrived: 27/11/2021'),
                        Text('Date delivered: 29/11/2021'),
                        Text(
                          'Summary: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ',
                          maxLines: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(flex: 1, child: SizedBox()),
          Expanded(flex: 2, child: Image.asset('assets/receipt.png')),
          Expanded(flex: 2, child: SizedBox()),
        ],
      ),
    );
  }
}
