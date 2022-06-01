import 'package:aaveg_app/views/widgets/Mysquad/my_squad_details.dart';
import 'package:flutter/material.dart';

class MySquadWidget extends StatefulWidget {
  final width, height;
  final Widget child;
  MySquadWidget(
      {Key? key,
      required this.width,
      required this.height,
      required this.child})
      : super(key: key);

  @override
  State<MySquadWidget> createState() => _MySquadWidgetState();
}

class _MySquadWidgetState extends State<MySquadWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 10, right: 10),
      width: widget.width,
      height: widget.height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.black.withOpacity(0.65),
        borderRadius: BorderRadius.circular(5),
      ),
      child: widget.child,
    );
  }
}
