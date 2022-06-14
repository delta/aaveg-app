import 'package:aaveg_app/controllers/nav_bar_controller.dart';
import 'package:aaveg_app/controllers/score_controller.dart';
import 'package:aaveg_app/models/score_model.dart';
import 'package:aaveg_app/views/widgets/NavBar/nav_icon_widget.dart';
import 'package:aaveg_app/views/widgets/NavBar/navbar_widget.dart';
import 'package:aaveg_app/views/widgets/ScoreBoard/scoretile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

GlobalKey<ScaffoldState> _scoreboardKey = GlobalKey<ScaffoldState>();
final NavBarController navBarController = Get.find<NavBarController>();
final ScoreController scoreController = Get.find<ScoreController>();
Map<String, String> map = Map();
ScoreModel? scoreModel;

class ScoreBoardPage extends GetView<ScoreController> {
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
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.25), BlendMode.darken),
                ),
              ),
              child: Stack(
                children: [
                  NavIcon(globalKey: _scoreboardKey),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 8),
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
                              child: controller.obx(
                                (state) => Column(
                                  children: [
                                    for (var i = 0;
                                        i < state!.squads!.length;
                                        i++)
                                      ScoreTile(
                                        score: state.squads![i],
                                        rank: i + 1,
                                      ),
                                  ],
                                ),
                                onError: (e) => Text(e.toString()),
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
