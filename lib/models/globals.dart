import 'package:aaveg_app/models/charts.dart';
import 'package:aaveg_app/models/rankwrap.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ScoreWrap {
  final List<RankWrap> list;
  final List<charts.Series<Charts, String>> series;

  ScoreWrap(this.list, this.series);
}
