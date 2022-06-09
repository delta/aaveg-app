import 'package:aaveg_app/controllers/calendar_page_controller.dart';
import 'package:aaveg_app/controllers/nav_bar_controller.dart';
import 'package:aaveg_app/views/widgets/Calender/calender_widget.dart';
import 'package:aaveg_app/views/widgets/NavBar/nav_icon_widget.dart';
import 'package:aaveg_app/views/widgets/NavBar/navbar_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _SampleState();
}

final NavBarController navBarController = Get.find<NavBarController>();
GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _SampleState extends State<CalendarPage> with TickerProviderStateMixin {
  // finds your controller and uses it
  final sampleController = Get.find<CalendarPageController>();
  final dayList = new List<int>.generate(35, (i) => i + 1);

  @override
  void initState() {
    super.initState();
  }

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
            child: NavbarWdiget(),
          )),
      body: Stack(children: [
        Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/images/sci_fi_landscape_4k-2560x1440 1.png'))),
          child: Stack(children: [
            NavIcon(globalKey: _scaffoldKey),
            Column(
              children: [
                Expanded(
                  child: Container(),
                  flex: 200,
                ),
                Expanded(
                    flex: 64,
                    child: Center(
                      child: AutoSizeText('EVENT CALENDER',
                          maxLines: 1,
                          minFontSize: 20,
                          maxFontSize: 40,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Anurati',
                              fontSize: 42,
                              letterSpacing: 5)),
                    )),
                // Expanded(child: Container(), flex: 200),
                Expanded(
                  child: CalenderWidget(),
                  flex: 1200,
                ),
                // Expanded(child: Container(), flex: 279),
              ],
            ),
          ]),
        ),
      ]),
    );
  }
}
