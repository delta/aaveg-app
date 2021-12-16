import 'package:aaveg_app/screens/background.dart';
import 'package:flutter/material.dart';

class Story extends StatelessWidget {
  final Function onBackPressed;
  const Story({Key key, this.onBackPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Ninja Run', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      body: Stack(children: [
        Background(),
        SingleChildScrollView(
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                              flex: 1,
                              child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(16, 8, 16, 16),
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                                text: 'Story\n\n\n',
                                                style: TextStyle(
                                                    fontSize: 30.0,
                                                    color: Colors.white)),
                                            TextSpan(
                                                text:
                                                    'During the quest for the crown, your arch enemy, Xuan Zing, has infected the town with a Zombie Virus(ZO-VID-21). Help the Aaveg ninja to conquerer the evil kingdom of Xuan Zing.',
                                                style: TextStyle(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.002)),
                                          ],
                                        ),
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.visible,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.0,
                                            height: 1.2),
                                      )))),
                          Flexible(
                              flex: 1,
                              child: Center(
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              16, 8, 16, 16),
                                          child: Text.rich(
                                            TextSpan(children: const [
                                              TextSpan(
                                                  text: 'Instructions\n\n\n',
                                                  style: TextStyle(
                                                      fontSize: 30.0,
                                                      color: Colors.white)),
                                              TextSpan(
                                                  text:
                                                      '\u2022Use JoyStick at Left to Jump and Slide.\n\n'),
                                              TextSpan(
                                                  text:
                                                      '\u2022Use Attack Button at Right to Kill the enemies.\n\n'),
                                              TextSpan(
                                                  text:
                                                      '\u2022Attack can be only be executed when stamina is above 25%.\n\n'),
                                              TextSpan(
                                                  text:
                                                      '\u2022Attack Can\'t be performed while jumping/sliding.\n\n'),
                                            ]),
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.visible,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 1.0,
                                                height: 1.2),
                                          ))))),
                        ]))))
      ]));
}
