// import 'dart:math';
// import 'dart:ui';
// import 'package:aaveg_app/pages/game/rungame.dart';
// import 'package:aaveg_app/pages/game/zombie.dart';
// import 'package:flame/components/component.dart';
// import 'package:flame/components/mixins/has_game_ref.dart';
// import 'package:flame/time.dart';

// class ZombieManager extends Component with HasGameRef<RunGame> {
//   Random _random;
//   Timer _timer;
//   int _spawnLevel;

//   ZombieManager() {
//     _random = Random();
//     _spawnLevel = 0;
//     _timer = Timer(4, repeat: true, callback: () {
//       spawnRandomEnemy();
//     });
//   }

//   void spawnRandomEnemy() {
//     final randomNumber = _random.nextInt(ZombieType.values.length);
//     final randomEnemyType = ZombieType.values.elementAt(randomNumber);
//     final newEnemy = Zombie(randomEnemyType);
//     gameRef.addLater(newEnemy);
//   }

//   @override
//   void onMount() {
//     super.onMount();
//     _timer.start();
//   }

//   @override
//   void render(Canvas c) {}

//   @override
//   void update(double t) {
//     _timer.update(t);

//     var newSpawnLevel = gameRef.score ~/ 500;
//     if (_spawnLevel < newSpawnLevel) {
//       _spawnLevel = newSpawnLevel;

//       // y = 4 / (1 + 0.1 * x)
//       var newWaitTime = 4 / (1 + (0.25 * _spawnLevel));

//       _timer.stop();
//       _timer = Timer(newWaitTime, repeat: true, callback: () {
//         spawnRandomEnemy();
//       });
//       _timer.start();
//     }
//   }

//   void reset() {
//     _spawnLevel = 0;
//     _timer = Timer(4, repeat: true, callback: () {
//       spawnRandomEnemy();
//     });
//     _timer.start();
//   }
// }
