import 'package:aaveg_app/controllers/nav_bar_controller.dart';
import 'package:aaveg_app/views/widgets/NavBar/nav_icon_widget.dart';
import 'package:aaveg_app/views/widgets/NavBar/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
final NavBarController navBarController = Get.find<NavBarController>();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
      body: Stack(children: [
        NavIcon(globalKey: _scaffoldKey),
        Container(
          alignment: Alignment.center,
          child: Text(
            'Home Page',
            textAlign: TextAlign.center,
          ),
        )
      ]),
    );
  }
}
