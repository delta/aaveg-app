import 'dart:ui';

import 'package:aaveg_app/models/cupdata.dart';
import 'package:aaveg_app/utils/clan_utils.dart';
import 'package:flutter/material.dart';

class CupDetails extends StatelessWidget {
  final CupData cups;

  const CupDetails({Key key, this.cups}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
        flex: 1,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
            margin: EdgeInsets.fromLTRB(24, 8, 24, 8),
            child: Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Theme.of(context).primaryColor, width: 0.4),
                    borderRadius: BorderRadius.circular(7.0)),
                color: Colors.black.withAlpha(1340),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: EdgeInsets.all(8),
                          child: Image.asset(cups.cup)),
                      Text(cups.label,
                          style: TextStyle(
                              color: Colors.grey.shade50,
                              fontWeight: FontWeight.bold,
                              fontSize: size.height * 0.02)),
                      Container(
                        padding: EdgeInsets.all(24),
                        child: Text.rich(TextSpan(
                            text: cups.rank,
                            style: TextStyle(
                                color: Colors.grey.shade100.withOpacity(0.85),
                                fontWeight: FontWeight.bold,
                                fontSize: size.height * 0.04),
                            children: <InlineSpan>[
                              WidgetSpan(
                                  child: Transform.translate(
                                offset: const Offset(1.6, -15),
                                child: Text(
                                  Utils().getSuperScript(int.parse(cups.rank)),
                                  textScaleFactor: 1.2,
                                  style: TextStyle(
                                      color: Colors.grey.shade100
                                          .withOpacity(0.85)),
                                ),
                              )),
                            ])),
                      ),
                    ]))));
  }
}
