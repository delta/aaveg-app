import 'package:aaveg_app/controllers/about_page_controller.dart';
import 'package:aaveg_app/controllers/nav_bar_controller.dart';
import 'package:aaveg_app/views/widgets/About/about_text.dart';
import 'package:aaveg_app/views/widgets/About/cup_widget.dart';
import 'package:aaveg_app/views/widgets/NavBar/nav_icon_widget.dart';
import 'package:aaveg_app/views/widgets/NavBar/navbar_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final NavBarController navBarController = Get.find<NavBarController>();
final sampleController = Get.find<AboutPageController>();
List<int> cuplist = [1, 2, 3, 4, 5];

class AboutPage extends GetView<AboutPageController> {
  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: _scaffoldKey,
        onDrawerChanged: (isOpen) {
          navBarController.setVisiblity(!isOpen);
        },
        drawer: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.black.withOpacity(0.65),
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
                Colors.black.withOpacity(0.25), BlendMode.darken),
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
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    SizedBox(
                        height: 316,
                        child: controller.obx((state) => AboutTextWidget(
                              text: state?.aboutUsContent?.aboutAaveg
                                      .toString() ??
                                  "About Aaveg",
                            ))),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: 400, maxHeight: double.infinity),
                      child: SizedBox(
                        child: Container(
                            child: controller.obx(
                          (state) => GridView(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 250,
                            ),
                            children: [
                              CupWidget(cup: state!.aboutUsContent!.cup1!),
                              CupWidget(cup: state.aboutUsContent!.cup2!),
                              CupWidget(cup: state.aboutUsContent!.cup3!),
                              CupWidget(cup: state.aboutUsContent!.cup3!),
                            ],
                          ),
                        )),
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
