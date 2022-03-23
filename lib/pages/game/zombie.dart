// import 'dart:math';
// import 'dart:ui';
// import 'package:aaveg_app/pages/game/constants.dart';
// import 'package:flame/anchor.dart';
// import 'package:flame/components/animation_component.dart';
// import 'package:flame/spritesheet.dart';
// import 'package:flutter/foundation.dart';

// enum ZombieType { female, male, bat }

// class ZombieData {
//   final String imageName;
//   final int textureWidth;
//   final int textureHeight;
//   final int nColumns;
//   final int nRows;

//   final bool canFly;

//   final int speed;

//   const ZombieData({
//     @required this.imageName,
//     @required this.textureWidth,
//     @required this.textureHeight,
//     @required this.nColumns,
//     @required this.nRows,
//     @required this.canFly,
//     @required this.speed,
//   });
// }

// class Zombie extends AnimationComponent {
//   ZombieData _myData;
//   static final Random _random = Random();

//   static const Map<ZombieType, ZombieData> _enemyDetails = {
//     ZombieType.female: ZombieData(
//       imageName: 'fsal.png',
//       nColumns: 10,
//       nRows: 1,
//       textureHeight: 576,
//       textureWidth: 521,
//       canFly: false,
//       speed: 250,
//     ),
//     ZombieType.male: ZombieData(
//       imageName: 'msal.png',
//       nColumns: 10,
//       nRows: 1,
//       textureHeight: 519,
//       textureWidth: 430,
//       canFly: false,
//       speed: 300,
//     ),
//     ZombieType.bat: ZombieData(
//       imageName: 'fly.png',
//       nColumns: 7,
//       nRows: 1,
//       textureHeight: 30,
//       textureWidth: 46,
//       canFly: true,
//       speed: 300,
//     )
//   };

//   Zombie(ZombieType enemyType) : super.empty() {
//     _myData = _enemyDetails[enemyType];

//     final spriteSheet = SpriteSheet(
//       imageName: _myData.imageName,
//       textureWidth: _myData.textureWidth,
//       textureHeight: _myData.textureHeight,
//       columns: _myData.nColumns,
//       rows: _myData.nRows,
//     );

//     animation = spriteSheet.createAnimation(0,
//         from: 0, to: _myData.nColumns - 1, stepTime: 0.1);

//     anchor = !_myData.canFly ? (Anchor.center) : Anchor.bottomCenter;
//   }

//   @override
//   void resize(Size size) {
//     super.resize(size);

//     height = width = size.height / 5;
//     x = size.width + width;
//     y = size.height - groundHeight - (height / 2);

//     if (_myData.canFly) {
//       height = width = size.height / 7;
//       y = size.height -
//           groundHeight -
//           height -
//           ((_random.nextInt(2)) * size.height / 12);
//     }
//   }

//   @override
//   void update(double t) {
//     super.update(t);
//     x -= _myData.speed * t;
//   }

//   @override
//   bool destroy() => x < -width;
// }
