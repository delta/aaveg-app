import 'package:aaveg_app/controllers/nav_bar_controller.dart';
import 'package:aaveg_app/providers/storage_service.dart';
import 'package:aaveg_app/views/widgets/NavBar/nav_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NavbarWdiget extends StatefulWidget {
  NavbarWdiget({Key? key}) : super(key: key);

  @override
  State<NavbarWdiget> createState() => _NavbarWdigetState();
}

class _NavbarWdigetState extends State<NavbarWdiget> {
  final storage = Get.find<StorageService>();
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(minWidth: 50),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Stack(
              children: [
                Visibility(
                  child: Container(
                    margin: EdgeInsets.only(top: 20, left: 5),
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        size: 35,
                        color: Colors.white.withOpacity(0.75),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  visible: true,
                ),
                Container(
                    height: 118,
                    margin: EdgeInsets.only(top: 30),
                    alignment: Alignment.center,
                    child: Image(
                      image: AssetImage('assets/images/aaveg-logo.png'),
                    )),
              ],
            ),
            NavDivider(),
            NavBarListWidget(
              items: [
                NavItem(pageName: "Home", route: "/home"),
                NavItem(pageName: "Calendar", route: "/sample")
              ],
            ),
            NavDivider(),
            NavBarListWidget(
              items: [
                NavItem(pageName: "ScoreBoard", route: "/scoreboard"),
                NavItem(pageName: "Events", route: "/events"),
                NavItem(pageName: "All Squad", route: "/allsquad"),
                NavItem(pageName: "My Squad", route: "/mysquad"),
                NavItem(pageName: "Origin Story", route: "/originstory"),
              ],
            ),
            NavDivider(),
            NavBarListWidget(
              items: [
                NavItem(pageName: "About Aaveg", route: "/about"),
                NavItem(pageName: "Team", route: "/team"),
                NavItem(pageName: "Sponsors", route: "/sponsors"),
              ],
            ),
            NavDivider(),
            Container(
              child: Row(children: [
                Container(
                  width: 70,
                  height: 70,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 10, top: 10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.75),
                      width: 1,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, top: 3),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Text(
                          storage.getName() ?? "Name",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: GoogleFonts.montserrat().fontFamily),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(
                          storage.getSquad() ?? "squad",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white.withOpacity(0.75),
                              fontWeight: FontWeight.w400,
                              fontFamily: GoogleFonts.montserrat().fontFamily),
                        ),
                      )
                    ],
                  ),
                )
              ]),
            )
          ],
        )));
  }
}

class NavDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Divider(
        color: Colors.white.withOpacity(0.2),
        thickness: 2,
      ),
    );
  }
}

class NavBarListWidget extends StatelessWidget {
  final List<NavItem> items;
  final NavBarController navBarController = Get.find<NavBarController>();
  NavBarListWidget({Key? key, required this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Container(
        margin: EdgeInsets.only(top: 16),
        width: 100,
        child: Align(
          alignment: Alignment.center,
          child: GestureDetector(
            child: Text(
              items[index].pageName,
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: GoogleFonts.montserrat().fontFamily),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Get.back();
              Get.toNamed(items[index].route);
              navBarController.nextPageVisiblity();
            },
          ),
        ),
      ),
      itemCount: items.length,
      padding: EdgeInsets.all(0),
    );
  }
}
