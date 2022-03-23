import 'dart:async';

import 'package:aaveg_app/api/apimanager.dart';
import 'package:aaveg_app/models/login_response.dart';
import 'package:aaveg_app/services/cache_manager.dart';
import 'package:aaveg_app/utils/clan_utils.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLoading = false;
  int click = 0;

  @override
  void initState() {
    super.initState();
  }

  void loader() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  String checkStrings(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      return 'Fill all Fields';
    } else if (!email.contains('@')) {
      return 'Enter correct WebmailId';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) => SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                      onTap: () => click == 15
                          ? Utils().launchURL(
                              'https://drive.google.com/file/d/1O4hqlqVxspNnHAoraJzGQ-UOFgwfqR9m/view?usp=sharing',
                              context)
                          : setState(() {
                              click = click + 1;
                            }),
                      child: Image.asset(
                        'assets/images/aaveg.png',
                        fit: BoxFit.cover,
                        height: 35.0,
                      )),
                ]),
            backgroundColor: Colors.black,
          ),
          body: Stack(children: [
            Container(
                decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/LoginPage.png'),
                fit: BoxFit.cover,
              ),
            )),
            Center(
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width > 600 ? 450 : null,
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black54.withOpacity(0.75)),
                    child: Form(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          'assets/images/aavegwhite.png',
                          height: MediaQuery.of(context).size.height / 7.5,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'LOGIN',
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              controller: _emailController,
                              cursorColor: Colors.purpleAccent,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.white),
                              validator: (input) => !input!.contains('@')
                                  ? 'EmailID required'
                                  : null,
                              decoration: InputDecoration(
                                  hintText: 'Webmail ID',
                                  hintStyle: TextStyle(color: Colors.white60),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide:
                                          BorderSide(color: Colors.white70)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide:
                                          BorderSide(color: Colors.purple)),
                                  suffixIcon: Icon(
                                    Icons.email,
                                    color: Colors.white,
                                  )),
                            )),
                        SizedBox(height: 8),
                        Container(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              controller: _passwordController,
                              cursorColor: Colors.purpleAccent,
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              validator: (input) =>
                                  input!.length != 9 ? 'Wrong Password' : null,
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: TextStyle(color: Colors.white60),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide:
                                          BorderSide(color: Colors.white70)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide:
                                          BorderSide(color: Colors.purple)),
                                  suffixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  )),
                            )),
                        SizedBox(height: 30),
                        Builder(
                            builder: (context) => ElevatedButton(
                                  child: isLoading
                                      ? Container(
                                          padding: EdgeInsets.all(4),
                                          child: CircularProgressIndicator(
                                              strokeWidth: 3,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Colors.white)))
                                      : Text('LOGIN'),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                        if (isLoading) {
                                          return Colors.transparent;
                                        }
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(0.5);
                                        } else if (states
                                            .contains(MaterialState.hovered)) {
                                          return Colors.lightGreen;
                                        }
                                        return Colors
                                            .green; // Use the component's default.
                                      },
                                    ),
                                  ),
                                  onPressed: () async {
                                    var check = checkStrings(
                                        _emailController.value.text,
                                        _passwordController.value.text);
                                    if (check == '') {
                                      loader();
                                      var res = await ApiManager().login(
                                          _emailController.value.text,
                                          _passwordController.value.text);
                                      loader();
                                      if (res.message == 'success') {
                                        Utils().snackResponse(
                                            (res.response as LoginResponse)
                                                .message,
                                            context);
                                        Timer(
                                            const Duration(milliseconds: 1500),
                                            () {
                                          var response =
                                              res.response as LoginResponse;

                                          CacheManager()
                                              .storeLogin(
                                                  response.rollnumber,
                                                  _passwordController
                                                      .value.text,
                                                  response.clan,
                                                  response.userId)
                                              .whenComplete(() => {
                                                    Navigator.of(context)
                                                        .popAndPushNamed(
                                                            '/home')
                                                  });
                                        });
                                      } else {
                                        Utils().snackResponse(
                                            res.message, context);
                                      }
                                    } else {
                                      Utils().snackResponse(check, context);
                                    }
                                    // ApiManager().authInfo();
                                  },
                                ))
                      ],
                    )),
                  ),
                ],
              )),
            ),
          ])));
}
