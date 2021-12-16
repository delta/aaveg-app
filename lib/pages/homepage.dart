import 'package:aaveg_app/pages/about/about.dart';
import 'package:aaveg_app/pages/events/events.dart';
import 'package:aaveg_app/pages/game/game.dart';
import 'package:aaveg_app/pages/home/home.dart';
import 'package:aaveg_app/pages/scoreboard/scoreboard.dart';
import 'package:aaveg_app/screens/background.dart';
import 'package:aaveg_app/services/cache_manager.dart';
import 'package:aaveg_app/utils/clan_utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<HomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  Future<String> _clan;
  bool isOffline = false;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _clan = CacheManager().getClan();
    super.initState();
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.animateToPage(selectedIndex,
        duration: Duration(milliseconds: 250), curve: Curves.decelerate);
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<String>(
      future: _clan,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(primaryColor: Utils().getColors(snapshot.data)),
              home: Scaffold(
                  appBar: AppBar(
                      title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            InkWell(
                                onLongPress: () => Utils()
                                    .launchURL('https://aaveg.in/21/', context),
                                child: Image.asset(
                                  'assets/images/aaveg.png',
                                  fit: BoxFit.cover,
                                  height: 35.0,
                                )),
                          ]),
                      bottom: isOffline
                          ? AppBar(
                              elevation: 24,
                              toolbarHeight: 16,
                              title: Container(
                                  margin: EdgeInsets.all(8),
                                  child: Text(
                                    'You\'re Offline,Turn On Your Internet',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.015),
                                  )),
                            )
                          : null,
                      backgroundColor: Colors.black,
                      actions: <Widget>[
                        InkWell(
                            onTap: () {
                              CacheManager().removeCache().whenComplete(() => {
                                    Navigator.of(context)
                                        .popAndPushNamed('/splash')
                                  });
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 24.0),
                              child: Icon(
                                Icons.logout,
                                color: Colors.redAccent[400],
                                size: 26.0,
                                semanticLabel: 'Logout',
                              ),
                            )),
                      ]),
                  body: Builder(
                      builder: (context) => PageView(
                            controller: _pageController,
                            children: const [
                              Home(),
                              Events(),
                              Scores(),
                              Games(),
                              About()
                            ],
                            onPageChanged: _onPageChanged,
                            physics: NeverScrollableScrollPhysics(),
                          )),
                  bottomNavigationBar: Builder(
                      builder: (context) => Container(
                            decoration: BoxDecoration(color: Colors.black),
                            child: BottomNavigationBar(
                              type: BottomNavigationBarType.fixed,
                              currentIndex: _selectedIndex,
                              showUnselectedLabels: false,
                              selectedItemColor: Theme.of(context).primaryColor,
                              unselectedItemColor: Colors.white70,
                              backgroundColor: Colors.black,
                              onTap: _onItemTapped,
                              items: [
                                BottomNavigationBarItem(
                                    icon: Icon(
                                      Icons.home,
                                    ),
                                    label: 'Home'),
                                BottomNavigationBarItem(
                                    icon: Icon(
                                      Icons.event,
                                    ),
                                    label: 'Events'),
                                BottomNavigationBarItem(
                                    icon: Icon(
                                      Icons.leaderboard,
                                    ),
                                    label: 'Scores'),
                                BottomNavigationBarItem(
                                    icon: Icon(
                                      Icons.games,
                                    ),
                                    label: 'Games'),
                                BottomNavigationBarItem(
                                    icon: Image.asset(
                                      'assets/images/aavegwhite.png',
                                      height: 20,
                                      color: _selectedIndex == 4
                                          ? Theme.of(context).primaryColor
                                          : Colors.white,
                                    ),
                                    label: 'About'),
                              ],
                            ),
                          ))));
        } else {
          return Background();
        }
      });
}
