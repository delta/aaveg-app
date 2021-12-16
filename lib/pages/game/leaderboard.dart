import 'package:aaveg_app/api/apimanager.dart';
import 'package:aaveg_app/models/game_response.dart';
import 'package:aaveg_app/models/result_respone.dart';
import 'package:aaveg_app/screens/background.dart';
import 'package:aaveg_app/screens/error.dart';
import 'package:aaveg_app/screens/loading.dart';
import 'package:aaveg_app/services/cache_manager.dart';
import 'package:aaveg_app/utils/clan_utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LeaderboardState();
}

class LeaderboardState extends State<Leaderboard> {
  Future<ResultResponse<GameResponse, String>> _games;
  SharedPreferences _cache;
  int easterclick = 0;

  @override
  void initState() {
    _games = ApiManager().gameGet().whenComplete(() {
      CacheManager().getInstance().then((value) {
        if (mounted) {
          setState(() {
            _cache = value;
          });
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: InkWell(
              onTap: () => easterclick == 35
                  ? Utils().launchURL(
                      'https://drive.google.com/file/d/17INKWXUStyOU1BZq7XyOeblOmQw6K5fx/view?usp=sharing',
                      context)
                  : setState(() {
                      easterclick = easterclick + 1;
                    }),
              child:
                  Text('LeaderBoard', style: TextStyle(color: Colors.white))),
          backgroundColor: Colors.black,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
        ),
        body: FutureBuilder<ResultResponse<GameResponse, String>>(
          future: _games,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.message == 'success') {
                var res = snapshot.data.response as GameResponse;
                return LeaderBoardScreen(
                  games: res,
                  clan: _cache.getString('clan'),
                  rollno: _cache.getString('rollnumber'),
                  hs: _cache.getString('hs'),
                );
              } else if (snapshot.data.message == 'Network Error') {
                if (_cache.getString('game') != null) {
                  return LeaderBoardScreen(
                    games: gameResponseFromJson(_cache.getString('game')),
                    clan: _cache.getString('clan'),
                    rollno: _cache.getString('rollnumber'),
                    hs: _cache.getString('hs'),
                  );
                } else {
                  return ErrorScreen();
                }
              }
              return LoadingScreen();
            }
            return LoadingScreen();
          },
        ),
      );
}

class LeaderBoardScreen extends StatelessWidget {
  final GameResponse games;
  final String clan;
  final String rollno;
  final String hs;
  const LeaderBoardScreen(
      {Key key, this.games, this.clan, this.rollno, this.hs})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var gg = Utils().rankGame(games.game);
    return Scaffold(
        body: Stack(children: [
      Background(),
      Column(children: [
        Container(
          padding: EdgeInsets.all(32),
          child: Text(
            'Note: Score = Distance *  (1+(kills/10))',
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
                letterSpacing: 1),
          ),
        ),
        Container(
            decoration: BoxDecoration(color: Colors.transparent),
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.symmetric(
                    outside:
                        BorderSide(color: Colors.grey.shade700, width: 0.5),
                    inside: BorderSide(width: 1, color: Colors.grey.shade700)),
                children: [
                  TableRow(
                      decoration:
                          BoxDecoration(color: Colors.black.withAlpha(1111)),
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8),
                            child: Text(
                              'Rank',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 0,
                                      color: Colors.grey.shade900,
                                    ),
                                  ],
                                  letterSpacing: 1.2,
                                  fontStyle: FontStyle.italic,
                                  fontSize: size.width * 0.023,
                                  fontWeight: FontWeight.bold),
                            )),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8),
                            child: Text(
                              'RollNo.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 0,
                                      color: Utils().getColors(clan),
                                    ),
                                  ],
                                  letterSpacing: 1.2,
                                  fontStyle: FontStyle.italic,
                                  fontSize: size.width * 0.023,
                                  fontWeight: FontWeight.bold),
                            )),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8),
                            child: Text('Score',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 0,
                                      color: Colors.grey.shade900,
                                    ),
                                  ],
                                  letterSpacing: 1.2,
                                  fontSize: size.width * 0.025,
                                  fontStyle: FontStyle.italic,
                                ))),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8),
                            child: Text('kills',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 0,
                                      color: Colors.grey.shade900,
                                    ),
                                  ],
                                  letterSpacing: 1.2,
                                  fontSize: size.width * 0.025,
                                  fontStyle: FontStyle.italic,
                                ))),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8),
                            child: Text('Distance',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 0,
                                      color: Colors.grey.shade900,
                                    ),
                                  ],
                                  letterSpacing: 1.2,
                                  fontSize: size.width * 0.025,
                                  fontStyle: FontStyle.italic,
                                ))),
                      ])
                ])),
        Container(
            height: size.height * 0.7,
            decoration: BoxDecoration(color: Colors.transparent),
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: SingleChildScrollView(
                child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border: TableBorder.symmetric(
                        outside:
                            BorderSide(width: 1, color: Colors.grey.shade800),
                        inside:
                            BorderSide(width: 1, color: Colors.grey.shade700)),
                    children: gg
                        .map((e) => TableRow(
                                decoration: gg.indexOf(e) % 2 == 0
                                    ? BoxDecoration(
                                        color: Colors.grey.shade500
                                            .withAlpha(0250))
                                    : BoxDecoration(
                                        color: Colors.grey.shade400
                                            .withAlpha(1250)),
                                children: [
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 8),
                                      child: Text(
                                        e.rank,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: e.gameResponse.rollnumber
                                                        .trim() !=
                                                    rollno.trim()
                                                ? Utils().getColors(
                                                    e.gameResponse.clan)
                                                : Colors.yellow,
                                            shadows: <Shadow>[
                                              Shadow(
                                                offset: Offset(1, 1),
                                                blurRadius: 0,
                                                color: Colors.grey.shade900,
                                              ),
                                            ],
                                            letterSpacing: 1.2,
                                            fontSize: size.height * 0.014,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 2),
                                      child: Text(
                                          e.gameResponse.rollnumber.trim() ==
                                                  rollno.trim()
                                              ? 'YOU'
                                              : e.gameResponse.rollnumber
                                                  .toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: e.gameResponse.rollnumber
                                                          .trim() !=
                                                      rollno.trim()
                                                  ? Colors.black
                                                  : Colors.yellow,
                                              fontSize: size.height * 0.014,
                                              shadows: <Shadow>[
                                                Shadow(
                                                  offset: Offset(1, 1),
                                                  blurRadius: 0,
                                                  color: Colors.grey.shade500,
                                                ),
                                              ],
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.bold))),
                                  Text(
                                      ((1 +
                                                  int.parse(e
                                                          .gameResponse.kills) *
                                                      0.1) *
                                              int.parse(
                                                  e.gameResponse.distance))
                                          .toInt()
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: e.gameResponse.rollnumber
                                                      .trim() !=
                                                  rollno.trim()
                                              ? Colors.black
                                              : Colors.yellow,
                                          shadows: <Shadow>[
                                            Shadow(
                                              offset: Offset(1, 1),
                                              blurRadius: 0,
                                              color: Colors.grey.shade500,
                                            ),
                                          ],
                                          letterSpacing: 1.2,
                                          fontStyle: FontStyle.italic,
                                          fontSize: size.height * 0.012,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      (int.parse(e.gameResponse.kills))
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: e.gameResponse.rollnumber
                                                      .trim() !=
                                                  rollno.trim()
                                              ? Colors.black
                                              : Colors.yellow,
                                          shadows: <Shadow>[
                                            Shadow(
                                              offset: Offset(1, 1),
                                              blurRadius: 0,
                                              color: Colors.grey.shade500,
                                            ),
                                          ],
                                          letterSpacing: 1.2,
                                          fontStyle: FontStyle.italic,
                                          fontSize: size.height * 0.012,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      (int.parse(e.gameResponse.distance))
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: e.gameResponse.rollnumber
                                                      .trim() !=
                                                  rollno.trim()
                                              ? Colors.black
                                              : Colors.yellow,
                                          shadows: <Shadow>[
                                            Shadow(
                                              offset: Offset(1, 1),
                                              blurRadius: 0,
                                              color: Colors.grey.shade500,
                                            ),
                                          ],
                                          letterSpacing: 1.2,
                                          fontStyle: FontStyle.italic,
                                          fontSize: size.height * 0.011,
                                          fontWeight: FontWeight.bold)),
                                ]))
                        .toList()))),
      ]),
    ]));
  }
}
