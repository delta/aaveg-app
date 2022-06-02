import 'package:aaveg_app/controllers/nav_bar_controller.dart';
import 'package:aaveg_app/views/widgets/NavBar/nav_icon_widget.dart';
import 'package:aaveg_app/views/widgets/NavBar/navbar_widget.dart';
import 'package:aaveg_app/views/widgets/Team/team_tile_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamPage extends StatefulWidget {
  TeamPage({Key? key}) : super(key: key);

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  final NavBarController navBarController = Get.find<NavBarController>();
  GlobalKey<ScaffoldState> _teamPagekey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    setteamList("Core");
    setTeamDescription("Core");
  }

  List<String> teamList = [];
  String describeTeam = "";
  void setteamList(String teamName) {
    setState(() {
      teamList = [
        '$teamName 1',
        '$teamName 2',
        '$teamName 3',
        '$teamName 4',
        '$teamName 5',
        '$teamName 6',
        '$teamName 7',
        '$teamName 8',
        '$teamName 9',
        '$teamName 10',
      ];
    });
    setTeamDescription(teamName);
  }

  void setTeamDescription(String teamName) {
    setState(() {
      describeTeam = "Small Character description about $teamName";
    });
  }

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
                  SingleChildScrollView(
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
                                setteamList("Core");
                              },
                              child: Text(
                                'Core',
                                style: ButtonBarTextStyle.textStyle,
                              )),
                          TextButton(
                              onPressed: () {
                                setteamList("WebOps");
                              },
                              child: Text('WebOps',
                                  style: ButtonBarTextStyle.textStyle)),
                          TextButton(
                              onPressed: () {
                                setteamList("Content");
                              },
                              child: Text('Content',
                                  style: ButtonBarTextStyle.textStyle)),
                          TextButton(
                              onPressed: () {
                                setteamList("Design");
                              },
                              child: Text('Design',
                                  style: ButtonBarTextStyle.textStyle)),
                          TextButton(
                              onPressed: () {
                                setteamList("OC");
                              },
                              child: Text('OC',
                                  style: ButtonBarTextStyle.textStyle)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      physics: ClampingScrollPhysics(),
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        width: double.infinity,
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Color(0xF90202).withOpacity(0.25),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: AutoSizeText(
                          describeTeam,
                          style: ButtonBarTextStyle.textStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Expanded(
                        child: GridView.builder(
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
                          name: teamList[index],
                          imgUrl: "1",
                        );
                      },
                      itemCount: teamList.length,
                    )),
                  )
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
