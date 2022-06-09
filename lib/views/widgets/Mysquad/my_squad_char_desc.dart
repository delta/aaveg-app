import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MySquadCharacterDescWidget extends StatefulWidget {
  MySquadCharacterDescWidget({Key? key}) : super(key: key);

  @override
  State<MySquadCharacterDescWidget> createState() =>
      _MySquadCharacterDescWidgetState();
}

class _MySquadCharacterDescWidgetState
    extends State<MySquadCharacterDescWidget> {
  var a =
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.only(top: 20, bottom: 10, left: 15, right: 10),
          alignment: Alignment.center,
          child: Text(
            a,
            style: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily,
                fontSize: 15,
                fontWeight: FontWeight.w500),
          )),
    );
  }
}
