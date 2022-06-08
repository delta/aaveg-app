import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DayText extends StatelessWidget {
  const DayText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      SizedBox(
        height: 40,
        child: AutoSizeText('S\nU\nN',
            style: TextStyle(fontFamily: GoogleFonts.montserrat().fontFamily)),
      ),
      SizedBox(
        height: 15,
      ),
      SizedBox(
        height: 40,
        child: AutoSizeText('M\nO\nN',
            minFontSize: 5,
            maxFontSize: 15,
            style: TextStyle(fontFamily: GoogleFonts.montserrat().fontFamily)),
      ),
      SizedBox(
        height: 15,
      ),
      SizedBox(
        height: 40,
        child: AutoSizeText('T\nU\nE',
            minFontSize: 5,
            maxFontSize: 15,
            style: TextStyle(fontFamily: GoogleFonts.montserrat().fontFamily)),
      ),
      SizedBox(
        height: 15,
      ),
      SizedBox(
        height: 40,
        child: AutoSizeText('W\nE\nD',
            minFontSize: 5,
            maxFontSize: 15,
            style: TextStyle(fontFamily: GoogleFonts.montserrat().fontFamily)),
      ),
      SizedBox(
        height: 12,
      ),
      SizedBox(
        height: 40,
        child: AutoSizeText('T\nH\nU',
            minFontSize: 5,
            maxFontSize: 15,
            style: TextStyle(fontFamily: GoogleFonts.montserrat().fontFamily)),
      ),
      SizedBox(
        height: 15,
      ),
      SizedBox(
        height: 40,
        child: AutoSizeText('F\nR\nI',
            minFontSize: 5,
            maxFontSize: 15,
            style: TextStyle(fontFamily: GoogleFonts.montserrat().fontFamily)),
      ),
      SizedBox(
        height: 15,
      ),
      SizedBox(
        height: 40,
        child: AutoSizeText('S\nA\nT',
            minFontSize: 5,
            maxFontSize: 15,
            style: TextStyle(fontFamily: GoogleFonts.montserrat().fontFamily)),
      )
    ]));
  }
}
