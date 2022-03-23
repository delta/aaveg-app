import 'dart:async';
import 'dart:math';
import 'package:aaveg_app/services/cache_manager.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animRot;
  Animation<double>? animIn;
  Animation<double>? animOut;
  Animation<double>? animFade;
  Animation<double>? animTrans;
  final icon = {
    'Aakash': 'assets/images/aakash-min.png',
    'Jal': 'assets/images/Jal-min.png',
    'Agni': 'assets/images/agni-min.png',
    'Prithvi': 'assets/images/Prithvi-min.png',
    'Vayu': 'assets/images/vayu-min.png',
  };
  double radi = 0.0;
  double initradi = 130.0;
  double clanradi = 45.0;
  bool logo = false;

  @override
  void initState() {
    super.initState();
    anim().whenComplete(() {
      controller!.dispose();
      CacheManager().getUser().then((value) {
        if (value != null) {
          return Timer(const Duration(milliseconds: 500),
              () => Navigator.of(context).popAndPushNamed('/home'));
        } else {
          return Timer(const Duration(milliseconds: 500),
              () => Navigator.of(context).popAndPushNamed('/login'));
        }
      });
    });
  }

  Future<void> anim() async {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));

    animRot = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: controller!,
        curve: const Interval(0.0, 1.0, curve: Curves.linear)));
    animIn = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
        parent: controller!,
        curve: const Interval(0.75, 1.0, curve: Curves.elasticIn)));
    animFade = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
        parent: controller!,
        curve: const Interval(0.75, 1.0, curve: Curves.easeOut)));
    animOut = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: controller!,
        curve: const Interval(0.0, 0.25, curve: Curves.elasticOut)));
    animTrans = Tween(begin: 60.0, end: 1.5).animate(controller!);

    controller!.addListener(() {
      setState(() {
        if (controller!.value >= 0.75 && controller!.value <= 1.0) {
          radi = animIn!.value * initradi;
          logo = true;
          if (controller!.value >= 1.0) clanradi = 0;
        } else if (controller!.value >= 0.0 && controller!.value <= 0.25) {
          radi = animOut!.value * initradi;
          logo = false;
        }
      });
    });
    await controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var i = 0;
    return SafeArea(
        child: Stack(children: [
      Transform.translate(
          offset: Offset(0, animTrans!.value),
          child: Image.asset('assets/images/splashbg.webp',
              height: size.height, width: size.width, fit: BoxFit.fill)),
      Center(
          child: SizedBox(
              width: 350.0,
              height: 350.0,
              child: Center(
                  child: Stack(children: [
                RotationTransition(
                  turns: animRot!,
                  child: Stack(
                      children: icon.values.map((value) {
                    i++;
                    return Transform.translate(
                        offset: Offset(radi * cos(i * (2 * pi / 5)),
                            radi * sin(i * (2 * pi / 5))),
                        child: CircleClan(radius: clanradi, image: value));
                  }).toList()),
                ),
                Center(
                    child: Container(
                        padding: const EdgeInsets.all(16),
                        width: 150,
                        height: 150,
                        child: Center(
                            child: AnimatedOpacity(
                                opacity: logo ? 1.0 : 0.0,
                                duration: const Duration(milliseconds: 500),
                                child: Container(
                                  child: Image.asset(
                                      'assets/images/aavegwhite.png'),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                )))))
              ]))))
    ]));
  }
}

class CircleClan extends StatelessWidget {
  final double radius;
  final String image;

  const CircleClan({Key? key, required this.radius, required this.image})
      : super(key: key);
  @override
  Widget build(BuildContext context) => Center(
          child: Container(
        width: radius,
        height: radius,
        child: Image.asset(image),
        decoration: const BoxDecoration(
            color: Colors.transparent, shape: BoxShape.circle),
      ));
}
