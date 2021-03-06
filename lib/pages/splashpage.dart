import 'package:aaveg_app/pages/auth_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;
    return AnimatedSplashScreen(
      nextScreen: AuthPage(),
      splash: Container(
        child: Column(children: [
          Image.asset('assets/images/aaveg-logo.png', height: 200, width: 200),
          Center(
            child: Text.rich(TextSpan(
              text: 'Made with ',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: totalHeight * 0.015,
                  fontFamily: GoogleFonts.montserrat().fontFamily),
              children: <InlineSpan>[
                TextSpan(
                  text: '♥️ ',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: totalHeight * 0.015,
                      fontFamily: GoogleFonts.montserrat().fontFamily),
                ),
                TextSpan(
                  text: 'by ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: totalHeight * 0.015,
                      fontFamily: GoogleFonts.montserrat().fontFamily),
                ),
                TextSpan(
                  text: 'DeltaForce',
                  style: TextStyle(
                      color: Color(0xff63b617),
                      fontWeight: FontWeight.bold,
                      fontSize: totalHeight * 0.015,
                      fontFamily: GoogleFonts.montserrat().fontFamily),
                ),
                TextSpan(
                  text: ' & ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: totalHeight * 0.015,
                      fontFamily: GoogleFonts.montserrat().fontFamily),
                ),
                TextSpan(
                  text: 'AavegDesCon',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: totalHeight * 0.015,
                      fontFamily: GoogleFonts.montserrat().fontFamily),
                )
              ],
            )),
          )
        ]),
      ),
      backgroundColor: Color(0xff060101),
      splashIconSize: 250,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
