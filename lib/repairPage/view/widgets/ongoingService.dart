import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:icons_helper/icons_helper.dart';

class OngoingService extends StatefulWidget {
  const OngoingService({Key? key}) : super(key: key);

  @override
  _OngoingServiceState createState() => _OngoingServiceState();
}

class _OngoingServiceState extends State<OngoingService> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ongoing Service',
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
                            'ESTIMATED TIME',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '5 days',
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
                            'SERVICE ID',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'i732893210',
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
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return CustomSignalTile(
                    isLast: false,
                    isFirst: false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSignalTile extends StatelessWidget {
  const CustomSignalTile({
    this.isFirst,
    this.isLast,
  });
  final bool? isFirst;
  final bool? isLast;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst!,
      isLast: isLast!,
      alignment: TimelineAlign.start,
      indicatorStyle: IndicatorStyle(
        color: Theme.of(context).iconTheme.color!,
      ),
      afterLineStyle: LineStyle(
        thickness: 3,
      ),
      beforeLineStyle: LineStyle(
        thickness: 3,
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
                  Text('TİTLE'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Description'),
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
