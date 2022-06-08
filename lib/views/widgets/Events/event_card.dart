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
          duration: Duration(milliseconds: 100),
          height: selected ? 430 : 150,
          width: selected ? 930 : 350,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(7)),
          child: selected
              ? Expanded(
                  child: SizedBox(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 150,
                          width: 150,
                          child: Image(
                            image: AssetImage(
                              'assets/images/saaranga logo 1.png',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              widget.event.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              widget.event.clusterName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 20,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              widget.event.desc,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 9,
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 45,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              widget.event.cupName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'click here for rulebook -->',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 25,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              widget.event.r1Date +
                                  '      ' +
                                  widget.event.r2Date,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              widget.event.r2Date +
                                  '      ' +
                                  widget.event.r1Date,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Expanded(
                  child: SizedBox(
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
                                  child: AutoSizeText(
                                    widget.event.name,
                                    minFontSize: 10,
                                    maxFontSize: 40,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40,
                                        fontFamily: GoogleFonts.montserrat()
                                            .fontFamily),
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
                                          fontSize: 16,
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
                                        fontFamily: GoogleFonts.montserrat()
                                            .fontFamily),
                                  ),
                                ),
                                flex: 1),
                          ]),
                          flex: 2,
                        )
                      ],
                    ),
                  ),
                )),
    );
  }
}
