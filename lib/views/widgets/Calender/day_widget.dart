import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DayWidget extends StatelessWidget {
  const DayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.fromLTRB(totalHeight * 0.005, totalHeight * 0.003,
          totalHeight * 0.003, totalHeight * 0.003),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(3)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.2,
        child: Align(
            alignment: Alignment.centerLeft,
            child: Column(children: [
              Text(
                'Date',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: GoogleFonts.montserrat().fontFamily,
                  fontSize: MediaQuery.of(context).size.height * 0.013,
                ),
              ),
              Text(
                'Event 1' + '\n' + 'Event 2',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    fontSize: MediaQuery.of(context).size.height * 0.011),
              ),
            ])),
      ),
    );
  }
}
