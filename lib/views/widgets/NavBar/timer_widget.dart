import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimerWidget extends StatelessWidget {
  final List<String> list;
  final bool isCountdownn;
  const TimerWidget({Key? key, required this.list, required this.isCountdownn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: list
            .map(
              (e) => Row(children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    e,
                    style: TextStyle(
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                        fontSize: isCountdownn ? 25 : 17,
                        fontWeight:
                            isCountdownn ? FontWeight.w900 : FontWeight.w400,
                        letterSpacing: MediaQuery.of(context).size.width / 45),
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
            )
            .toList(),
      ),
    );
  }
}
