import 'package:aaveg_app/models/events_response.dart';
import 'package:aaveg_app/pages/events/clusterlist.dart';
import 'package:aaveg_app/screens/background.dart';
import 'package:aaveg_app/utils/clan_utils.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  final EventsResponse event;
  final bool isOffline;

  const EventScreen({Key? key, required this.event, required this.isOffline})
      : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
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
        const Background(),
        ClusterList(clusters: Utils().sortCluster(event.eventsByCluster!)!)
      ]));
}
