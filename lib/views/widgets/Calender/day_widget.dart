import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DayWidget extends StatelessWidget {
  const DayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(3)),
      child: SizedBox(
        child: Center(
            child: AutoSizeText(
          'Date' + '\n' + 'Event name',
          maxFontSize: 10,
          minFontSize: 5,
          style: TextStyle(fontFamily: GoogleFonts.montserrat().fontFamily),
        )),
      ),
    );
  }
}
