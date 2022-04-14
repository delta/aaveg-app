import 'package:aaveg_app/views/widgets/dauth_widget.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    var _args = ModalRoute.of(context)!.settings.arguments as String?;
    print("In AuthPage: $_args");
    return Scaffold(
      body: Center(child: DauthWidget()),
    );
  }
}
