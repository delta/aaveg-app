import 'package:aaveg_app/models/score_response.dart';
import 'package:aaveg_app/pages/home/cupdetails.dart';
import 'package:aaveg_app/screens/background.dart';
import 'package:aaveg_app/screens/footer.dart';
import 'package:aaveg_app/utils/clan_utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String clan;
  final String clanLogo;
  final ScoresResponse res;
  final bool isOffline;

  const HomeScreen(
      {Key? key,
      required this.clan,
      required this.clanLogo,
      required this.res,
      required this.isOffline})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          elevation: 100,
          toolbarHeight: isOffline ? 16 : 0,
          centerTitle: true,
          title: Text(
            'You\'re Offline,Turn On your Internet',
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.height * 0.014),
          ),
        ),
        body: Stack(children: [
          Background(),
          Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Image.asset(clanLogo))),
                      Expanded(
                          flex: 1,
                          child: Container(
                              alignment: Alignment.center,
                              child: Text.rich(
                                TextSpan(children: <InlineSpan>[
                                  TextSpan(
                                      text: Utils()
                                          .getRank(clan, res.total!.toJson()),
                                      style: TextStyle(
                                          color: Colors.grey.shade300,
                                          shadows: <Shadow>[
                                            Shadow(
                                              offset: Offset(2.4, 2.4),
                                              blurRadius: 0,
                                              color: Colors.grey.shade800,
                                            ),
                                          ],
                                          letterSpacing: 1.2,
                                          fontWeight: FontWeight.bold)),
                                  WidgetSpan(
                                      child: Transform.translate(
                                    offset: const Offset(2.4, -70),
                                    child: Text(
                                      Utils().getSuperScript(int.parse(Utils()
                                          .getRank(clan, res.total!.toJson()))),
                                      style: TextStyle(
                                          fontSize: size.height * 0.045,
                                          color: Colors.grey.shade300,
                                          shadows: <Shadow>[
                                            Shadow(
                                              offset: Offset(2.4, 2.4),
                                              blurRadius: 0,
                                              color: Colors.grey.shade800,
                                            ),
                                          ],
                                          letterSpacing: 0.8,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                                ]),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.height * 0.13),
                              )))
                    ],
                  )),
              SizedBox(height: 24),
              Expanded(
                  flex: 2,
                  child: Container(
                      alignment: Alignment.center,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: Utils()
                              .getCupList(clan, res)
                              .map((cups) => CupDetails(cups: cups))
                              .toList()))),
              Footer()
            ],
          )
        ]));
  }
}
