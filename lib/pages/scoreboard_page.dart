import 'package:aaveg_app/controllers/nav_bar_controller.dart';
import 'package:aaveg_app/views/widgets/NavBar/nav_icon_widget.dart';
import 'package:aaveg_app/views/widgets/NavBar/navbar_widget.dart';
import 'package:aaveg_app/views/widgets/scoretile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScoreBoardPage extends StatefulWidget {
  ScoreBoardPage({Key? key}) : super(key: key);

  @override
  State<ScoreBoardPage> createState() => _ScoreBoardPageState();
}

class _ScoreBoardPageState extends State<ScoreBoardPage> {
  GlobalKey<ScaffoldState> _scoreboardKey = GlobalKey<ScaffoldState>();
  final NavBarController navBarController = Get.find<NavBarController>();
  Map<String, String> map = Map();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scoreboardKey,
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
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/scoreboard_bg.png'),
                  colorFilter:
                      ColorFilter.mode(Colors.black, BlendMode.dstATop),
                ),
              ),
              child: Stack(
                children: [
                  NavIcon(globalKey: _scoreboardKey),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 6),
                        width: double.infinity,
                        child: Text(
                          "SCOREBOARD",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 10,
                              fontFamily: 'Anurati'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            physics: ClampingScrollPhysics(),
                            child: Padding(
                              padding: EdgeInsets.all(3),
                              child: Column(
                                children: [
                                  ScoreTile(),
                                  ScoreTile(),
                                  ScoreTile(),
                                  ScoreTile()
                                ],
                              ),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
