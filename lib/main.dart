import 'package:aaveg_app/pages/homepage.dart';
import 'package:aaveg_app/pages/loginpage.dart';
import 'package:aaveg_app/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aaveg_app/pages/splashpage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PushNotifcation? firebase;

  handleAsync() async {
    await firebase!.initialize(context);

    String? token = await firebase!.getToken();
    await firebase!.subscribeToTopic('aaveg');
    print('Firebase token : $token');
  }

  @override
  void initState() {
    super.initState();
    firebase = PushNotifcation();
    handleAsync();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Aaveg',
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashPage(),
          '/login': (context) => LoginPage(),
          '/home': (context) => HomePage()
        },
      );
}
