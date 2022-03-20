import 'package:aaveg_app/models/events_response.dart';
import 'package:aaveg_app/screens/background.dart';
import 'package:aaveg_app/utils/clan_utils.dart';
import 'package:flutter/material.dart';

class EventDetails extends StatelessWidget {
  final Event event;

  const EventDetails({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var list = [
      {'rank': 'Rank', 'points': 'Points'},
      {'rank': '1', 'points': event.points![0].toString()},
      {'rank': '2', 'points': event.points![1].toString()},
      {'rank': '3', 'points': event.points![2].toString()},
    ];
    var fab = [
      {
        'name': 'Rule\nBook',
        'link': event.rules.replaceAll(' ', ''),
        'tag': 'rules',
        'icon': Icons.rule
      },
      {
        'name': 'Register\nFor Event',
        'link': event.formLink.replaceAll(' ', ''),
        'tag': 'forms',
        'icon': Icons.app_registration
      },
      {
        'name': 'Watch\nEvent',
        'link': event.eventLink.replaceAll(' ', ''),
        'tag': 'event',
        'icon': Icons.tv
      },
    ];
    List<Map<String, Object>> getFab() {
      for (int i = 0; i < fab.length; i++) {
        if (fab[i]['link'] == null || fab[i]['link'] == '') fab.removeAt(i);
      }
      return fab;
    }

    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            body: CustomScrollView(slivers: [
              SliverAppBar(
                expandedHeight: size.height * 0.3,
                pinned: true,
                iconTheme: const IconThemeData(
                  color: Colors.white, //change your color here
                ),
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    event.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey.shade300,
                        shadows: const <Shadow>[
                          Shadow(
                            offset: Offset(2.4, 2.4),
                            blurRadius: 0,
                            color: Colors.black45,
                          ),
                        ],
                        letterSpacing: 1.4,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                  background: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Image.network(
                        event.imageLink,
                        fit: BoxFit.contain,
                        frameBuilder:
                            (context, child, frame, wasSynchronouslyLoaded) {
                          if (frame != null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Theme.of(context).primaryColor),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                                Utils().clusterIcons()[event.cluster[0].name]!),
                      )),
                ),
                backgroundColor: Colors.black,
              ),
              SliverToBoxAdapter(
                  child: Stack(children: [
                SizedBox(
                    height: size.height * 1.5,
                    width: size.width,
                    child: const Background()),
                SizedBox(
                    height: size.height * 1.5,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Divider(height: 0.9, color: Colors.grey.shade700),
                          const SizedBox(height: 8),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                    child: Column(
                                  children: [
                                    Image.asset(
                                      Utils().getCup(event.cup[0].name)
                                          as String,
                                      height: size.height * 0.05,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      event.cup[0].name,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    )
                                  ],
                                )),
                                Expanded(
                                    child: Column(
                                  children: [
                                    Image.asset(
                                      Utils().clusterIcons()[
                                          event.cluster[0].name]!,
                                      height: size.height * 0.05,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      event.cluster[0].name == 'Media'
                                          ? 'Gaming'
                                          : event.cluster[0].name,
                                      textAlign: TextAlign.center,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    )
                                  ],
                                )),
                              ]),
                          const SizedBox(height: 8),
                          Divider(height: 0.9, color: Colors.grey.shade700),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Column(
                                children: [
                                  const Icon(Icons.calendar_today_rounded,
                                      color: Colors.white),
                                  const SizedBox(height: 10),
                                  Text(
                                    event.date,
                                    style: const TextStyle(color: Colors.white),
                                  )
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                children: [
                                  const Icon(Icons.watch_later,
                                      color: Colors.white),
                                  const SizedBox(height: 10),
                                  Text(
                                      event.startTime.toString() +
                                          '-' +
                                          event.endTime.toString(),
                                      style:
                                          const TextStyle(color: Colors.white)),
                                ],
                              )),
                            ],
                          ),
                          Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(32),
                              child: Table(
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  border: TableBorder.all(
                                      width: 1.6, color: Colors.grey.shade700),
                                  children: list
                                      .map((e) => TableRow(children: [
                                            Padding(
                                                padding:
                                                    const EdgeInsets.all(16),
                                                child: Text(
                                                  e['rank']!,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                )),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.all(16),
                                                child: Text(e['points']!,
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        color: Colors.white)))
                                          ]))
                                      .toList())),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: getFab()
                                  .map((e) => Column(children: [
                                        FloatingActionButton(
                                          backgroundColor:
                                              Theme.of(context).primaryColor,
                                          onPressed: () {
                                            print(e['link']);
                                            Utils().launchURL(
                                                e['link'] as String, context);
                                          },
                                          heroTag: e['tag'],
                                          child: Icon(e['icon'] as IconData),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Text(e['name'] as String,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ))
                                      ]))
                                  .toList()),
                          Container(
                              margin: const EdgeInsets.fromLTRB(32, 64, 8, 8),
                              alignment: Alignment.topLeft,
                              child: Text('Description: \n' + event.description,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      height: 1.56,
                                      letterSpacing: 1.125))),
                        ]))
              ]))
            ])));
  }
}
