import 'package:flutter/material.dart';

class StoryField extends StatelessWidget {
  const StoryField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.fromLTRB(25, 2, 25, 77),
      decoration: BoxDecoration(
          color: Color(0x99514f4f), borderRadius: BorderRadius.circular(10)),
      child: Center(child: Text('Hiii')),
    );
  }
}
