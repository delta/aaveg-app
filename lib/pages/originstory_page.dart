import 'package:aaveg_app/controllers/nav_bar_controller.dart';
import 'package:aaveg_app/controllers/originstory_controller.dart';
import 'package:aaveg_app/views/widgets/NavBar/nav_icon_widget.dart';
import 'package:aaveg_app/views/widgets/NavBar/navbar_widget.dart';
import 'package:aaveg_app/views/widgets/OriginStory/story_field.dart';
import 'package:card_swiper/card_swiper.dart';
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
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/sci-fi_city_bg.png'))),
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
              // Expanded(
              //   flex: 65,
              //   child: Container(
              //     decoration:
              //         BoxDecoration(color: Color.fromARGB(0, 97, 11, 11)),
              //     child: TabBar(
              //         indicator: null,
              //         controller: _tabController,
              //         tabs: [
              //           Tab(
              //               icon: Image.asset(
              //             'assets/images/Aaveg Glyph - White 1.png',
              //             height: 60,
              //             width: 60,
              //           )),
              //           // Image.asset(
              //           //   'assets/images/chakraa logo 1.png',
              //           //   scale: 0.1,
              //           // ),
              //           Tab(
              //             icon: Image.asset(
              //               'assets/images/chakraa logo 1.png',
              //               width: 150,
              //               height: 150,
              //             ),
              //           ),
              //           Tab(
              //               icon: Image.asset(
              //             'assets/images/paasha logo 1.png',
              //           )),
              //           Tab(
              //             icon: Image.asset(
              //               'assets/images/paras logo 1.png',
              //               height: 60,
              //               width: 60,
              //             ),
              //           ),
              //           Tab(
              //               icon: Image.asset(
              //             'assets/images/saaranga logo 1.png',
              //             height: 60,
              //             width: 60,
              //           )),
              //           Tab(
              //               icon: Image.asset(
              //             'assets/images/vajr logo 1.png',
              //             height: 60,
              //             width: 60,
              //           )),
              //         ]),
              //   ),
              // ),
              // Expanded(
              //   flex: 65,
              //   child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: 6,
              //       itemBuilder: ((context, index) => Container(
              //               child: Image.asset(
              //             assetList[index],
              //             height: MediaQuery.of(context).size.width / 6,
              //             width: MediaQuery.of(context).size.width / 6,
              //           )))),
              // ),
              Expanded(
                  flex: 65,
                  child: Row(
                    children: [
                      for (var logo in assetList)
                        Expanded(
                          flex: 1,
                          child: Container(
                              child: (Image.asset(
                            logo,
                            height: totalWidth / 6,
                            width: totalWidth / 6,
                          ))),
                        )
                    ],
                  )),
              Expanded(
                flex: 620,
                child: Swiper(
                  itemCount: 6,
                  itemBuilder: (context, index) => StoryField(
                    desc: descriptions[index],
                  ),
                  autoplay: true,
                  autoplayDelay: 5000,
                  control: new SwiperControl(
                    color: Colors.white,
                    iconPrevious: Icons.arrow_back_ios,
                    iconNext: Icons.arrow_forward_ios,
                  ),
                  pagination: SwiperPagination(
                      builder: new DotSwiperPaginationBuilder(
                          color: Colors.black.withOpacity(0.5),
                          size: 15,
                          activeColor: Colors.white)),
                ),
              )
              // child: TabBarView(
              //     controller: _tabController,
              //     children: const <Widget>[
              //       StoryField(),
              //       StoryField(),
              //       StoryField(),
              //       StoryField(),
              //       StoryField(),
              //       StoryField(),
              //     ]),
            ],
          ),
        ]),
      ),
    );
  }
}
