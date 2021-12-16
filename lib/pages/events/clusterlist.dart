import 'package:aaveg_app/models/events_response.dart';
import 'package:aaveg_app/pages/events/eventslist.dart';
import 'package:aaveg_app/utils/clan_utils.dart';
import 'package:flutter/material.dart';

class ClusterList extends StatelessWidget {
  final Map<String, List<Event>> clusters;

  const ClusterList({Key key, this.clusters}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var icons = Utils().clusterIcons();
    return ListView.builder(
        itemCount: clusters.keys.length,
        itemBuilder: (context, index) =>
            Wrap(alignment: WrapAlignment.center, children: [
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  height: 320,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Container(
                      width: MediaQuery.of(context).size.height * 0.5,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EventsList(
                                        list: clusters.values.elementAt(index),
                                        cluster:
                                            clusters.keys.elementAt(index)),
                                    maintainState: true));
                          },
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 0.37),
                                  borderRadius: BorderRadius.circular(16.0)),
                              color: Colors.black.withAlpha(1320),
                              child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flexible(
                                            flex: 2,
                                            child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.6,
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Image.asset(
                                                  icons[clusters.keys
                                                      .elementAt(index)],
                                                ))),
                                        Flexible(
                                            flex: 1,
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Text(
                                                  clusters.keys.elementAt(
                                                              index) ==
                                                          'Media'
                                                      ? 'Gaming'
                                                      : clusters.keys
                                                          .elementAt(index),
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      letterSpacing: 1.3,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      color: Colors.white,
                                                      fontSize: 18),
                                                )))
                                      ]))))))
            ]));
  }
}
