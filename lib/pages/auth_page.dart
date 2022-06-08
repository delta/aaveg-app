import 'package:aaveg_app/controllers/nav_bar_controller.dart';
import 'package:aaveg_app/providers/storage_service.dart';
import 'package:aaveg_app/views/widgets/NavBar/countdown_timer_widget.dart';
import 'package:aaveg_app/views/widgets/AuthWebView/dauth_web_view.dart';
import 'package:aaveg_app/views/widgets/NavBar/nav_icon_widget.dart';
import 'package:aaveg_app/views/widgets/NavBar/navbar_widget.dart';
import 'package:aaveg_app/views/widgets/NavBar/timer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outlined_text/outlined_text.dart';

import '../utils/logger.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  var isVisible;
  final NavBarController navBarController = Get.find<NavBarController>();
  @override
  Widget build(BuildContext context) {
    List<String> items = ['D  A\nY  S', 'H O\nU R S', 'MIN\nUTES', 'SECO\nNDS'];
    final storage = Get.find<StorageService>();
    final log = logger(AuthPage);
    log.i("Jwt : ${storage.getJwt()}");
    log.i("Jwt : ${storage.getName()}");
    log.i("Squad : ${storage.getSquad()}");

    var _mediaquery = MediaQuery.of(context);
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
              child: NavbarWdiget(),
            )),
        body: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.25), BlendMode.darken),
                  image: AssetImage('assets/images/home_background.jpeg'),
                  fit: BoxFit.fill,
                )),
                child: Stack(
                  children: [
                    NavIcon(globalKey: _key),
                    Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
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
                                  Get.to(WebViewWidget());
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text("LOGIN",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: GoogleFonts.montserrat()
                                              .fontFamily)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 150, left: 10, right: 10),
                        width: _mediaquery.size.width,
                        alignment: Alignment.center,
                        child: Text(
                          "THE E D G E OF K-Os",
                          style: TextStyle(
                              fontFamily: 'Anurati',
                              fontSize: 35,
                              letterSpacing: 0.2,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 5, right: 5),
                        width: double.infinity,
                        alignment: Alignment.center,
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
                          children: [CountDownTimer()],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 130, left: 5, right: 5),
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: OutlinedText(
                            text: Text(
                              '3 DAYS OF (INSERT SOME FANCY WORDS) ',
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
