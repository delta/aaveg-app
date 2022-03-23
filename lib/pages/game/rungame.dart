// import 'package:aaveg_app/api/apimanager.dart';
// import 'package:aaveg_app/pages/game/runninja.dart';
// import 'package:aaveg_app/pages/game/zombie.dart';
// import 'package:aaveg_app/pages/game/zombiemanager.dart';
// import 'package:aaveg_app/services/cache_manager.dart';
// import 'package:flame/components/joystick/joystick_action.dart';
// import 'package:flame/components/joystick/joystick_component.dart';
// import 'package:flame/components/joystick/joystick_directional.dart';
// import 'package:flame/flame.dart';
// import 'package:flame/keyboard.dart';
// import 'package:flame/position.dart';
// import 'package:flame/text_config.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flame/components/parallax_component.dart';
// import 'package:flame/components/text_component.dart';
// import 'package:flame/game.dart';
// import 'package:flame/gestures.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'dart:math' as math;

// class RunGame extends BaseGame
//     with HasWidgetsOverlay, KeyboardEvents, MultiTouchDragDetector {
//   RunNinja _ninja;
//   ZombieManager _enemyManager;
//   bool isAttaking = false;
//   ParallaxComponent _bg;
//   double _elapsedTime = 0.0;
//   TextComponent _scoreText;
//   TextComponent _attackText;
//   TextComponent _staminaText;
//   double stamina = 1.0;
//   int attackCount = 0;
//   int score = 0;
//   JoystickComponent stick;
//   bool _isGameOver = false;
//   SharedPreferences sp;

//   Future<void> initialize(SharedPreferences c) async {
//     sp = c;
//     size = await Flame.util.initialDimensions();
//     _ninja = RunNinja(c.getString('clan'));
//     _bg = ParallaxComponent([
//       ParallaxImage('homebg.webp', fill: LayerFill.width),
//       ParallaxImage('floor.png', fill: LayerFill.none),
//     ], baseSpeed: Offset(100, 0), layerDelta: Offset(60, 0));
//     add(_bg);
//     _enemyManager = ZombieManager();
//     stick = JoystickComponent(
//         directional: JoystickDirectional(
//           color: Colors.black38,
//           size: 110,
//         ),
//         actions: [
//           JoystickAction(
//               actionId: 0,
//               color: Colors.black45,
//               size: 65,
//               margin: EdgeInsets.fromLTRB(0, 0, 80, 70))
//         ]);
//     stick.addObserver(_ninja);
//     add(_enemyManager);
//     add(_ninja);
//     add(stick);
//     _scoreText = TextComponent(
//       score.toString(),
//       config: TextConfig(
//           fontSize: 24.0, fontFamily: 'Audiowide', color: Colors.white),
//     );
//     _attackText = TextComponent(
//       'Kills: ' + attackCount.toString(),
//       config: TextConfig(
//           fontSize: 22.0, fontFamily: 'Audiowide', color: Colors.white),
//     );
//     _staminaText = TextComponent(
//       'Stamina: ' + stamina.toString(),
//       config: TextConfig(
//           fontSize: 20.0, fontFamily: 'Audiowide', color: Colors.black),
//     );
//     _scoreText
//         .setByPosition(Position((size.width / 2) - (_scoreText.width / 2), 1));
//     _attackText.setByPosition(
//         Position(size.width - _attackText.width - (_attackText.width / 5), 1));
//     _staminaText.setByPosition(Position(-1, 1));
//     add(_scoreText);
//     add(_attackText);
//     add(_staminaText);

//     //AudioManager.instance.startBgm('bgm.mp3');
//   }

//   RunGame(SharedPreferences sp) {
//     initialize(sp);
//   }
//   @override
//   void onReceiveDrag(DragEvent drag) {
//     stick.onReceiveDrag(drag);
//     super.onReceiveDrag(drag);
//   }

//   @override
//   void resize(Size size) {
//     super.resize(size);
//     size = size;
//     if (_attackText != null) {
//       _attackText.setByPosition(Position(
//           size.width - _attackText.width - (_attackText.width / 5), 1));
//       _scoreText.setByPosition(
//           Position((size.width / 2) - (_scoreText.width / 2), 1));
//       _staminaText.setByPosition(Position(-1, 1));
//     }
//   }

//   double elapsedtime2 = 0;
//   @override
//   Future<void> update(double t) async {
//     super.update(t);
//     size = await Flame.util.initialDimensions();
//     _elapsedTime += t;
//     if (_elapsedTime > (1 / 60)) {
//       _elapsedTime = 0.0;
//       score += 1;
//       _scoreText.text = score.toString();
//     }
//     elapsedtime2 += t;
//     if (elapsedtime2 >= 1) {
//       elapsedtime2 = 0;
//       if (stamina < 1.0) {
//         stamina += 0.01;
//       } else {
//         stamina = 1;
//       }
//     }
//     if (stamina < 0.25) {
//       _staminaText.config = TextConfig(color: Colors.red);
//     } else {
//       _staminaText.config = TextConfig(color: Colors.green);
//     }

//     _staminaText.text = ' Stamina: ' + (stamina * 100).toInt().toString() + '%';
//     if (isAttaking) {
//       _attackText.text = 'Kills: ' + attackCount.toString();
//     }

//     components.whereType<Zombie>().forEach((element) {
//       if (_ninja.distance(element) <
//           math.min(element.width, element.height) / 2) {
//         if (isAttaking && stamina > 0.25) {
//           stamina = (stamina - 0.25 >= 0) ? stamina - 0.25 : 0;
//           markToRemove(element);
//           attackCount++;
//         } else {
//           gameOver();
//         }
//       }
//     });
//   }

//   // @override
//   // void onPanStart(DragStartDetails details) {
//   //   super.onPanStart(details);
//   //   vY1 = details.globalPosition.dy;
//   //   hX1 = details.globalPosition.dx;
//   // }

//   // @override
//   // void onPanUpdate(DragUpdateDetails details) {
//   //   super.onPanUpdate(details);
//   //   vY2 = details.globalPosition.dy;
//   //   hX2 = details.globalPosition.dx;
//   //   if (vY1 - vY2 > 60 && vY1 != null)
//   //     _ninja.onJump();
//   //   else if (vY1 - vY2 < -60 && vY1 != null)
//   //     _ninja.onSlide();
//   //   else if (hX1 - hX2 > 60 && hX1 != null && stamina >= 0.25) {
//   //     _ninja.onAttack();
//   //   }
//   //   print(stamina.toString());
//   // }

//   // @override
//   // void onPanEnd(DragEndDetails details) {
//   //   super.onPanEnd(details);
//   //   vY1 = null;
//   //   vY2 = null;
//   //   hX1 = null;
//   //   hX2 = null;
//   // }
//   void resumeGame() {
//     removeWidgetOverlay('PauseMenu');
//     resumeEngine();
//     // AudioManager.instance.resumeBgm();
//   }

//   void pauseGame() {
//     pauseEngine();

//     if (!_isGameOver) {
//       addWidgetOverlay(
//         'PauseMenu',
//         PauseMenu(
//           onResumePressed: resumeGame,
//         ),
//       );
//     }
//     //AudioManager.instance.pauseBgm();
//   }

//   Future<void> gameOver() async {
//     pauseEngine();
//     _isGameOver = true;
//     var message = 'nil';
//     //var hs = sp.getString('hs');
//     var ss = (score * (1 + attackCount * 0.1)).toInt();
//     print(ss);
//     addWidgetOverlay('cp', circularProgressBar());
//     await CacheManager().storeHS(ss);
//     message = await ApiManager().gamePost(sp.getString('clan'),
//         sp.getString('rollnumber'), score.toString(), attackCount.toString());
//     removeWidgetOverlay('cp');
//     addWidgetOverlay(
//         'gameOver',
//         GameOverDialog(
//           score: score,
//           attackCount: attackCount,
//           onGameOver: quit,
//           onReset: reset,
//           message: message,
//         ));
//     //AudioManager.instance.pauseBgm();
//   }

//   Widget circularProgressBar() => Center(child: CircularProgressIndicator());

//   void reset() {
//     resumeEngine();
//     score = 0;
//     attackCount = 0;
//     _attackText.text = 'Kills: ' + attackCount.toString();
//     isAttaking = false;
//     stamina = 1;
//     _ninja.run();
//     _enemyManager.reset();
//     components.whereType<Zombie>().forEach(markToRemove);
//     removeWidgetOverlay('gameOver');
//     _isGameOver = false;
//     resumeEngine();
//     // AudioManager.instance.resumeBgm();
//   }

//   @override
//   void lifecycleStateChange(AppLifecycleState state) {
//     switch (state) {
//       case AppLifecycleState.resumed:
//         break;
//       case AppLifecycleState.inactive:
//         pauseGame();
//         break;
//       case AppLifecycleState.paused:
//         pauseGame();
//         break;
//       case AppLifecycleState.detached:
//         pauseGame();
//         break;
//     }
//   }

//   Future<void> quit(String s) async {
//     pauseEngine();
//     removeWidgetOverlay(s);
//     await Flame.util.setPortrait();
//   }

//   @override
//   void onKeyEvent(RawKeyEvent event) {
//     print(event.data.keyLabel);
//     switch (event.data.keyLabel) {
//       case 'ArrowUp':
//         _ninja.onJump();
//         break;
//       case 'ArrowDown':
//         _ninja.onSlide();
//         break;
//       case ' ':
//         if (stamina >= 0.25) _ninja.onAttack();
//     }
//   }
// }

// class PauseMenu extends StatelessWidget {
//   final Function onResumePressed;

//   const PauseMenu({Key key, this.onResumePressed}) : super(key: key);
//   @override
//   Widget build(BuildContext context) => Center(
//       child: Card(
//           color: Colors.black.withOpacity(0.5),
//           child: Padding(
//               padding: EdgeInsets.all(50),
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       'Pause',
//                       style: TextStyle(color: Colors.white, fontSize: 30.0),
//                     ),
//                     SizedBox(height: 10),
//                     IconButton(
//                         icon: Icon(
//                           Icons.play_arrow,
//                           color: Colors.white,
//                           size: 30.0,
//                         ),
//                         onPressed: onResumePressed),
//                   ]))));
// }

// class GameOverDialog extends StatelessWidget {
//   final int attackCount;
//   final int score;
//   final Function onGameOver;
//   final Function onReset;
//   final String message;
//   const GameOverDialog(
//       {Key key,
//       this.attackCount,
//       this.score,
//       this.onGameOver,
//       this.onReset,
//       this.message})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) => Center(
//       child: Card(
//           color: Colors.black.withOpacity(0.5),
//           child: Padding(
//               padding: EdgeInsets.all(50),
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     message != 'nil'
//                         ? Text(
//                             message != 'success'
//                                 ? 'Error Posting to LeaderBoard'
//                                 : 'Posted to LeaderBoard',
//                             style: TextStyle(
//                                 color: message != 'success'
//                                     ? Colors.red
//                                     : Colors.green,
//                                 fontSize: 16.0,
//                                 letterSpacing: 2),
//                           )
//                         : SizedBox(height: 0),
//                     SizedBox(height: 15),
//                     Text(
//                       'Game Over',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 50.0,
//                           letterSpacing: 2),
//                     ),
//                     SizedBox(height: 15),
//                     Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             'Distance: ' + score.toString(),
//                             style:
//                                 TextStyle(color: Colors.white, fontSize: 20.0),
//                           ),
//                           SizedBox(width: 15),
//                           Text(
//                             'Kills: ' + attackCount.toString(),
//                             style:
//                                 TextStyle(color: Colors.white, fontSize: 20.0),
//                           ),
//                         ]),
//                     SizedBox(height: 15),
//                     Text(
//                       'Total Score: ' +
//                           (score * (1 + attackCount * 0.1)).toInt().toString(),
//                       style: TextStyle(color: Colors.white, fontSize: 30.0),
//                     ),
//                     SizedBox(height: 15),
//                     Row(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           IconButton(
//                               icon: Icon(
//                                 Icons.replay,
//                                 color: Colors.white,
//                                 size: 30.0,
//                               ),
//                               onPressed: onReset),
//                           IconButton(
//                               icon: Icon(
//                                 Icons.home,
//                                 color: Colors.white,
//                                 size: 30.0,
//                               ),
//                               onPressed: () {
//                                 onGameOver('gameOver');
//                                 Navigator.pop(context);
//                               }),
//                         ])
//                   ]))));
// }
