// import 'package:aaveg_app/pages/game/gameplay.dart';
// import 'package:aaveg_app/pages/game/leaderboard.dart';
// import 'package:aaveg_app/pages/game/story.dart';
// import 'package:aaveg_app/screens/background.dart';
// import 'package:aaveg_app/screens/loading.dart';
// import 'package:aaveg_app/services/cache_manager.dart';
// import 'package:flutter/material.dart';

// class Games extends StatefulWidget {
//   const Games({Key key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => GameState();
// }

// class GameState extends State<Games> {
//   Future<String> _score;
//   bool _vol;
//   final list = [
//     {'name': 'Play', 'widget': GamePlay()},
//     {'name': 'Controls', 'widget': Story()},
//     {'name': 'LeaderBoard', 'widget': Leaderboard()},
//   ];
//   @override
//   void initState() {
//     _score = CacheManager().getHS().whenComplete(() {
//       CacheManager().getBGM().then((value) => setState(() {
//             _vol = value;
//           }));
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) => Scaffold(
//           body: Stack(children: [
//         Background(),
//         Center(
//             child: FutureBuilder<String>(
//                 future: _score,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     return Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Expanded(
//                               flex: 3,
//                               child: Image.asset(
//                                 'assets/images/ninjarun.png',
//                                 fit: BoxFit.fitWidth,
//                               )),
//                           for (int i = 0; i < list.length; ++i)
//                             Flexible(
//                                 flex: 1,
//                                 child: FloatingActionButton.extended(
//                                     heroTag: i.toString(),
//                                     backgroundColor:
//                                         Theme.of(context).primaryColor,
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(10))),
//                                     onPressed: () {
//                                       Navigator.of(context).push(
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   list[i]['widget']));
//                                     },
//                                     label: Padding(
//                                         padding: EdgeInsets.all(8),
//                                         child: Text(
//                                           list[i]['name'],
//                                           style: TextStyle(
//                                               color: Colors.white,
//                                               shadows: const <Shadow>[
//                                                 Shadow(
//                                                   offset: Offset(2.4, 2.4),
//                                                   blurRadius: 0,
//                                                   color: Colors.black45,
//                                                 ),
//                                               ],
//                                               letterSpacing: 1.4,
//                                               fontStyle: FontStyle.italic,
//                                               fontWeight: FontWeight.bold),
//                                         )))),
//                         ]);
//                   } else {
//                     return LoadingScreen();
//                   }
//                 }))
//       ]));

//   Future<void> setBGM() async {
//     setState(() {
//       _vol = !_vol;
//     });
//     await CacheManager().storeBGM(_vol);
//   }
// }
