import 'package:aaveg_app/screens/background.dart';
import 'package:aaveg_app/utils/clan_utils.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Builder(builder: (cont) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Utils().snackResponse('Check your Internet connection', cont);
      });
      return Stack(children: [
        const Background(),
        Container(
          decoration: BoxDecoration(color: Colors.purple.withOpacity(0.111)),
        ),
        Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
                child: Column(children: [
              Expanded(
                  flex: 1,
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'OOPS,Looks like You\'re offline',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey.shade300,
                            shadows: <Shadow>[
                              Shadow(
                                offset: const Offset(2.4, 2.4),
                                blurRadius: 0,
                                color: Colors.grey.shade800,
                              ),
                            ],
                            letterSpacing: 1.2,
                            fontSize: size.height * 0.02,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ))),
              Expanded(
                flex: 2,
                child: Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.topCenter,
                    child: Image.asset('assets/images/errorchar.png')),
              )
            ])))
      ]);
    });
  }
}
