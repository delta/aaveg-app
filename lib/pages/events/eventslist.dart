import 'package:aaveg_app/models/events_response.dart';
import 'package:aaveg_app/pages/events/eventsdetails.dart';
import 'package:aaveg_app/screens/background.dart';
import 'package:aaveg_app/utils/clan_utils.dart';
import 'package:flutter/material.dart';

class EventsList extends StatelessWidget {
  final List<Event> list;
  final String cluster;
  const EventsList({Key? key, required this.list, required this.cluster})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: InkWell(
            child: Text(cluster, style: TextStyle(color: Colors.white))),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Stack(children: [
        Background(),
        ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) =>
                Wrap(alignment: WrapAlignment.center, children: [
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      height: 320,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Container(
                          width: MediaQuery.of(context).size.height * 0.5,
                          padding: EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EventDetails(event: list[index])));
                              },
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 0.37),
                                      borderRadius:
                                          BorderRadius.circular(16.0)),
                                  color: Colors.black.withAlpha(1320),
                                  child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Flexible(
                                                flex: 2,
                                                child: Container(
                                                    padding: EdgeInsets.all(8),
                                                    child: Image.network(
                                                      list[index].imageLink,
                                                      frameBuilder: (context,
                                                          child,
                                                          frame,
                                                          wasSynchronouslyLoaded) {
                                                        if (frame != null) {
                                                          return child;
                                                        }
                                                        return Center(
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(Theme.of(
                                                                        context)
                                                                    .primaryColor),
                                                          ),
                                                        );
                                                      },
                                                      errorBuilder: (context,
                                                          error, stackTrace) {
                                                        print(list[index]
                                                            .cluster[0]
                                                            .name);
                                                        return Image.asset(Utils()
                                                                .clusterIcons()[
                                                            list[index]
                                                                .cluster[0]
                                                                .name]!);
                                                      },
                                                    ))),
                                            Flexible(
                                                flex: 1,
                                                child: Padding(
                                                    padding: EdgeInsets.all(8),
                                                    child: Text(
                                                      list[index].name,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          letterSpacing: 1.3,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          color: Colors.white,
                                                          fontSize: 18),
                                                    )))
                                          ]))))))
                ]))
      ]));
}
