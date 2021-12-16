import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(children: [
        Container(
            decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/homebg.webp'),
            fit: BoxFit.fill,
          ),
        )),
        Container(
            decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
        ))
      ]);
}
