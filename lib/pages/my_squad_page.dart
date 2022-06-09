import 'package:aaveg_app/controllers/nav_bar_controller.dart';
import 'package:aaveg_app/views/widgets/NavBar/nav_icon_widget.dart';
import 'package:aaveg_app/views/widgets/NavBar/navbar_widget.dart';
import 'package:aaveg_app/views/widgets/Mysquad/my_squad_char_desc.dart';
import 'package:aaveg_app/views/widgets/Mysquad/my_squad_details.dart';
import 'package:aaveg_app/views/widgets/Mysquad/my_squad_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySquad extends StatefulWidget {
  MySquad({Key? key}) : super(key: key);

  @override
  State<MySquad> createState() => _MySquadState();
}

class _MySquadState extends State<MySquad> {
  GlobalKey<ScaffoldState> _mysquadkey = GlobalKey<ScaffoldState>();
  final NavBarController navBarController = Get.find<NavBarController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _mysquadkey,
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
                image: AssetImage('assets/images/mysquad_bg.png'),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.darken),
              ),
            ),
            child: Stack(
              children: [
                NavIcon(globalKey: _mysquadkey),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 9),
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        "SQUAD NAME",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 10,
                            fontFamily: 'Anurati'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MySquadWidget(
                              width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.height / 2.5,
                              child: MySquadDetailsWidget(),
                            ),
                            MySquadWidget(
                              width: MediaQuery.of(context).size.width / 2.6,
                              height: MediaQuery.of(context).size.height / 2.5,
                              child: MySquadDetailsWidget(),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: MySquadWidget(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 4,
                            child: MySquadCharacterDescWidget(),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
