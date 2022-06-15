import 'package:aaveg_app/controllers/events_page_controller.dart';
import 'package:aaveg_app/controllers/nav_bar_controller.dart';
import 'package:aaveg_app/views/widgets/Events/event_card.dart';
import 'package:aaveg_app/views/widgets/NavBar/nav_icon_widget.dart';
import 'package:aaveg_app/views/widgets/NavBar/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

final NavBarController navBarController = Get.find<NavBarController>();
GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class EventsPage extends GetView<EventsPageController> {
  // finds your controller and uses it

  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;

    double totalWidth = MediaQuery.of(context).size.width;
    final eventController = Get.find<EventsPageController>();
    final MyTabController _tabx = Get.put(MyTabController());
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
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/scoreboard_bg.png'),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.darken),
            )),
            child: Stack(children: [
              NavIcon(globalKey: _scaffoldKey),
              Column(
                children: [
                  Expanded(child: SizedBox(), flex: 50),
                  Expanded(
                      flex: 122,
                      child: Center(
                        child: Text('EVENTS',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Anurati',
                                fontSize: totalHeight * 0.07,
                                letterSpacing: 10)),
                      )),
                  Expanded(
                    flex: 41,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                      padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
                      width: totalWidth,
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.65)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: totalWidth,
                          child: TabBar(
                              isScrollable: true,
                              controller: _tabx.tabController,
                              indicatorColor: Colors.white,
                              indicator: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Colors.white)),
                              tabs: [
                                Tab(
                                  icon: Text(
                                    'All Events',
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.montserrat().fontFamily,
                                        fontSize: totalHeight * 0.018),
                                  ),
                                ),
                                Tab(
                                    icon: Text(
                                  'Music & Dance',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: totalHeight * 0.018,
                                      fontFamily:
                                          GoogleFonts.montserrat().fontFamily),
                                )),
                                Tab(
                                    icon: Text(
                                  'Gaming',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.montserrat().fontFamily,
                                      fontSize: totalHeight * 0.018),
                                )),
                                Tab(
                                    icon: Text(
                                  'Lits',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: totalHeight * 0.018,
                                      fontFamily:
                                          GoogleFonts.montserrat().fontFamily),
                                )),
                                Tab(
                                    icon: Text(
                                  'Media & Drama',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: totalHeight * 0.018,
                                      fontFamily:
                                          GoogleFonts.montserrat().fontFamily),
                                )),
                                Tab(
                                    icon: Text(
                                  'Sports',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: totalHeight * 0.018,
                                      fontFamily:
                                          GoogleFonts.montserrat().fontFamily),
                                )),
                                Tab(
                                    icon: Text(
                                  'Arts',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: totalHeight * 0.018,
                                      fontFamily:
                                          GoogleFonts.montserrat().fontFamily),
                                )),
                                Tab(
                                    icon: Text(
                                  'Miscellaneous',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: totalHeight * 0.018,
                                      fontFamily:
                                          GoogleFonts.montserrat().fontFamily),
                                )),
                              ]),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 620,
                    child: eventController.obx(
                      (eventList) => TabBarView(
                          controller: _tabx.tabController,
                          children: <Widget>[
                            ListView(
                              padding: EdgeInsets.zero,
                              children: eventList!.events!.map((event) {
                                return EventCard(event: event);
                              }).toList(),
                            ),
                            ListView(
                              padding: EdgeInsets.zero,
                              children: eventList.events!
                                  .where((e) => e.cluster == 'Music & Dance')
                                  .toList()
                                  .map((event) {
                                return EventCard(event: event);
                              }).toList(),
                            ),
                            ListView(
                              padding: EdgeInsets.zero,
                              children: eventList.events!
                                  .where((e) => e.cluster == 'Gaming')
                                  .toList()
                                  .map((event) {
                                return EventCard(event: event);
                              }).toList(),
                            ),
                            ListView(
                              padding: EdgeInsets.zero,
                              children: eventList.events!
                                  .where((e) => e.cluster == 'Lits')
                                  .toList()
                                  .map((event) {
                                return EventCard(event: event);
                              }).toList(),
                            ),
                            ListView(
                              padding: EdgeInsets.zero,
                              children: eventList.events!
                                  .where((e) => e.cluster == 'Media & Drama')
                                  .toList()
                                  .map((event) {
                                return EventCard(event: event);
                              }).toList(),
                            ),
                            ListView(
                              padding: EdgeInsets.zero,
                              children: eventList.events!
                                  .where((e) => e.cluster == 'Sports')
                                  .toList()
                                  .map((event) {
                                return EventCard(event: event);
                              }).toList(),
                            ),
                            ListView(
                              padding: EdgeInsets.zero,
                              children: eventList.events!
                                  .where((e) => e.cluster == 'Arts')
                                  .toList()
                                  .map((event) {
                                return EventCard(event: event);
                              }).toList(),
                            ),
                            ListView(
                              padding: EdgeInsets.zero,
                              children: eventList.events!
                                  .where((e) => e.cluster == 'Miscellaneous')
                                  .toList()
                                  .map((event) {
                                return EventCard(event: event);
                              }).toList(),
                            ),
                          ]),
                    ),
                  )
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}

class MyTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 8);
    super.onInit();
  }
}
