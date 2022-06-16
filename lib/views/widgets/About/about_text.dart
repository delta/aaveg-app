import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutTextWidget extends StatefulWidget {
  final String text;
  const AboutTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  _AboutTextWidgetState createState() => _AboutTextWidgetState();
}

class _AboutTextWidgetState extends State<AboutTextWidget> {
  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;
    double totalWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: new EdgeInsets.all(20),
      padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
      height: totalHeight * 0.34,
      width: totalWidth * 0.918,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.65),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: SingleChildScrollView(
        child: Text(
          widget.text,
          style: TextStyle(
              fontFamily: GoogleFonts.montserrat().fontFamily, fontSize: 18),
        ),
      )),
    );
  }
}
