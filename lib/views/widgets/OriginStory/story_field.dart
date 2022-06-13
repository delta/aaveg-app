import 'package:flutter/material.dart';

class StoryField extends StatefulWidget {
  final String desc;
  const StoryField({Key? key, required this.desc}) : super(key: key);

  @override
  State<StoryField> createState() => _StoryFieldState();
}

class _StoryFieldState extends State<StoryField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.fromLTRB(0, 20, 0, 50),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.65),
          borderRadius: BorderRadius.circular(10)),
      child: Center(child: Text(widget.desc)),
    );
  }
}
