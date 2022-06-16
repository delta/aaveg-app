import 'package:aaveg_app/controllers/event_popup_controller.dart';
import 'package:aaveg_app/models/event_modal.dart';
import 'package:aaveg_app/views/widgets/Events/event_popup.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    EventPopupController controller = Get.find<EventPopupController>();
    return Container(
        margin: EdgeInsets.fromLTRB(32, 10, 32, 10),
        padding: EdgeInsets.all(20),
        height: 150,
        width: 350,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.65),
            borderRadius: BorderRadius.circular(7)),
        child: Container(
          child: Row(
            children: [
              Expanded(
                  child: SizedBox(
                    height: 107,
                    width: 107,
                    child: Image.network(widget.event.imageLink!),
                  ),
                  flex: 1),
              SizedBox(width: 25),
              Expanded(
                child: Column(children: [
                  Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          widget.event.name!,
                          minFontSize: 10,
                          maxFontSize: 50,
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              // fontSize: totalHeight * 0.03,
                              fontFamily: GoogleFonts.montserrat().fontFamily),
                        ),
                      ),
                      flex: 1),
                  Expanded(
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
                                fontWeight: FontWeight.bold,
                                fontSize: totalHeight * 0.015,
                                fontFamily:
                                    GoogleFonts.montserrat().fontFamily)),
                      ),
                      flex: 1),
                  Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  barrierColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    controller.getDetails(widget.event.id!);
                                    return controller.obx(
                                        (event) => EventPopup(event: event!));
                                  });
                            },
                            child: Text(
                              'Know more',
                              style: TextStyle(
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily,
                                  fontSize: totalHeight * 0.018,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: ImageIcon(
                                  AssetImage('assets/images/arrow.png')))
                        ]),
                      ),
                      flex: 1),
                ]),
                flex: 2,
              )
            ],
          ),
        ));
  }
}
