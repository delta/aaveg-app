import 'package:aaveg_app/pages/home.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedSplashScreen(
      nextScreen: Home(),
      splash: Column(children: [
        Image.asset('assets/images/aaveg-logo.png', height: 80, width: 80),
        Text.rich(TextSpan(
          text: 'Made with ',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: size.height * 0.015),
          children: <InlineSpan>[
            TextSpan(
              text: '♥️ ',
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * 0.0155),
            ),
            TextSpan(
              text: 'by ',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: size.height * 0.015),
            ),
            TextSpan(
              text: 'DeltaForce',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Color(0xff63b617),
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * 0.0155),
            ),
          ],
        ))
      ]),
      backgroundColor: Colors.black,
      splashIconSize: 200,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
