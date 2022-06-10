import 'package:aaveg_app/controllers/events_page_controller.dart';
import 'package:aaveg_app/controllers/nav_bar_controller.dart';
import 'package:aaveg_app/models/event_modal.dart';
import 'package:aaveg_app/views/widgets/Events/event_card.dart';
import 'package:aaveg_app/views/widgets/NavBar/nav_icon_widget.dart';
import 'package:aaveg_app/views/widgets/NavBar/navbar_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EventsPage extends StatefulWidget {
  EventsPage({Key? key}) : super(key: key);

  @override
  State<EventsPage> createState() => _SampleState();
}

final NavBarController navBarController = Get.find<NavBarController>();
GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _SampleState extends State<EventsPage> with TickerProviderStateMixin {
  // finds your controller and uses it
  final sampleController = Get.find<EventsPageController>();
  late TabController _tabController;
  List<Event> eventlist = [
    Event(
        name: 'Drama',
        clusterName: 'Vaayu',
        type: 'cultural',
        desc: 'Drama for first years',
        cupName: 'dramacup',
        r1Date: '15 june',
        r2Date: '18 june'),
    Event(
        name: 'Drama',
        clusterName: 'Vaayu',
        type: 'cultural',
        desc: 'Drama for first years',
        cupName: 'dramacup',
        r1Date: '15 june',
        r2Date: '18 june'),
    Event(
        name: 'Drama',
        clusterName: 'Vaayu',
        type: 'cultural',
        desc: 'Drama for first years',
        cupName: 'dramacup',
        r1Date: '15 june',
        r2Date: '18 june'),
    Event(
        name: 'Drama',
        clusterName: 'Vaayu',
        type: 'cultural',
        desc: 'Drama for first years',
        cupName: 'dramacup',
        r1Date: '15 june',
        r2Date: '18 june'),
  ];
  Event testevent = Event(
      name: 'Drama',
      clusterName: 'Vaayu',
      type: 'cultural',
      desc: 'Drama for first years',
      cupName: 'dramacup',
      r1Date: '15 june',
      r2Date: '18 june');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;
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
                      image: AssetImage('assets/images/events_bg.png'))),
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
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.65)),
                        child: TabBar(
                            controller: _tabController,
                            indicatorColor: Colors.white,
                            indicator: BoxDecoration(
                                border: Border.all(
                                    width: 2.5,
                                    color: Color.fromARGB(255, 255, 255, 255))),
                            tabs: [
                              Tab(
                                icon: AutoSizeText(
                                  'All Events',
                                  maxLines: 1,
                                  minFontSize: 5,
                                  maxFontSize: 15,
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.montserrat().fontFamily),
                                ),
                              ),
                              Tab(
                                  icon: AutoSizeText(
                                'Cultural',
                                maxLines: 1,
                                minFontSize: 5,
                                maxFontSize: 15,
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.montserrat().fontFamily),
                              )),
                              Tab(
                                  icon: AutoSizeText(
                                'Gaming',
                                maxLines: 1,
                                minFontSize: 5,
                                maxFontSize: 15,
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.montserrat().fontFamily),
                              )),
                              Tab(
                                  icon: AutoSizeText(
                                'Lits',
                                maxLines: 1,
                                minFontSize: 5,
                                maxFontSize: 15,
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.montserrat().fontFamily),
                              )),
                              Tab(
                                  icon: AutoSizeText(
                                'Misc',
                                maxLines: 1,
                                minFontSize: 5,
                                maxFontSize: 15,
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.montserrat().fontFamily),
                              )),
                            ]),
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
