import 'package:aaveg_app/bindings/nav_bar_binding.dart';
import 'package:aaveg_app/providers/storage_service.dart';
import 'package:aaveg_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    await Get.putAsync(() => StorageService().initStorage());
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final storage = Get.find<StorageService>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        getPages: Routes().route,
        initialRoute: storage.getJwt() == null ? "/home" : "/dauth",
        initialBinding: NavBarBinding(),
      );
}
