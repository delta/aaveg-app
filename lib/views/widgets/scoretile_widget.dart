import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScoreTile extends StatefulWidget {
  ScoreTile({Key? key}) : super(key: key);

  @override
  State<ScoreTile> createState() => _ScoreTileState();
}

class _ScoreTileState extends State<ScoreTile> {
  List<String> points = ['Culturals', 'Spectrun', 'Total'];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: 340,
      height: 340,
      padding: EdgeInsets.all(15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.black.withOpacity(0.75),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/paasha-logo.png'),
            ),
          ),
        ),
        Container(
          child: Text(
            'Rank 1',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                fontFamily: GoogleFonts.montserrat().fontFamily),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: points
              .map(
                (e) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Text(
                          e,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              fontFamily: GoogleFonts.montserrat().fontFamily),
                        ),
                      ),
                      Container(
                        child: Text(
                          '30',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              fontFamily: GoogleFonts.montserrat().fontFamily),
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
