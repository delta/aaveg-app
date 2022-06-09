import 'package:aaveg_app/models/event_modal.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventCard extends StatefulWidget {
  final Event event;

  const EventCard({Key? key, required this.event}) : super(key: key);

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: AnimatedContainer(
          margin: selected
              ? EdgeInsets.fromLTRB(12, 10, 12, 10)
              : EdgeInsets.fromLTRB(32, 10, 32, 10),
          padding: EdgeInsets.all(20),
          duration: Duration(milliseconds: 400),
          height: selected ? 430 : 150,
          width: selected ? 930 : 350,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.65),
              borderRadius: BorderRadius.circular(7)),
          child: selected
              ? Container(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 209,
                        child: Image(
                          image: AssetImage(
                            'assets/images/saaranga logo 1.png',
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 35,
                        child: Center(
                          child: Text(
                            widget.event.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: totalHeight * 0.024,
                                fontFamily:
                                    GoogleFonts.montserrat().fontFamily),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 25,
                        child: Center(
                          child: Text(
                            widget.event.clusterName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: totalHeight * 0.016,
                                fontFamily:
                                    GoogleFonts.montserrat().fontFamily),
                          ),
                        ),
                      ),
                      // Expanded(
                      //   flex: ,
                      //   child: Container(
                      //   ),
                      // ),
                      Expanded(
                        flex: 70,
                        child: Center(
                          child: Text(
                            widget.event.desc,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: totalHeight * 0.011,
                                fontFamily:
                                    GoogleFonts.montserrat().fontFamily),
                          ),
                        ),
                      ),
                      // Expanded(
                      //   child: SizedBox(
                      //     height: 45,
                      //   ),
                      // ),
                      Expanded(
                        flex: 25,
                        child: Center(
                          child: Text(
                            widget.event.cupName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: totalHeight * 0.0184,
                                fontFamily:
                                    GoogleFonts.montserrat().fontFamily),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 25,
                        child: Center(
                          child: Text(
                            'click here for rulebook -->',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: totalHeight * 0.0162,
                                fontFamily:
                                    GoogleFonts.montserrat().fontFamily),
                          ),
                        ),
                      ),
                      // Expanded(
                      //   child: SizedBox(
                      //     height: 25,
                      //   ),
                      // ),
                      Expanded(
                        flex: 25,
                        child: Center(
                          child: Text(
                            widget.event.r1Date +
                                '      ' +
                                widget.event.r2Date,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: totalHeight * 0.0141,
                                fontFamily:
                                    GoogleFonts.montserrat().fontFamily),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 25,
                        child: Center(
                          child: Text(
                            widget.event.r2Date +
                                '      ' +
                                widget.event.r1Date,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: totalHeight * 0.0141,
                                fontFamily:
                                    GoogleFonts.montserrat().fontFamily),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  child: Row(
                    children: [
                      Expanded(
                          child: SizedBox(
                            height: 107,
                            width: 107,
                            child: Image(
                              image: AssetImage(
                                  'assets/images/saaranga logo 1.png'),
                            ),
                          ),
                          flex: 1),
                      SizedBox(width: 25),
                      Expanded(
                        child: Column(children: [
                          Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget.event.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: totalHeight * 0.03,
                                      fontFamily:
                                          GoogleFonts.montserrat().fontFamily),
                                ),
                              ),
                              flex: 1),
                          Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    widget.event.r1Date +
                                        '\n' +
                                        widget.event.r2Date,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: totalHeight * 0.015,
                                        fontFamily: GoogleFonts.montserrat()
                                            .fontFamily)),
                              ),
                              flex: 1),
                          Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Know more',
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.montserrat().fontFamily,
                                      fontSize: totalHeight * 0.012),
                                ),
                              ),
                              flex: 1),
                        ]),
                        flex: 2,
                      )
                    ],
                  ),
                )),
    );
  }
}
