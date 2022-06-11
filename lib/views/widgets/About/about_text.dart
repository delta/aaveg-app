import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutTextWidget extends StatefulWidget {
  const AboutTextWidget({Key? key}) : super(key: key);

  @override
  _AboutTextWidgetState createState() => _AboutTextWidgetState();
}

class _AboutTextWidgetState extends State<AboutTextWidget> {
  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;
    double totalWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: new EdgeInsets.all(20),
      padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
      height: totalHeight * 0.34,
      width: totalWidth * 0.918,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.65),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: SingleChildScrollView(
        child: Text(
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical here are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1',
          style: TextStyle(
              fontFamily: GoogleFonts.montserrat().fontFamily,
              fontSize: totalHeight * 0.018),
        ),
      )),
    );
  }
}
