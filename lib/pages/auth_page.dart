import 'package:aaveg_app/controllers/auth_controller.dart';
import 'package:aaveg_app/views/widgets/dauth_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final dauthcontroller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: DauthWidget()),
    );
  }
}
