// import 'package:aaveg_app/pages/game/rungame.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:aaveg_app/screens/loading.dart';
// import 'package:aaveg_app/services/cache_manager.dart';
// import 'package:flame/flame.dart';
// import 'package:flutter/material.dart';

// class GamePlay extends StatefulWidget {
//   const GamePlay({Key key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => GamePlayState();
// }

// class GamePlayState extends State<GamePlay> {
//   final util = Flame.util;
//   Future<void> init() async {
//     await util.fullScreen();
//     await util.setLandscapeLeftOnly();
//     //await AudioManager.instance.init(['bgm.mp3']);
//   }

//   Future<void> dis() async {
//     await util.setPortrait();
//   }

//   @override
//   void initState() {
//     init();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     dis();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) => Scaffold(
//       body: FutureBuilder<SharedPreferences>(
//           future: CacheManager().getInstance(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return RunGame(snapshot.data).widget;
//             } else {
//               return LoadingScreen();
//             }
//           }));
// }
