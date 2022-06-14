import 'package:aaveg_app/controllers/nav_bar_controller.dart';
import 'package:aaveg_app/controllers/originstory_controller.dart';
import 'package:aaveg_app/views/widgets/NavBar/nav_icon_widget.dart';
import 'package:aaveg_app/views/widgets/NavBar/navbar_widget.dart';
import 'package:aaveg_app/views/widgets/OriginStory/story_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;
    double totalWidth = MediaQuery.of(context).size.width;
    TabController _tabBarController = TabController(length: 6, vsync: this);
    List<String> descriptions = [
      'Aaveg desc',
      'Chakra desc',
      'Paasha desc',
      'Paras desc',
      'Saaranga desc',
      'Vajr desc'
    ];
    List<String> assetList = [
      'assets/images/Aaveg Glyph - White 1.png',
      'assets/images/chakraa logo 1.png',
      'assets/images/paasha logo 1.png',
      'assets/images/paras logo 1.png',
      'assets/images/saaranga logo 1.png',
      'assets/images/vajr logo 1.png'
    ];

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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/mysquad_bg.png'),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.darken),
            ),
          ),
          child: Stack(children: [
            NavIcon(globalKey: _scaffoldKey),
            Column(
              children: [
                Expanded(child: Container(), flex: 65),
                Expanded(
                    flex: 92,
                    child: Center(
                      child: Text('ORIGIN STORY',
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Anurati',
                            letterSpacing: 6,
                            fontSize: totalHeight * 0.045,
                          )),
                    )),
                Expanded(
                    flex: 70,
                    child: TabBar(
                      controller: _tabBarController,
                      indicatorPadding: EdgeInsets.zero,
                      labelPadding: EdgeInsets.zero,
                      indicator: BoxDecoration(
                          border:
                              Border.all(color: Color(0xff708090), width: 2),
                          borderRadius: BorderRadius.circular(totalWidth / 12)),
                      tabs: [
                        for (var logo in assetList)
                          Container(
                              child: (Image.asset(
                            logo,
                            height: totalWidth / 6,
                            width: totalWidth / 6,
                          ))),
                      ],
                    )),
                Expanded(
                  flex: 620,
                  child: Row(children: [
                    SizedBox(
                        width: totalWidth * 0.1,
                        child: IconButton(
                            onPressed: () => {
                                  _tabBarController.index == 0
                                      ? _tabBarController.animateTo(5)
                                      : _tabBarController.animateTo(
                                          _tabBarController.index - 1)
                                },
                            icon: Image.asset('assets/images/left_arrow.png'))),
                    SizedBox(
                      width: totalWidth * 0.8,
                      child: TabBarView(
                        controller: _tabBarController,
                        children: [
                          for (var desc in descriptions) StoryField(desc: desc)
                        ],
                      ),
                    ),
                    SizedBox(
                        width: totalWidth * 0.1,
                        child: IconButton(
                            onPressed: () => {
                                  _tabBarController.index == 5
                                      ? _tabBarController.animateTo(0)
                                      : _tabBarController.animateTo(
                                          _tabBarController.index + 1)
                                },
                            icon:
                                Image.asset('assets/images/right_arrow.png'))),
                  ]),
                )
              ],
            ),
          ]),
        ));
  }
}
