import 'package:aaveg_app/api/apimanager.dart';
import 'package:aaveg_app/models/events_response.dart';
import 'package:aaveg_app/models/result_respone.dart';
import 'package:aaveg_app/pages/events/eventscreen.dart';
import 'package:aaveg_app/screens/error.dart';
import 'package:aaveg_app/screens/loading.dart';
import 'package:aaveg_app/services/cache_manager.dart';
import 'package:flutter/material.dart';

typedef BoolCallback = Function(bool b);

class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  Future<ResultResponse<EventsResponse, String>>? _events;
  EventsResponse? _cache;

  @override
  void initState() {
    super.initState();
    _events = ApiManager().events().whenComplete(() {
      CacheManager().getEvents().then((value) {
        if (mounted) {
          setState(() {
            _cache = value!;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body: FutureBuilder<ResultResponse<EventsResponse, String>>(
          future: _events,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.message == 'success') {
                var res = snapshot.data!.response as EventsResponse;
                return EventScreen(event: res, isOffline: false);
              } else if (snapshot.data!.message == 'Network Error') {
                if (_cache != null) {
                  return EventScreen(event: _cache!, isOffline: true);
                } else {
                  return const ErrorScreen();
                }
              }
              return const LoadingScreen();
            }
            return const LoadingScreen();
          }));
}
