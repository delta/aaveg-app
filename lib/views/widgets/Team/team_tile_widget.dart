import 'package:flutter/material.dart';

class TeamTileWidget extends StatefulWidget {
  final String name;
  final String imgUrl;
  TeamTileWidget({Key? key, required this.name, required this.imgUrl})
      : super(key: key);

  @override
  State<TeamTileWidget> createState() => _TeamTileWidgetState();
}

class _TeamTileWidgetState extends State<TeamTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      child: Container(
          child: ClipRect(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
            Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color(0xffD3D3D3),
                borderRadius: BorderRadius.circular(5),
              ),
              // child: ClipRRect(
              //   child: Image(
              //       image: AssetImage('assets/images/teams_bg.png'),
              //       fit: BoxFit.cover),
              //   borderRadius: BorderRadius.circular(5),
              // ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color(0xff313131),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                widget.name,
                textAlign: TextAlign.center,
              ),
            ),
          ]))),
    );
  }
}
