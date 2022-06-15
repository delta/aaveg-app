import 'package:aaveg_app/models/event_modal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DayWidget extends StatefulWidget {
  final int thisMonth;
  final int thisDay;
  final List<Event> eventDatesThisMonth;
  const DayWidget(
      {Key? key,
      required this.eventDatesThisMonth,
      required this.thisMonth,
      required this.thisDay})
      : super(key: key);

  @override
  State<DayWidget> createState() => _DayWidgetState();
}

class _DayWidgetState extends State<DayWidget> {
  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;

    return widget.thisDay > 1
        ? Container(
            height: totalHeight * 0.007,
            padding: EdgeInsets.fromLTRB(totalHeight * 0.005,
                totalHeight * 0.003, totalHeight * 0.003, totalHeight * 0.003),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(3)),
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.049,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${widget.thisDay - 1}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.013,
                          ),
                        ),
                      ),
                      Column(
                        children: widget.eventDatesThisMonth
                            .where((element) => (element.rounds![0].month ==
                                        widget.thisMonth &&
                                    element.rounds![0].day ==
                                        widget.thisDay - 2 ||
                                element.rounds![0].month == widget.thisMonth &&
                                    element.rounds![1].day ==
                                        widget.thisDay - 2))
                            .toList()
                            .map((e) {
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${e.name}',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.011),
                            ),
                          );
                        }).toList(),
                      )
                    ]))),
          )
        : Container();
  }
}
