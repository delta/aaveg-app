import 'package:aaveg_app/controllers/my_squad_controller.dart';
import 'package:aaveg_app/controllers/nav_bar_controller.dart';
import 'package:aaveg_app/models/my_squad_model.dart';
import 'package:aaveg_app/views/widgets/Mysquad/my_squad_image.dart';
import 'package:aaveg_app/views/widgets/NavBar/nav_icon_widget.dart';
import 'package:aaveg_app/views/widgets/NavBar/navbar_widget.dart';
import 'package:aaveg_app/views/widgets/Mysquad/my_squad_char_desc.dart';
import 'package:aaveg_app/views/widgets/Mysquad/my_squad_details.dart';
import 'package:aaveg_app/views/widgets/Mysquad/my_squad_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final NavBarController navBarController = Get.find<NavBarController>();
Points points = Points();

class MySquad extends GetView<MySquadController> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _mysquadkey = GlobalKey<ScaffoldState>();

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
            child: NavbarWidget(),
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
                controller.obx(
                  ((state) => Container(
                        child: Column(
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                    top:
                                        MediaQuery.of(context).size.height / 9),
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: Text(
                                  state?.squad?.name ?? "SQUAD",
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 10,
                                      fontFamily: 'Anurati'),
                                  textAlign: TextAlign.center,
                                )),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MySquadWidget(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2.3,
                                      child: MySquadDetailsWidget(
                                        mysquadModel: state!,
                                      ),
                                    ),
                                    MySquadWidget(
                                      width: MediaQuery.of(context).size.width /
                                          2.6,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2.3,
                                      child: MySquadImage(
                                        squadName:
                                            state.squad!.name!.toLowerCase(),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  child: MySquadWidget(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    child: MySquadCharacterDescWidget(
                                      desc: state.squad!.description!,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                  onError: (error) => Container(
                    child: Center(
                      child: Text(error.toString()),
                    ),
                  ),
                  onLoading: Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
