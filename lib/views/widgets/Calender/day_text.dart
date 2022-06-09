import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DayText extends StatelessWidget {
  const DayText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.height / 80;
    double boxHeight = MediaQuery.of(context).size.height / 22.5;
    List<String> days = [
      'S\nU\nN',
      'S\nU\nN',
      'S\nU\nN',
      'S\nU\nN',
      'S\nU\nN',
      'S\nU\nN',
      'S\nU\nN'
    ];
    return Container(
        child: Column(children: [
      for (var day in days)
        Column(children: [
          SizedBox(
            height: boxHeight,
            child: Text(day,
                style: TextStyle(
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    fontSize: fontSize)),
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
