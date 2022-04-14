import 'package:aaveg_app/views/themes/colors.dart';
import 'package:aaveg_app/views/widgets/dauth_web_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DauthWidget extends StatelessWidget {
  const DauthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 400,
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Column(children: [
        Image.asset(
          'assets/images/dauth-full.png',
          height: 250,
          width: 250,
        ),
        TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                flex: 4,
                child: Text(
                  'Login with',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
              Flexible(
                flex: 9,
                child: Image.asset(
                  'assets/images/dauth.png',
                  height: 37,
                  width: 37,
                ),
              ),
            ],
          ),
          style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(16),
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Colours().primarydarkcolor),
              shadowColor: MaterialStateProperty.all<Color>(
                  const Colours().primarydarkcolor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.black)))),
          onPressed: () => {Get.to(WebViewWidget())},
        ),
      ]),
    );
  }
}
