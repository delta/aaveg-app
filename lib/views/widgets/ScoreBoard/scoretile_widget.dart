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
      margin: EdgeInsets.only(top: 20, bottom: 20),
      width: 3 * MediaQuery.of(context).size.width / 4,
      height: MediaQuery.of(context).size.height / 2.3,
      padding: EdgeInsets.all(15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.black.withOpacity(0.65),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(children: [
        Container(
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
            Container(
              margin: EdgeInsets.only(top: 8, bottom: 8, left: 5),
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Rank1',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    fontFamily: GoogleFonts.montserrat().fontFamily),
                textAlign: TextAlign.center,
              ),
            ),
            Table(
              defaultColumnWidth: FixedColumnWidth(100.0),
              children: points
                  .map(
                    (e) => TableRow(children: [
                      Container(
                        margin: EdgeInsets.only(top: 2, bottom: 2, left: 5),
                        // padding: EdgeInsets.symmetric(vertical: 8.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          e,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontFamily: GoogleFonts.montserrat().fontFamily),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        // padding: EdgeInsets.symmetric(vertical: 8.0),
                        margin: EdgeInsets.only(top: 2, bottom: 2, left: 5),
                        child: Text(
                          '30',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontFamily: GoogleFonts.montserrat().fontFamily),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ]),
                  )
                  .toList(),
            )
          ]),
        ),
      ]),
    );
  }
}
