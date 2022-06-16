import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/event_modal.dart';

class EventPopup extends StatefulWidget {
  final Event event;
  const EventPopup({Key? key, required this.event}) : super(key: key);

  @override
  _EventPopupState createState() => _EventPopupState();
}

class _EventPopupState extends State<EventPopup> {
  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;
    double totalWidth = MediaQuery.of(context).size.width;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: SizedBox(
          height: totalHeight * 0.65,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              height: totalHeight * 0.54,
              width: totalWidth * 0.95,
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    flex: 25,
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        )),
                  ),
                  Expanded(
                    flex: 209,
                    child: Image.network(
                      widget.event.imageLink!,
                      height: totalHeight * 0.226,
                      width: totalHeight * 0.226,
                    ),
                  ),
                  Expanded(
                    flex: 30,
                    child: Center(
                      child: Text(
                        widget.event.name!,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2,
                            fontSize: totalHeight * 0.024,
                            fontFamily: GoogleFonts.montserrat().fontFamily),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 20,
                    child: Center(
                      child: Text(
                        widget.event.cluster!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: totalHeight * 0.016,
                            fontFamily: GoogleFonts.montserrat().fontFamily),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 70,
                    child: Center(
                      child: Text(
                        widget.event.description!,
                        style: TextStyle(
                            fontSize: totalHeight * 0.013,
                            fontFamily: GoogleFonts.montserrat().fontFamily),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 25,
                    child: Center(
                      child: Text(
                        widget.event.cup!,
                        style: TextStyle(
                            fontSize: totalHeight * 0.0184,
                            fontFamily: GoogleFonts.montserrat().fontFamily),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 25,
                    child: Center(
                      child: InkWell(
                        onTap: () =>
                            launchUrl(Uri.parse(widget.event.rulebookLink!)),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'click here for rulebook',
                                  style: TextStyle(
                                      fontSize: totalHeight * 0.0162,
                                      fontFamily:
                                          GoogleFonts.montserrat().fontFamily),
                                ),
                              ),
                            ),
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: ImageIcon(
                                      AssetImage('assets/images/arrow.png'))),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 60,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: ImageIcon(
                                    AssetImage('assets/images/Group 27.png')))),
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.event.rounds![0].day.toString() +
                                    '-' +
                                    widget.event.rounds![0].month.toString() +
                                    '-' +
                                    widget.event.rounds![0].year.toString() +
                                    ' (Round 1)' +
                                    '\n' +
                                    widget.event.rounds![1].day.toString() +
                                    '-' +
                                    widget.event.rounds![1].month.toString() +
                                    '-' +
                                    widget.event.rounds![1].year.toString() +
                                    ' (Round2)',
                                style: TextStyle(
                                    fontSize: totalHeight * 0.0141,
                                    fontFamily:
                                        GoogleFonts.montserrat().fontFamily),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.event.rounds![0].hour.toString() +
                                  ':' +
                                  widget.event.rounds![0].minute.toString() +
                                  '\n' +
                                  widget.event.rounds![1].hour.toString() +
                                  ':' +
                                  widget.event.rounds![1].minute.toString(),
                              style: TextStyle(
                                  fontSize: totalHeight * 0.0141,
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
