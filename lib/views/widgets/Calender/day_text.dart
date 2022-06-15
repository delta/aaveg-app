import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DayText extends StatelessWidget {
  const DayText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.height / 75;
    double boxHeight = MediaQuery.of(context).size.height * 0.051;
    List<String> days = [
      'S\nU\nN',
      'M\nO\nN',
      'T\nU\nE',
      'W\nE\nD',
      'T\nH\nU',
      'F\nR\nI',
      'S\nA\nT'
    ];
    return Container(
        child: Column(children: [
      for (var day in days)
        Column(children: [
          SizedBox(
            height: boxHeight,
            child: Center(
              child: Text(day,
                  style: TextStyle(
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                      fontSize: fontSize)),
            ),
          ),
          if (days.indexOf(day) != 6)
            SizedBox(
              height: MediaQuery.of(context).size.height / 60,
            ),
        ]),
      // SizedBox(
      //   height: MediaQuery.of(context).size.height / 60,
      // ),
      // SizedBox(
      //   height: MediaQuery.of(context).size.height / 22.5,
      //   child: Text('S\nU\nN',
      //       style: TextStyle(
      //           fontFamily: GoogleFonts.montserrat().fontFamily,
      //           fontSize: fontSize)),
      // ),
      // SizedBox(
      //   height: MediaQuery.of(context).size.height / 60,
      // ),
      // SizedBox(
      //   height: MediaQuery.of(context).size.height / 22.5,
      //   child: Text('S\nU\nN',
      //       style: TextStyle(
      //           fontFamily: GoogleFonts.montserrat().fontFamily,
      //           fontSize: fontSize)),
      // ),
      // SizedBox(
      //   height: MediaQuery.of(context).size.height / 60,
      // ),
      // SizedBox(
      //   height: MediaQuery.of(context).size.height / 22.5,
      //   child: Text('S\nU\nN',
      //       style: TextStyle(
      //           fontFamily: GoogleFonts.montserrat().fontFamily,
      //           fontSize: fontSize)),
      // ),
      // SizedBox(
      //   height: MediaQuery.of(context).size.height / 60,
      // ),
      // SizedBox(
      //   height: MediaQuery.of(context).size.height / 22.5,
      //   child: Text('S\nU\nN',
      //       style: TextStyle(
      //           fontFamily: GoogleFonts.montserrat().fontFamily,
      //           fontSize: fontSize)),
      // ),
      // SizedBox(
      //   height: MediaQuery.of(context).size.height / 60,
      // ),
      // SizedBox(
      //   height: MediaQuery.of(context).size.height / 22.5,
      //   child: Text('S\nU\nN',
      //       style: TextStyle(
      //           fontFamily: GoogleFonts.montserrat().fontFamily,
      //           fontSize: fontSize)),
      // ),
      // SizedBox(
      //   height: MediaQuery.of(context).size.height / 60,
      // ),
      // SizedBox(
      //   height: MediaQuery.of(context).size.height / 22.5,
      //   child: Text('S\nU\nN',
      //       style: TextStyle(
      //           fontFamily: GoogleFonts.montserrat().fontFamily,
      //           fontSize: fontSize)),
      // )
    ]));
  }
}
