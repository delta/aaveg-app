import 'package:aaveg_app/models/score_model.dart';
import 'package:aaveg_app/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScoreTile extends StatefulWidget {
  final Squad score;
  final int rank;
  ScoreTile({Key? key, required this.score, required this.rank})
      : super(key: key);

  @override
  State<ScoreTile> createState() => _ScoreTileState();
}

class _ScoreTileState extends State<ScoreTile> {
  final log = logger(ScoreTile);
  @override
  Widget build(BuildContext context) {
    Map<String, int?> points = {
      "Curtural": widget.score.points?.culturals,
      "Spectrum": widget.score.points?.spectrum,
      "Total": widget.score.points?.overall
    };
    log.d(widget.score);
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      width: 3 * MediaQuery.of(context).size.width / 4,
      // height: MediaQuery.of(context).size.height / 2.3,
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
                  image: AssetImage(
                      'assets/images/squads/${widget.score.name}.png'),
                ),
              ),
            ),
            Visibility(
              child: Container(
                margin: EdgeInsets.only(top: 8, bottom: 8, left: 5),
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Rank: ${widget.rank}',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      fontFamily: GoogleFonts.montserrat().fontFamily),
                  textAlign: TextAlign.center,
                ),
              ),
              visible: widget.score.position?.overall != null &&
                  widget.score.position!.overall! > 0,
            ),
            Table(defaultColumnWidth: FixedColumnWidth(120.0), children: [
              for (var point in points.entries)
                TableRow(children: [
                  Container(
                    margin: EdgeInsets.only(top: 2, bottom: 2, left: 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      point.key,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: GoogleFonts.montserrat().fontFamily),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 2, bottom: 2, left: 5),
                    child: Text(
                      point.value.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: GoogleFonts.montserrat().fontFamily),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ]),
            ])
          ]),
        ),
      ]),
    );
  }
}
