import 'package:aaveg_app/controllers/nav_bar_controller.dart';
import 'package:aaveg_app/controllers/originstory_controller.dart';
import 'package:aaveg_app/views/widgets/NavBar/navbar_widget.dart';
import 'package:aaveg_app/views/widgets/OriginStory/story_field.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OriginStoryPage extends StatefulWidget {
  OriginStoryPage({Key? key}) : super(key: key);

  @override
  State<OriginStoryPage> createState() => _SampleState();
}

final NavBarController navBarController = Get.find<NavBarController>();
GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _SampleState extends State<OriginStoryPage>
    with TickerProviderStateMixin {
  // finds your controller and uses it
  final sampleController = Get.find<OriginStoryController>();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
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
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/sci-fi_city_bg.png'))),
        child: Column(
          children: [
            Expanded(child: SizedBox(), flex: 65),
            Expanded(
                flex: 92,
                child: Center(
                  child: AutoSizeText('ORIGIN STORY',
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Anurati',
                        letterSpacing: 6,
                        fontSize: 42,
                      )),
                )),
            Expanded(
              flex: 65,
              child: Container(
                decoration: BoxDecoration(color: Color.fromARGB(0, 97, 11, 11)),
                child:
                    TabBar(indicator: null, controller: _tabController, tabs: [
                  Tab(
                      icon: Image.asset(
                    'assets/images/Aaveg Glyph - White 1.png',
                    height: 60,
                    width: 60,
                  )),
                  // Image.asset(
                  //   'assets/images/chakraa logo 1.png',
                  //   scale: 0.1,
                  // ),
                  Tab(
                    icon: Image.asset(
                      'assets/images/chakraa logo 1.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  Tab(
                      icon: Image.asset(
                    'assets/images/paasha logo 1.png',
                  )),
                  Tab(
                    icon: Image.asset(
                      'assets/images/paras logo 1.png',
                      height: 60,
                      width: 60,
                    ),
                  ),
                  Tab(
                      icon: Image.asset(
                    'assets/images/saaranga logo 1.png',
                    height: 60,
                    width: 60,
                  )),
                  Tab(
                      icon: Image.asset(
                    'assets/images/vajr logo 1.png',
                    height: 60,
                    width: 60,
                  )),
                ]),
              ),
            ),
            Expanded(
              flex: 620,
              child: TabBarView(
                  controller: _tabController,
                  children: const <Widget>[
                    StoryField(),
                    StoryField(),
                    StoryField(),
                    StoryField(),
                    StoryField(),
                    StoryField(),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
