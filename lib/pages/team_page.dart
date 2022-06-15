import 'package:aaveg_app/controllers/nav_bar_controller.dart';
import 'package:aaveg_app/controllers/team_controller.dart';
import 'package:aaveg_app/views/widgets/NavBar/nav_icon_widget.dart';
import 'package:aaveg_app/views/widgets/NavBar/navbar_widget.dart';
import 'package:aaveg_app/views/widgets/Team/team_tile_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// class TeamPage extends StatefulWidget {
//   TeamPage({Key? key}) : super(key: key);

//   @override
//   State<TeamPage> createState() => _TeamPageState();
// }
final NavBarController navBarController = Get.find<NavBarController>();
GlobalKey<ScaffoldState> _teamPagekey = GlobalKey<ScaffoldState>();
List<String> teamList = [];
String describeTeam = "";
String team = "";

class TeamPage extends GetView<TeamController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _teamPagekey,
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
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/teams_bg.png'),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.darken),
              ),
            ),
            child: Stack(children: [
              NavIcon(globalKey: _teamPagekey),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 8),
                    width: double.infinity,
                    child: Text(
                      "TEAMS",
                      style: TextStyle(
                          fontSize: 50,
                          fontFamily: 'Anurati',
                          letterSpacing: 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Obx((() => SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.black.withOpacity(0.5)),
                          alignment: Alignment.centerLeft,
                          child: ButtonBar(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                onPressed: () {
                                  controller.setTeam("Core", 0);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: controller.team.value == "Core"
                                            ? Colors.white
                                            : Colors.transparent),
                                  ),
                                  child: Text(
                                    'Core',
                                    style: ButtonBarTextStyle.textStyle,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  controller.setTeam("WebOps", 1);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              controller.team.value == "WebOps"
                                                  ? Colors.white
                                                  : Colors.transparent)),
                                  child: Text(
                                    'WebOps',
                                    style: ButtonBarTextStyle.textStyle,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  controller.setTeam("Content", 2);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              controller.team.value == "Content"
                                                  ? Colors.white
                                                  : Colors.transparent)),
                                  child: Text(
                                    'Content',
                                    style: ButtonBarTextStyle.textStyle,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  controller.setTeam("Design", 3);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              controller.team.value == "Design"
                                                  ? Colors.white
                                                  : Colors.transparent)),
                                  child: Text(
                                    'Design',
                                    style: ButtonBarTextStyle.textStyle,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  controller.setTeam("OC", 4);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: controller.team.value == "OC"
                                              ? Colors.white
                                              : Colors.transparent)),
                                  child: Text(
                                    'OC',
                                    style: ButtonBarTextStyle.textStyle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))),
                  Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      physics: ClampingScrollPhysics(),
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 100,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Color(0xF90202).withOpacity(0.25),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: controller.obx((state) => Obx(
                              () => AutoSizeText(
                                state!.teamsData![controller.teamIndex.value]
                                    .desc!,
                                style: ButtonBarTextStyle.textStyle,
                                textAlign: TextAlign.center,
                              ),
                            )),
                      ),
                    ),
                  ),
                  Container(
                    child: controller.obx((state) => Expanded(
                          child: Obx(() => GridView.builder(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 5,
                                        crossAxisSpacing: 5,
                                        childAspectRatio: 3 / 4,
                                        crossAxisCount: 2),
                                itemBuilder: (context, index) {
                                  return TeamTileWidget(
                                    name: state!
                                        .teamsData![controller.teamIndex.value]
                                        .members![index]
                                        .name!,
                                    imgUrl:
                                        "https://aaveg.in/22/assets/images/team/${state.teamsData![controller.teamIndex.value].members![index].rollNo}.jpg",
                                  );
                                },
                                itemCount: state!
                                    .teamsData![controller.teamIndex.value]
                                    .members!
                                    .length,
                              )),
                        )),
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class ButtonBarTextStyle extends TextStyle {
  static TextStyle textStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w300,
    fontFamily: GoogleFonts.inter().fontFamily,
    color: Colors.white,
  );
}
