import 'package:aaveg_app/bindings/about_page_binding.dart';
import 'package:aaveg_app/bindings/auth_binding.dart';
import 'package:aaveg_app/bindings/calender_page_binding.dart';
import 'package:aaveg_app/bindings/events_page_binding.dart';
import 'package:aaveg_app/bindings/my_squad_binding.dart';
import 'package:aaveg_app/bindings/sample_bindings.dart';
import 'package:aaveg_app/bindings/score_binding.dart';
import 'package:aaveg_app/bindings/team_binding.dart';
import 'package:aaveg_app/pages/all_squad_page.dart';
import 'package:aaveg_app/pages/about_page.dart';
import 'package:aaveg_app/pages/auth_page.dart';
import 'package:aaveg_app/pages/calendar_page.dart';
import 'package:aaveg_app/pages/events_page.dart';
import 'package:aaveg_app/pages/sample.dart';
import 'package:aaveg_app/pages/scoreboard_page.dart';
import 'package:aaveg_app/pages/my_squad_page.dart';
import 'package:aaveg_app/pages/sponsor_page.dart';
import 'package:aaveg_app/pages/splashpage.dart';
import 'package:aaveg_app/pages/team_page.dart';
import 'package:get/get.dart';

// declare all ur routes here
class Routes {
  var route = [
    GetPage(name: "/sample", page: () => Sample(), binding: SampleBinding()),
    GetPage(name: "/home", page: () => AuthPage(), binding: AuthBinding()),
    // GetPage(name: "/dauth", page: () => AuthPage(), binding: AuthBinding()),
    GetPage(
        name: "/scoreboard",
        page: () => ScoreBoardPage(),
        binding: ScoreBinding()),
    GetPage(name: "/mysquad", page: () => MySquad(), binding: MySquadBinding()),
    GetPage(name: "/team", page: () => TeamPage(), binding: TeamBinding()),
    GetPage(name: "/allsquad", page: () => AllSquad()),
    // GetPage(
    //     name: "/originstory",
    //     page: () => OriginStoryPage(),
    //     binding: OriginStoryBinding()),
    GetPage(
        name: "/events",
        page: () => EventsPage(),
        binding: EventsPageBinding()),
    GetPage(
        name: "/about", page: () => AboutPage(), binding: AboutPageBinding()),
    GetPage(
        name: "/calendar",
        page: () => CalendarPage(),
        binding: CalendarPageBinding()),
    GetPage(name: "/sponsors", page: () => SponsorPage()),
    GetPage(name: "/splash", page: () => SplashScreen())
  ];
}
