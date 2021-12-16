// import 'package:aaveg_app/services/cache_manager.dart';
// import 'package:flame/flame.dart';
// import 'package:flutter/material.dart';

// class AudioManager {
//   AudioManager._internal();

//   static final AudioManager _instance = AudioManager._internal();

//   static AudioManager get instance => _instance;

//   Future<void> init(List<String> files) async {
//     Flame.bgm.initialize();
//     await Flame.audio.loadAll(files);

//     var pref = await CacheManager().getBGM();
//     if (pref == null) {
//       CacheManager().storeBGM(true);
//       _bgm.value = true;
//     }
//     _bgm = ValueNotifier(pref);
//   }

//   ValueNotifier<bool> _bgm;
//   ValueNotifier<bool> get listenableBgm => _bgm;

//   void setBgm(bool isOn) {
//     CacheManager().storeBGM(isOn).whenComplete(() => _bgm.value = isOn);
//   }

//   Future<void> startBgm(String fileName) async {
//     var pref = await CacheManager().getBGM();
//     pref ??= true;
//     if (pref) Flame.bgm.play(fileName, volume: 0.4);
//   }

//   void pauseBgm() {
//     if (_bgm.value) {
//       Flame.bgm.pause();
//     }
//   }

//   void resumeBgm() {
//     if (_bgm.value) {
//       Flame.bgm.resume();
//     }
//   }

//   void stopBgm() {
//     if (_bgm.value) {
//       Flame.bgm.stop();
//     }
//   }
// }
