import 'dart:ui';

import 'package:aaveg_app/models/my_squad_model.dart';
import 'package:aaveg_app/providers/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MySquadDetailsWidget extends StatefulWidget {
  final MysquadModel mysquadModel;
  MySquadDetailsWidget({Key? key, required this.mysquadModel})
      : super(key: key);

  @override
  State<MySquadDetailsWidget> createState() => _MySquadDetailsWidgetState();
}

class _MySquadDetailsWidgetState extends State<MySquadDetailsWidget> {
  List<String> events = ['Culturals', 'Spectrum', 'Overall'];
  List<String> sup = ["th", "st", "nd", "rd", "th", "th", "th"];
  final storage = Get.find<StorageService>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image:
                  AssetImage('assets/images/squads/${storage.getSquad()}.png'),
            ),
          ),
        ),
        Table(
          columnWidths: {
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(1),
          },
          children: events
              .map(
                (e) => TableRow(children: [
                  Container(
                    margin: EdgeInsets.only(top: 8, bottom: 8, left: 5),
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      e,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          fontFamily: GoogleFonts.montserrat().fontFamily),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    margin: EdgeInsets.only(top: 8, bottom: 8, left: 5),
                    child: Text(
                      e == "Culturals"
                          ? widget.mysquadModel.squad!.points!.culturals
                              .toString()
                          : e == "Spectrum"
                              ? widget.mysquadModel.squad!.points!.spectrum
                                  .toString()
                              : widget.mysquadModel.squad!.points!.overall
                                  .toString(),
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          fontFamily: GoogleFonts.montserrat().fontFamily),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 8, bottom: 8, left: 15),
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: [
                          Text(
                            e == "Culturals"
                                ? widget.mysquadModel.squad!.position!.culturals
                                    .toString()
                                : e == "Spectrum"
                                    ? widget
                                        .mysquadModel.squad!.position!.spectrum
                                        .toString()
                                    : widget
                                        .mysquadModel.squad!.position!.overall
                                        .toString(),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                fontFamily:
                                    GoogleFonts.montserrat().fontFamily),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            e == "Culturals"
                                ? sup[widget
                                    .mysquadModel.squad!.position!.culturals!]
                                : e == "Spectrum"
                                    ? sup[widget.mysquadModel.squad!.position!
                                        .spectrum!]
                                    : sup[widget.mysquadModel.squad!.position!
                                        .overall!],
                            style: TextStyle(
                                fontSize: 8,
                                fontFeatures: [FontFeature.superscripts()]),
                          ),
                        ],
                      )),
                ]),
              )
              .toList(),
        )
      ]),
    );
  }
}
