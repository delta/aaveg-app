import 'package:flutter/material.dart';

class MySquadImage extends StatefulWidget {
  final String squadName;
  MySquadImage({Key? key, required this.squadName}) : super(key: key);

  @override
  State<MySquadImage> createState() => _MySquadImageState();
}

class _MySquadImageState extends State<MySquadImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        "assets/images/characters/${widget.squadName}.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
