import 'package:aaveg_app/models/globals.dart';
import 'package:aaveg_app/models/score_response.dart';
import 'package:aaveg_app/pages/scoreboard/scorepage.dart';
import 'package:aaveg_app/pages/scoreboard/scoretable.dart';
import 'package:aaveg_app/screens/background.dart';
import 'package:flutter/material.dart';

class ScoresScreen extends StatelessWidget {
  final TabController tabController;
  final List<ScoreWrap> list;
  final bool isOffline;
  final EventsScore eventsScore;
  final String clan;

  const ScoresScreen(
      {Key? key,
      required this.tabController,
      required this.list,
      required this.isOffline,
      required this.eventsScore,
      required this.clan})
      : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        elevation: 100,
        toolbarHeight: isOffline ? 16 : 0,
        centerTitle: true,
        title: Text(
          'You\'re Offline,Turn On your Internet',
          style:
              TextStyle(fontSize: MediaQuery.of(context).size.height * 0.014),
        ),
      ),
      body: Stack(children: [
        Background(),
        Container(
          decoration: BoxDecoration(color: Colors.black38),
        ),
        TabBarView(controller: tabController, children: [
          ScorePage(list[0].series, list[0].list, clan, eventsScore),
          ScorePage(list[1].series, list[1].list, clan, eventsScore),
          ScorePage(list[2].series, list[2].list, clan, eventsScore),
          ScoreTable(eventsScore: eventsScore)
        ])
      ]));
}
