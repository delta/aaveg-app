import 'package:aaveg_app/bindings/inital_binding.dart';
import 'package:aaveg_app/providers/storage_service.dart';
import 'package:aaveg_app/routes/routes.dart';
import 'package:aaveg_app/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

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
  final log = logger(MyApp);
  @override
  void initState() {
    super.initState();
    final token = storage.getJwt();
    if (storage.getJwt() != null) {
      log.i("Not null");
      if (JwtDecoder.isExpired(token!)) {
        log.e("Expired");
        storage.clearStorage();
      } else {
        log.d("Not expired");
      }
    }
  }

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        getPages: Routes().route,
        initialRoute: "/splash",
        initialBinding: InitialBinding(),
      );
}
