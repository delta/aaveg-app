import 'package:aaveg_app/controllers/nav_bar_controller.dart';
import 'package:aaveg_app/views/widgets/NavBar/nav_icon_widget.dart';
import 'package:aaveg_app/views/widgets/NavBar/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SponsorPage extends StatelessWidget {
  const SponsorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavBarController navBarController = Get.find<NavBarController>();
    GlobalKey<ScaffoldState> _sponsorkey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: _sponsorkey,
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
        body: Container(
          child: Stack(
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
                  NavIcon(globalKey: _sponsorkey),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 6),
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          "SPONSORS",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 10,
                              fontFamily: 'Anurati'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical:
                                    MediaQuery.of(context).size.height / 5),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical:
                                    MediaQuery.of(context).size.height / 15),
                            width: double.infinity,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.75),
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.asset('assets/images/sponsor1.png'),
                          )
                        ],
                      )
                    ],
                  )
                ]),
              )
            ],
          ),
        ));
  }
}
