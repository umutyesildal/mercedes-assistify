import 'package:flutter/material.dart';
import 'package:template/router.dart';

class AllPreviousServices extends StatelessWidget {
  const AllPreviousServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Services',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          ServiceRow(
            size: size,
            id: 'ID: i74329942',
            date: 'Date: 27/11/2021 - 13/12/2021',
          ),
          ServiceRow(
            size: size,
            id: 'ID: i74329942',
            date: 'Date: 27/11/2021 - 13/12/2021',
          ),
          ServiceRow(
            size: size,
            id: 'ID: i74329942',
            date: 'Date: 27/11/2021 - 13/12/2021',
          ),
          ServiceRow(
            size: size,
            id: 'ID: i74329942',
            date: 'Date: 27/11/2021 - 13/12/2021',
          ),
          ServiceRow(
            size: size,
            id: 'ID: i74329942',
            date: 'Date: 27/11/2021 - 13/12/2021',
          ),
          ServiceRow(
            size: size,
            id: 'ID: i74329942',
            date: 'Date: 27/11/2021 - 13/12/2021',
          ),
        ],
      ),
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
