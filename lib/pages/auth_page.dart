import 'package:aaveg_app/controllers/date_controller.dart';
import 'package:aaveg_app/controllers/nav_bar_controller.dart';
import 'package:aaveg_app/providers/storage_service.dart';
import 'package:aaveg_app/views/widgets/NavBar/countdown_timer_widget.dart';
import 'package:aaveg_app/views/widgets/NavBar/nav_icon_widget.dart';
import 'package:aaveg_app/views/widgets/NavBar/navbar_widget.dart';
import 'package:aaveg_app/views/widgets/NavBar/timer_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outlined_text/outlined_text.dart';

import '../utils/logger.dart';

var isVisible;
final NavBarController navBarController = Get.find<NavBarController>();

class AuthPage extends GetView<DateController> {
  @override
  Widget build(BuildContext context) {
    List<String> items = ['D  A\nY  S', 'H O\nU R S', 'MIN\nUTES', 'SECO\nNDS'];
    final storage = Get.find<StorageService>();
    final log = logger(AuthPage);
    log.i("Jwt : ${storage.getJwt()}");
    log.i("Jwt : ${storage.getName()}");
    log.i("Squad : ${storage.getSquad()}");
    final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
    var _mediaquery = MediaQuery.of(context);
    DateTime now = new DateTime.now();
    DateTime dateNow = new DateTime(
            now.year, now.month, now.day, now.hour, now.minute, now.second)
        .toUtc();
    return Scaffold(
        key: _key,
        onDrawerChanged: (isOpen) {
          navBarController.setVisiblity(!isOpen);
        },
        drawer: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.black.withOpacity(0.4),
            ),
            child: Drawer(
              child: NavbarWidget(),
            )),
        body: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.25), BlendMode.darken),
                  image: AssetImage('assets/images/homepage_bg.png'),
                  fit: BoxFit.fill,
                )),
                child: Stack(
                  children: [
                    NavIcon(globalKey: _key),
                    Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Visibility(
                              child: Container(
                                margin: EdgeInsets.only(top: 35, right: 20),
                                height: 35,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          color: Colors.white, width: 2.5),
                                    ),
                                    onPressed: () {
                                      controller.loginControl();
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Obx(() => Text(
                                          controller.buttonName.value,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              fontFamily:
                                                  GoogleFonts.montserrat()
                                                      .fontFamily))),
                                    ),
                                  ),
                                ),
                              ),
                              visible: true),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 4,
                            left: 10,
                            right: 10),
                        width: _mediaquery.size.width,
                        alignment: Alignment.center,
                        child: AutoSizeText(
                          "THE E D G E OF K-Os",
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: 'Anurati',
                            fontSize: 35,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 5, right: 5),
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TimerWidget(
                              list: items,
                              isCountdownn: false,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 5, right: 5),
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            controller.obx(
                              (state) => CountDownTimer(
                                duration: Duration(
                                    days: state!.date!.day.toInt() -
                                        dateNow.day.toInt(),
                                    hours: state.date!.hour.toInt() -
                                        dateNow.hour.toInt(),
                                    minutes: state.date!.minute.toInt() -
                                        dateNow.minute.toInt(),
                                    seconds: state.date!.second.toInt() -
                                        dateNow.second.toInt()),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 50, left: 5, right: 5),
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: OutlinedText(
                            text: Text(
                              '3 DAYS. 3 CUPS.\n1 WINNER.',
                              style: TextStyle(
                                  color: Colors.transparent,
                                  fontSize: 30,
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily),
                              textAlign: TextAlign.center,
                            ),
                            strokes: [
                              OutlinedTextStroke(color: Colors.white, width: 1),
                            ],
                          )),
                    ]),
                  ],
                )),
          ],
        ));
  }
}
