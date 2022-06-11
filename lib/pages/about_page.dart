import 'package:aaveg_app/controllers/about_page_controller.dart';
import 'package:aaveg_app/controllers/nav_bar_controller.dart';
import 'package:aaveg_app/models/cup_modal.dart';
import 'package:aaveg_app/views/widgets/About/about_text.dart';
import 'package:aaveg_app/views/widgets/About/cup_widget.dart';
import 'package:aaveg_app/views/widgets/NavBar/nav_icon_widget.dart';
import 'package:aaveg_app/views/widgets/NavBar/navbar_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _SampleState();
}

final NavBarController navBarController = Get.find<NavBarController>();
GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _SampleState extends State<AboutPage> with TickerProviderStateMixin {
  // finds your controller and uses it
  final sampleController = Get.find<AboutPageController>();
  List<Cup> cuplist = [
    Cup(
        imageasset: 'assets/images/Aaveg Glyph - White 1.png',
        desc: 'This text is to describe the cup'),
    Cup(
        imageasset: 'assets/images/Aaveg Glyph - White 1.png',
        desc: 'This text is to describe the cup'),
    Cup(
        imageasset: 'assets/images/Aaveg Glyph - White 1.png',
        desc: 'This text is to describe the cup'),
    Cup(
        imageasset: 'assets/images/Aaveg Glyph - White 1.png',
        desc: 'This text is to describe the cup'),
    Cup(
        imageasset: 'assets/images/Aaveg Glyph - White 1.png',
        desc: 'This text is to describe the cup'),
    Cup(
        imageasset: 'assets/images/Aaveg Glyph - White 1.png',
        desc: 'This text is to describe the cup'),
    Cup(
        imageasset: 'assets/images/Aaveg Glyph - White 1.png',
        desc: 'This text is to describe the cup'),
  ];

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
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/teams_bg.png'),
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.darken),
          )),
          child: Column(children: [
            SizedBox(
              child: Align(
                alignment: Alignment.centerLeft,
                child: NavIcon(
                  globalKey: _scaffoldKey,
                ),
              ),
              height: 80,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    SizedBox(
                        height: 122,
                        child: Center(
                          child: AutoSizeText('ABOUT AAVEG',
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Anurati',
                                  fontSize: totalHeight * 0.039,
                                  letterSpacing: 10)),
                        )),
                    SizedBox(height: 316, child: AboutTextWidget()),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: 400, maxHeight: double.infinity),
                      child: SizedBox(
                        child: Container(
                          child: GridView(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 300,
                            ),
                            children: cuplist.map((cup) {
                              return CupWidget(cup: cup);
                            }).toList(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
