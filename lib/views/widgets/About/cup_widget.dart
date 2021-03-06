import 'package:aaveg_app/models/about_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CupWidget extends StatefulWidget {
  final Cup cup;
  const CupWidget({Key? key, required this.cup}) : super(key: key);

  @override
  _CupWidgetState createState() => _CupWidgetState();
}

class _CupWidgetState extends State<CupWidget> {
  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;
    return Container(
        // margin: new EdgeInsets.fromLTRB(25, 2, 25, 77),
        child: Column(children: [
      Container(
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.55),
            borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          height: totalHeight * 0.173,
          width: totalHeight * 0.173,
          child: Center(
            child: Image(
                image: NetworkImage("https://aaveg.in/22${widget.cup.vector}"),
                fit: BoxFit.cover),
          ),
        ),
      ),
      SizedBox(
        height: 4,
      ),
      Container(
          padding: EdgeInsets.fromLTRB(totalHeight * 0.010, totalHeight * 0.005,
              totalHeight * 0.005, totalHeight * 0.010),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.65),
              borderRadius: BorderRadius.circular(10)),
          child: SizedBox(
            height: totalHeight * 0.0756,
            width: totalHeight * 0.173,
            child: Center(
                child: Text(
              widget.cup.description!,
              style: TextStyle(
                  fontFamily: GoogleFonts.montserrat().fontFamily,
                  fontSize: totalHeight * 0.018),
            )),
          ))
    ]));
  }
}
