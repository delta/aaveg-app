import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MySquadDetailsWidget extends StatefulWidget {
  MySquadDetailsWidget({Key? key}) : super(key: key);

  @override
  State<MySquadDetailsWidget> createState() => _MySquadDetailsWidgetState();
}

class _MySquadDetailsWidgetState extends State<MySquadDetailsWidget> {
  List<String> points = ['Culturals', 'Spectrun', 'Overall'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/paasha-logo.png'),
            ),
          ),
        ),
        Table(
          columnWidths: {
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(1),
          },
          children: points
              .map(
                (e) => TableRow(children: [
                  Container(
                    margin: EdgeInsets.only(top: 8, bottom: 8, left: 5),
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      e,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          fontFamily: GoogleFonts.montserrat().fontFamily),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    margin: EdgeInsets.only(top: 8, bottom: 8, left: 5),
                    child: Text(
                      '30',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          fontFamily: GoogleFonts.montserrat().fontFamily),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8, bottom: 8, left: 5),
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      '30',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          fontFamily: GoogleFonts.montserrat().fontFamily),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ]),
              )
              .toList(),
        )
      ]),
    );
  }
}
