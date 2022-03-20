import 'package:aaveg_app/models/charts.dart';
import 'package:aaveg_app/models/rankwrap.dart';
import 'package:aaveg_app/models/score_response.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ScorePage extends StatelessWidget {
  final List<charts.Series<Charts, String>> series;
  final List<RankWrap> list;
  final String clan;
  final EventsScore eventsScore;
  ScorePage(this.series, this.list, this.clan, this.eventsScore, {Key? key})
      : super(key: key);
  final icon = {
    'Agni': 'assets/images/Agni.webp',
    'Aakash': 'assets/images/Aakash.webp',
    'Jal': 'assets/images/Jal.webp',
    'Prithvi': 'assets/images/Prithvi.webp',
    'Vayu': 'assets/images/Vayu.webp',
  };
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      Expanded(
          flex: 1,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(4.0),
            children: list
                .map((ranked) => Card(
                    margin: EdgeInsets.all(10),
                    color: Colors.grey.withAlpha(1321),
                    child: Center(
                        child: Stack(children: [
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Image.asset(icon[ranked.clan]!)),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(ranked.rank,
                              style: TextStyle(
                                  color: Colors.grey.shade300,
                                  fontStyle: FontStyle.italic,
                                  fontSize: size.height * 0.02,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center)),
                    ]))))
                .toList(),
          )),
      Expanded(
          flex: 3,
          child: charts.BarChart(
            series,
            animationDuration: Duration(seconds: 2),
            domainAxis: charts.OrdinalAxisSpec(
                renderSpec: charts.SmallTickRendererSpec(
                    labelStyle: charts.TextStyleSpec(
                        color: charts.MaterialPalette.white),
                    lineStyle: charts.LineStyleSpec(
                        thickness: 1,
                        color: charts.MaterialPalette.gray.shade700))),
            barRendererDecorator: charts.BarLabelDecorator<String>(
                labelAnchor: charts.BarLabelAnchor.middle,
                insideLabelStyleSpec: charts.TextStyleSpec(
                    color: charts.MaterialPalette.black.darker)),
            primaryMeasureAxis: charts.NumericAxisSpec(
                showAxisLine: true,
                renderSpec: charts.GridlineRendererSpec(
                    labelStyle: charts.TextStyleSpec(
                        color: charts.MaterialPalette.white),
                    lineStyle: charts.LineStyleSpec(
                      color: charts.MaterialPalette.gray.shade400,
                    ))),
          )),
    ]);
  }
}
