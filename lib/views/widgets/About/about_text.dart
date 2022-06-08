import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutTextWidget extends StatefulWidget {
  const AboutTextWidget({Key? key}) : super(key: key);

  @override
  _AboutTextWidgetState createState() => _AboutTextWidgetState();
}

class _AboutTextWidgetState extends State<AboutTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.all(20),
      height: 316,
      width: 393,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Text('About aaveg',
              style:
                  TextStyle(fontFamily: GoogleFonts.montserrat().fontFamily))),
    );
  }
}
