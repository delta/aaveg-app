import 'package:aaveg_app/providers/storage_service.dart';
import 'package:aaveg_app/views/widgets/dauth_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    final storage = Get.find<StorageService>();
    print("Home ${storage.getJwt()}");
    if (storage.getJwt() != null) {
      print("Success");
    }
    return Scaffold(
      body: Center(child: DauthWidget()),
    );
  }
}
