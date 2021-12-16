import 'package:aaveg_app/utils/clan_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FooterState();
}

class FooterState extends State<Footer> {
  int click = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: 35,
        alignment: Alignment.bottomCenter,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        padding: const EdgeInsets.all(8),
        child: Text.rich(TextSpan(
          text: 'Made with ',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: size.height * 0.013),
          children: <InlineSpan>[
            TextSpan(
              text: '♥️ ',
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * 0.0139),
              recognizer: TapGestureRecognizer()
                ..onTap = () => click == 35
                    ? Utils().launchURL(
                        'https://aaveg.in/21/api/static/legends.jpeg', context)
                    : setState(() {
                        click += 1;
                      }),
            ),
            TextSpan(
              text: 'by ',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: size.height * 0.013),
            ),
            TextSpan(
              text: 'DeltaForce',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * 0.0135),
              recognizer: TapGestureRecognizer()
                ..onTap =
                    () => Utils().launchURL('https://delta.nitt.edu/', context),
            ),
            TextSpan(
              text: ' & ',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: size.height * 0.013),
            ),
            TextSpan(
              text: 'AavegDesCon',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * 0.0135),
              recognizer: TapGestureRecognizer()
                ..onTap = () => Utils()
                    .launchURL('https://www.behance.net/aavegnitt', context),
            ),
          ],
        )));
  }
}
