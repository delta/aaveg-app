// import 'dart:ui';
// import 'package:aaveg_app/api/apimanager.dart';
// import 'package:aaveg_app/models/sponsorResponse.dart';
// import 'package:flutter/material.dart';

// class Sponsors extends StatefulWidget {
//   @override
//   _SponsorsState createState() => _SponsorsState();
// }

// class _SponsorsState extends State<Sponsors> with TickerProviderStateMixin {
//   late Future<List<SponsorResponse>> _sponsors;
//   late AnimationController _animController;
//   @override
//   void initState() {
//     super.initState();
//     _animController = new AnimationController(
//       vsync: this,
//       duration: new Duration(seconds: 1),
//     );
//     _animController.repeat();
//     _sponsors = ApiManager().sponsors();
//   }

//   @override
//   void dispose() {
//     _animController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FutureBuilder<List<SponsorResponse>>(
//           future: _sponsors,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                   itemCount: snapshot.data!.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                         padding: EdgeInsets.all(16),
//                         margin: EdgeInsets.all(24),
//                         height: 240,
//                         decoration: BoxDecoration(
//                             color: Colors.grey.withAlpha(30),
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(10))),
//                         child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Flexible(
//                                   flex: 2,
//                                   child: Image.network(
//                                     snapshot.data[index].logo,
//                                     alignment: Alignment.center,
//                                   )),
//                               Flexible(
//                                   flex: 1,
//                                   child: Text(
//                                     snapshot.data[index].name,
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 18),
//                                   ))
//                             ]));
//                   });
//             } else
//               return Center(
//                 child: AnimatedBuilder(
//                   animation: _animController,
//                   child: new Container(
//                     height: 100.0,
//                     width: 100.0,
//                     child: new Image.asset("assets/images/aavegwhite.png"),
//                   ),
//                   builder: (BuildContext context, Widget _widget) {
//                     return new Transform.rotate(
//                       angle: _animController.value * 6.3,
//                       child: _widget,
//                     );
//                   },
//                 ),
//               );
//           }),
//     );
//   }
// }
