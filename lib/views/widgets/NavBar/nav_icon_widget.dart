import 'package:aaveg_app/controllers/nav_bar_controller.dart';
import 'package:aaveg_app/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavIcon extends StatefulWidget {
  final GlobalKey<ScaffoldState> globalKey;
  NavIcon({Key? key, required this.globalKey}) : super(key: key);
  @override
  State<NavIcon> createState() => _NavIconState();
}

class _NavIconState extends State<NavIcon> {
  bool isVisible = true;
  final NavBarController navBarController = Get.find<NavBarController>();
  var log = logger(NavIcon);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Obx((() => Container(
            margin: EdgeInsets.only(top: 22, left: 5),
            child: Visibility(
              child: IconButton(
                onPressed: () {
                  widget.globalKey.currentState!.openDrawer();
                  log.i(widget.globalKey.currentState?.isDrawerOpen);
                  log.w(widget.globalKey.currentState?.isDrawerOpen);
                },
                icon: Icon(Icons.menu, size: 40),
                color: Colors.white,
              ),
              visible: navBarController.isVisible.isTrue,
            )))));
  }
}
