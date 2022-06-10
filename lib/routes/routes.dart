import 'package:aaveg_app/bindings/auth_binding.dart';
import 'package:aaveg_app/bindings/originstory_binding.dart';
import 'package:aaveg_app/bindings/sample_bindings.dart';
import 'package:aaveg_app/pages/all_squad_page.dart';
import 'package:aaveg_app/pages/auth_page.dart';
import 'package:aaveg_app/pages/home.dart';
import 'package:aaveg_app/pages/originstory_page.dart';
import 'package:aaveg_app/pages/sample.dart';
import 'package:aaveg_app/pages/scoreboard_page.dart';
import 'package:aaveg_app/pages/my_squad_page.dart';
import 'package:aaveg_app/pages/team_page.dart';
import 'package:get/get.dart';

// declare all ur routes here
class Routes {
  var route = [
    GetPage(name: "/sample", page: () => Sample(), binding: SampleBinding()),
    GetPage(name: "/home", page: () => Home()),
    GetPage(name: "/dauth", page: () => AuthPage(), binding: AuthBinding()),
    GetPage(name: "/scoreboard", page: () => ScoreBoardPage()),
    GetPage(name: "/mysquad", page: () => MySquad()),
    GetPage(name: "/team", page: () => TeamPage()),
    GetPage(name: "/allsquad", page: () => AllSquad()),
    GetPage(
        name: "/originstory",
        page: () => OriginStoryPage(),
        binding: OriginStoryBinding()),
  ];
}
