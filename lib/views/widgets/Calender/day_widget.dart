import 'package:aaveg_app/models/event_modal.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
    List<int> gap = [6, 1, 1, 5, 0, 3, 5, 1, 4, 6, 2, 4, 1];
    List<int> noOfDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    String text = '';
    widget.eventDatesThisMonth
        .where((element) => (element.rounds![0].month == widget.thisMonth &&
                element.rounds![0].day ==
                    widget.thisDay - gap[widget.thisMonth - 1] ||
            element.rounds![0].month == widget.thisMonth &&
                element.rounds![1].day ==
                    widget.thisDay - gap[widget.thisMonth - 1]))
        .toList()
        .map((e) {
      print(e.name);
      text += e.name! + '\n';
    }).toList();

    return widget.thisDay > gap[widget.thisMonth - 1] - 1 &&
            widget.thisDay <
                (gap[widget.thisMonth - 1] + noOfDays[widget.thisMonth - 1])
        ? Container(
            padding: EdgeInsets.fromLTRB(totalHeight * 0.005,
                totalHeight * 0.003, totalHeight * 0.003, totalHeight * 0.003),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(3)),
            child: SizedBox(
                // height: MediaQuery.of(context).size.height * 0.049,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(children: [
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${widget.thisDay - gap[widget.thisMonth - 1] + 1}',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.013,
                            ),
                          ),
                        ),
                      ),
                      if (text != '')
                        Expanded(
                          flex: 2,
                          // height: MediaQuery.of(context).size.height * 0.03,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: SingleChildScrollView(
                              child: AutoSizeText(
                                text,
                                minFontSize: 1,
                                maxFontSize: 8,
                                style: TextStyle(
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily,
                                ),
                              ),
                            ),
                          ),
                        )
                      else
                        Expanded(
                          child: Container(),
                          flex: 3,
                        )
                    ]))),
          )
        : Container();
  }
}
