import 'package:aaveg_app/controllers/nav_bar_controller.dart';
import 'package:aaveg_app/views/widgets/NavBar/nav_icon_widget.dart';
import 'package:aaveg_app/views/widgets/NavBar/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:card_swiper/card_swiper.dart';

class AllSquad extends StatelessWidget {
  const AllSquad({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "assets/images/characters/paasha.png",
      "assets/images/characters/chakraa.png",
      "assets/images/characters/paras.png",
      "assets/images/characters/saaranga.png",
      "assets/images/characters/vajr.png"
    ];
    GlobalKey<ScaffoldState> _allsquadkey = GlobalKey<ScaffoldState>();
    final NavBarController navBarController = Get.find<NavBarController>();
    return Scaffold(
        key: _allsquadkey,
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
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/mysquad_bg.png'),
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.darken),
                  ),
                ),
                child: Stack(children: [
                  NavIcon(globalKey: _allsquadkey),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 6),
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          "THE SQUADS",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 10,
                              fontFamily: 'Anurati'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(bottom: 5),
                          child: Swiper(
                            itemBuilder: (context, index) => Container(
                              alignment: Alignment.center,
                              child: Image.asset(
                                images[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                            itemCount: images.length,
                            autoplay: true,
                            autoplayDelay: 5000,
                            indicatorLayout: PageIndicatorLayout.COLOR,
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
                        ),
                      )
                    ],
                  )
                ]),
              )
            ],
          ),
        ));
  }
}
