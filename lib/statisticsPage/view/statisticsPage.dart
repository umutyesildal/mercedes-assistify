import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  List<KilometerMonth> data = [
    KilometerMonth('Jan', 350),
    KilometerMonth('Feb', 600),
    KilometerMonth('Mar', 900),
    KilometerMonth('Apr', 300),
    KilometerMonth('May', 600)
  ];

  String averageGiver(List<KilometerMonth> data) {
    double sumOfMonths = 0;
    int length = data.length;
    for (var item in data) {
      sumOfMonths = sumOfMonths + item.monthlyKilometer;
    }
    sumOfMonths = sumOfMonths / length;

    return sumOfMonths.round().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.statistics,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          //Initialize the chart widget
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            // Chart title
            title: ChartTitle(
                text: AppLocalizations.of(context)!.monthlyKilometerUsage),
            // Enable legend
            legend: Legend(isVisible: true),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<KilometerMonth, String>>[
              LineSeries<KilometerMonth, String>(
                  dataSource: data,
                  xValueMapper: (KilometerMonth monthlyKilometer, _) =>
                      monthlyKilometer.month,
                  yValueMapper: (KilometerMonth monthlyKilometer, _) =>
                      monthlyKilometer.monthlyKilometer,
                  name: AppLocalizations.of(context)!.kilometer,
                  // Enable data label
                  dataLabelSettings: DataLabelSettings(isVisible: true))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.monthlyKilometerUsage,
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5),
                        borderRadius: BorderRadius.circular(6)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        averageGiver(data),
                        style: TextStyle(fontSize: 24),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class KilometerMonth {
  KilometerMonth(this.month, this.monthlyKilometer);

  final String month;
  final int monthlyKilometer;
}
