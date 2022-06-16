import 'package:aaveg_app/controllers/events_page_controller.dart';
import 'package:aaveg_app/controllers/nav_bar_controller.dart';
import 'package:aaveg_app/models/event_modal.dart';
import 'package:aaveg_app/views/widgets/Events/event_card.dart';
import 'package:aaveg_app/views/widgets/NavBar/nav_icon_widget.dart';
import 'package:aaveg_app/views/widgets/NavBar/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EventsPage extends StatefulWidget {
  EventsPage({Key? key}) : super(key: key);

  @override
  State<EventsPage> createState() => _SampleState();
}

final NavBarController navBarController = Get.find<NavBarController>();

class _SampleState extends State<EventsPage> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final sampleController = Get.find<EventsPageController>();
  late TabController _tabController;
  List<Event> eventlist = [
    Event(
        name: 'Event Name',
        clusterName: 'Name of cluster',
        type: 'cultural',
        desc: 'event description (from rulebook)',
        cupName: 'Cup name',
        r1Date: 'Date(round1)',
        r2Date: 'Date(round2)',
        r1Time: 'time r1',
        r2Time: 'time r2'),
    Event(
        name: 'Event Name',
        clusterName: 'Name of cluster',
        type: 'cultural',
        desc: 'event description (from rulebook)',
        cupName: 'Cup name',
        r1Date: 'Date(round1)',
        r2Date: 'Date(round2)',
        r1Time: 'time r1',
        r2Time: 'time r2'),
    Event(
        name: 'Event Name',
        clusterName: 'Name of cluster',
        type: 'cultural',
        desc: 'event description (from rulebook)',
        cupName: 'Cup name',
        r1Date: 'Date(round1)',
        r2Date: 'Date(round2)',
        r1Time: 'time r1',
        r2Time: 'time r2'),
    Event(
        name: 'Event Name',
        clusterName: 'Name of cluster',
        type: 'cultural',
        desc: 'event description (from rulebook)',
        cupName: 'Cup name',
        r1Date: 'Date(round1)',
        r2Date: 'Date(round2)',
        r1Time: 'time r1',
        r2Time: 'time r2'),
    Event(
        name: 'Event Name',
        clusterName: 'Name of cluster',
        type: 'cultural',
        desc: 'event description (from rulebook)',
        cupName: 'Cup name',
        r1Date: 'Date(round1)',
        r2Date: 'Date(round2)',
        r1Time: 'time r1',
        r2Time: 'time r2'),
    Event(
        name: 'Event Name',
        clusterName: 'Name of cluster',
        type: 'cultural',
        desc: 'event description (from rulebook)',
        cupName: 'Cup name',
        r1Date: 'Date(round1)',
        r2Date: 'Date(round2)',
        r1Time: 'time r1',
        r2Time: 'time r2'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;

    double totalWidth = MediaQuery.of(context).size.width;
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
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.65)),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            width: totalWidth,
                            child: TabBar(
                                isScrollable: true,
                                controller: _tabController,
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
                                          fontFamily: GoogleFonts.montserrat()
                                              .fontFamily,
                                          fontSize: totalHeight * 0.018),
                                    ),
                                  ),
                                  Tab(
                                      icon: Text(
                                    'Cultural',
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: totalHeight * 0.018,
                                        fontFamily: GoogleFonts.montserrat()
                                            .fontFamily),
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
                                        fontFamily: GoogleFonts.montserrat()
                                            .fontFamily),
                                  )),
                                  Tab(
                                      icon: Text(
                                    'Misc',
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: totalHeight * 0.018,
                                        fontFamily: GoogleFonts.montserrat()
                                            .fontFamily),
                                  )),
                                ]),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 620,
                      child: TabBarView(
                          controller: _tabController,
                          children: <Widget>[
                            ListView(
                              padding: EdgeInsets.zero,
                              children: eventlist.map((event) {
                                return EventCard(event: event);
                              }).toList(),
                            ),
                            ListView(
                              padding: EdgeInsets.zero,
                              children: eventlist.map((event) {
                                return EventCard(event: event);
                              }).toList(),
                            ),
                            ListView(
                              padding: EdgeInsets.zero,
                              children: eventlist.map((event) {
                                return EventCard(event: event);
                              }).toList(),
                            ),
                            ListView(
                              padding: EdgeInsets.zero,
                              children: eventlist.map((event) {
                                return EventCard(event: event);
                              }).toList(),
                            ),
                            ListView(
                              padding: EdgeInsets.zero,
                              children: eventlist.map((event) {
                                return EventCard(event: event);
                              }).toList(),
                            ),
                          ]),
                    )
                  ],
                ),
              ]),
            )
          ],
        ));
  }
}
