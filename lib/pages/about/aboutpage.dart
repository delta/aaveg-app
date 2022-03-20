import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  final int page;
  final String image;
  final String description;
  const AboutPage(
      {Key? key,
      required this.page,
      required this.image,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
              flex: 1,
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Image.asset(
                    image,
                  ))),
          Flexible(
              flex: 2,
              child: Center(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                          child: Text(
                            description,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.visible,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.0,
                                height: 1.2),
                          ))))),
          Container(
              alignment: Alignment.bottomRight,
              child: (page != 5)
                  ? const Text(
                      'Swipe-> ',
                      style: TextStyle(color: Colors.white60),
                    )
                  : null)
        ],
      ));
}
