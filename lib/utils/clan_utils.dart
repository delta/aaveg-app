import 'package:aaveg_app/models/game_response.dart';
import 'package:aaveg_app/models/leaderboard_wrap.dart';
import 'package:aaveg_app/models/rankwrap.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:aaveg_app/models/charts.dart';
import 'package:aaveg_app/models/cupdata.dart';
import 'package:aaveg_app/models/events_response.dart';
import 'package:aaveg_app/models/globals.dart';
import 'package:aaveg_app/models/score_response.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  Color getColors(String clan) {
    Color color = Colors.purple;
    switch (clan) {
      case 'Agni':
        color = Colors.deepOrange[800]!;
        break;
      case 'Aakash':
        color = Colors.purple;
        break;
      case 'Jal':
        color = Colors.blue[400]!;
        break;
      case 'Prithvi':
        color = Colors.green[600]!;
        break;
      case 'Vayu':
        color = Colors.lightBlue[100]!;
        break;
    }
    return color;
  }

  charts.Color getChartColor(String clan) {
    charts.Color color = charts.MaterialPalette.white;
    switch (clan) {
      case 'Agni':
        color = charts.MaterialPalette.red.shadeDefault;
        break;
      case 'Aakash':
        color = charts.MaterialPalette.purple.shadeDefault;
        break;
      case 'Jal':
        color = charts.MaterialPalette.blue.shadeDefault.darker;
        break;
      case 'Prithvi':
        color = charts.MaterialPalette.green.shadeDefault;
        break;
      case 'Vayu':
        color = charts.MaterialPalette.blue.shadeDefault.lighter;
        break;
    }
    return color;
  }

  charts.Color getChartColor2(String clan) {
    charts.Color color = charts.MaterialPalette.white;
    switch (clan) {
      case 'Agni':
        color = charts.MaterialPalette.red.shadeDefault.lighter;
        break;
      case 'Aakash':
        color = charts.MaterialPalette.purple.shadeDefault.lighter;
        break;
      case 'Jal':
        color = charts.MaterialPalette.blue.shadeDefault;
        break;
      case 'Prithvi':
        color = charts.MaterialPalette.green.shadeDefault.lighter;
        break;
      case 'Vayu':
        color = charts.MaterialPalette.blue.shadeDefault.lighter;
        break;
    }
    return color;
  }

  String getRank(String myclan, Map<String, dynamic> map) {
    if (map.keys.contains('event_name')) map.remove('event_name');
    List<Charts> list = List<Charts>.empty(growable: true);
    list.add(Charts('Aakash', map['Aakash'], null));
    list.add(Charts('Agni', map['Agni'], null));
    list.add(Charts('Jal', map['Jal'], null));
    list.add(Charts('Prithvi', map['Prithvi'], null));
    list.add(Charts('Vayu', map['Vayu'], null));

    list.sort((b, a) => a.value.compareTo(b.value));

    List<RankWrap> ranked = List<RankWrap>.empty(growable: true);
    for (int i = 0; i < list.length; ++i) {
      if (i == 0) {
        ranked.add(RankWrap(list[0].label, '1'));
      } else {
        if (list[i - 1].value == list[i].value) {
          ranked.add(RankWrap(list[i].label, ranked[i - 1].rank));
        } else {
          ranked.add(RankWrap(
              list[i].label, (int.parse(ranked[i - 1].rank) + 1).toString()));
        }
      }
    }
    var rank = '0';
    for (var element in ranked) {
      if (element.clan == myclan) rank = element.rank;
    }
    return rank;
  }

  String getSuperScript(int rank) {
    var sup = 'th';
    switch (rank) {
      case 1:
        sup = 'st';
        break;
      case 2:
        sup = 'nd';
        break;
      case 3:
        sup = 'rd';
        break;
    }
    return sup;
  }

  String getClanLogo(String value) {
    switch (value) {
      case 'Agni':
        return 'assets/images/Agni.webp';
      case 'Aakash':
        return 'assets/images/Aakash.webp';
      case 'Jal':
        return 'assets/images/Jal.webp';
      case 'Prithvi':
        return 'assets/images/Prithvi.webp';
      case 'Vayu':
        return 'assets/images/Vayu.webp';
      default:
        return 'assets/images/Agni.webp';
    }
  }

  List<CupData> getCupList(String myclan, ScoresResponse scores) => [
        CupData('assets/images/culcupsss.webp', 'Overall',
            getRank(myclan, scores.total!.toJson())),
        CupData('assets/images/culcupss.webp', 'Culturals',
            getRank(myclan, scores.standings!.culturals.toJson())),
        CupData('assets/images/culcups.webp', 'Spectrum',
            getRank(myclan, scores.standings!.spectrum.toJson())),
      ];

  Map<String, List<Event>>? sortCluster(List<EventsByC> list) {
    Map<String, List<Event>> clusterMap = <String, List<Event>>{};

    // if (list == null) return null;

    for (final a in list) {
      for (final b in a.events!) {
        String s = b.cluster[0].name;
        if (clusterMap.containsKey(s)) {
          clusterMap.update(s, (value) {
            value.add(b);
            return value;
          });
        } else {
          clusterMap.putIfAbsent(s, () {
            List<Event> clist = List.empty(growable: true);
            clist.add(b);
            return clist;
          });
        }
      }
    }

    return rearrangeCluster(clusterMap);
  }

  Map<String, List<Event>> rearrangeCluster(Map<String, List<Event>> cluster) {
    Map<String, List<Event>> newcluster = <String, List<Event>>{};
    var sortedCluster = [
      'Music and Dance',
      'Media',
      'Art',
      'Lits',
      'Miscellaneous',
      'Filmography and Dramatics'
    ];

    for (int i = 0; i < sortedCluster.length; ++i) {
      cluster.forEach((key, value) {
        if (key == sortedCluster[i]) {
          newcluster.putIfAbsent(key, () => cluster[key]!);
        }
      });
    }
    return newcluster;
  }

  Map<String, String> clusterIcons() => {
        'Music and Dance': 'assets/images/DanceandMusic.png',
        'Media': 'assets/images/Gaming.png',
        'Art': 'assets/images/Arts.png',
        'Lits': 'assets/images/Lits.png',
        'Miscellaneous': 'assets/images/Miscel.png',
        'Filmography and Dramatics': 'assets/images/Filmanddrama.png'
      };

  void snackResponse(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 32,
        backgroundColor: Colors.grey.shade900,
        duration: const Duration(milliseconds: 1000),
        content: Text(
          message,
          textAlign: TextAlign.center,
        )));
  }

  List<Charts> clanList(ScoresResponse res, int i) {
    List<Charts> list = List<Charts>.empty(growable: true);
    switch (i) {
      case 1:
        list = [
          Charts('Aakash', res.total!.aakash!, getChartColor2('Aakash')),
          Charts('Agni', res.total!.agni!, getChartColor2('Agni')),
          Charts('Jal', res.total!.jal!, getChartColor2('Jal')),
          Charts('Vayu', res.total!.vayu!, getChartColor2('Vayu')),
          Charts('Prithvi', res.total!.prithvi!, getChartColor2('Prithvi'))
        ];
        break;
      case 2:
        list = [
          Charts('Aakash', res.standings!.culturals.aakash!,
              getChartColor2('Aakash')),
          Charts(
              'Agni', res.standings!.culturals.agni!, getChartColor2('Agni')),
          Charts('Jal', res.standings!.culturals.jal!, getChartColor2('Jal')),
          Charts(
              'Vayu', res.standings!.culturals.vayu!, getChartColor2('Vayu')),
          Charts('Prithvi', res.standings!.culturals.prithvi!,
              getChartColor2('Prithvi'))
        ];
        break;
      case 3:
        list = [
          Charts('Aakash', res.standings!.spectrum.aakash!,
              getChartColor2('Aakash')),
          Charts('Agni', res.standings!.spectrum.agni!, getChartColor2('Agni')),
          Charts('Jal', res.standings!.spectrum.jal!, getChartColor2('Jal')),
          Charts('Vayu', res.standings!.spectrum.vayu!, getChartColor2('Vayu')),
          Charts('Prithvi', res.standings!.spectrum.prithvi!,
              getChartColor2('Prithvi'))
        ];
        break;
      default:
        return [
          Charts('Aakash', res.total!.aakash!, getChartColor2('Aakash')),
          Charts('Agni', res.total!.agni!, getChartColor2('Agni')),
          Charts('Jal', res.total!.jal!, getChartColor2('Jal')),
          Charts('Vayu', res.total!.vayu!, getChartColor2('Vayu')),
          Charts('Prithvi', res.total!.prithvi!, getChartColor2('Prithvi'))
        ];
    }
    return list;
  }

  List<RankWrap> rankSort(List<Charts> list) {
    list.sort((b, a) => a.value.compareTo(b.value));
    List<RankWrap> ranked = List<RankWrap>.empty(growable: true);
    for (int i = 0; i < list.length; ++i) {
      if (i == 0) {
        ranked.add(RankWrap(list[0].label, '1'));
      } else {
        if (list[i - 1].value == list[i].value) {
          ranked.add(RankWrap(list[i].label, ranked[i - 1].rank));
        } else {
          ranked.add(RankWrap(
              list[i].label, (int.parse(ranked[i - 1].rank) + 1).toString()));
        }
      }
    }

    return ranked;
  }

  List<LeaderBoardWrap> rankGame(List<Game> list) {
    list.sort((b, a) => (int.parse(a.distance) *
            (1 + (int.parse(a.kills) / 10)))
        .compareTo(int.parse(b.distance) * (1 + (int.parse(b.kills) / 10))));
    List<LeaderBoardWrap> ranked = List<LeaderBoardWrap>.empty(growable: true);
    for (int i = 0; i < list.length; ++i) {
      if (i == 0) {
        ranked.add(LeaderBoardWrap('1', list[i]));
      } else {
        if (int.parse(list[i - 1].distance) *
                (1 + (int.parse(list[i - 1].kills) / 10)) ==
            int.parse(list[i].distance) *
                (1 + (int.parse(list[i].kills) / 10))) {
          if (int.parse(list[i - 1].kills) == int.parse(list[i].kills)) {
            ranked.add(LeaderBoardWrap(ranked[i - 1].rank, list[i]));
          } else {
            ranked.add(LeaderBoardWrap(
                (int.parse(ranked[i - 1].rank) + 1).toString(), list[i]));
          }
        } else {
          ranked.add(LeaderBoardWrap(
              (int.parse(ranked[i - 1].rank) + 1).toString(), list[i]));
        }
      }
    }
    return ranked;
  }

  String? getCup(String cup) {
    var cups = {
      'Cultural': 'assets/images/culcups.webp',
      'Spectrum': 'assets/images/culcupss.webp'
    };
    return cups[cup];
  }

  ScoreWrap series(ScoresResponse res, int i, String clan) {
    List<Charts> list;
    charts.Color color;
    list = Utils().clanList(res, i);
    switch (i) {
      case 1:
        color = charts.MaterialPalette.deepOrange.shadeDefault.lighter;
        break;
      case 2:
        color = charts.MaterialPalette.green.shadeDefault.lighter;
        break;
      case 3:
        color = charts.MaterialPalette.lime.shadeDefault.lighter;
        break;
      default:
        color = charts.MaterialPalette.purple.shadeDefault.lighter;
        break;
    }

    return ScoreWrap(rankSort(list), [
      charts.Series<Charts, String>(
        colorFn: (chart, _) => charts.MaterialPalette.black,
        domainFn: (chart, _) => chart.label,
        measureFn: (chart, _) => chart.value,
        fillColorFn: (chart, _) => color,
        strokeWidthPxFn: (chart, _) => 1.2,
        id: 'aaveg',
        data: list,
        labelAccessorFn: (chart, _) => chart.value.toString(),
      )
    ]);
  }

  void launchURL(String url, BuildContext context) async => await canLaunch(url)
      ? await launch(url)
      : snackResponse('Cannot Open The Link', context);
}
