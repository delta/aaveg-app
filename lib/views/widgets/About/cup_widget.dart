import 'package:aaveg_app/models/cup_modal.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
            color: Colors.black.withOpacity(0.65),
            borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          height: totalHeight * 0.173,
          width: totalHeight * 0.173,
          child: Center(
            child: Image(image: AssetImage(widget.cup.imageasset)),
          ),
        ),
      ),
      SizedBox(
        height: 4,
      ),
      Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.65),
              borderRadius: BorderRadius.circular(10)),
          child: SizedBox(
            height: totalHeight * 0.0756,
            width: totalHeight * 0.173,
            child: Center(
                child: AutoSizeText(
              'Smol desc about the cup',
              minFontSize: 5,
              maxFontSize: 10,
              style: TextStyle(fontFamily: GoogleFonts.montserrat().fontFamily),
            )),
          ))
    ]));
  }
}
