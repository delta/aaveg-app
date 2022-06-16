import 'package:aaveg_app/models/eventDetail_modal.dart';
import 'package:aaveg_app/models/event_modal.dart';

import 'package:get/get.dart';

class EventsProvider extends GetConnect {
  Future<EventsModel> getEventsResponse() async {
    // final storage = Get.find<StorageService>();
    final response =
        await post("https://aaveg.in/22/api/event/get/", {"cluster": "all"});
    if (response.statusCode == 200) {
      final events = eventsModelFromJson(response.bodyString!);
      return events;
    } else {
      print('2');
      return Future.error("Error ocuured in fetching scores. Try agin!!");
    }
  }

  Future<EventDetail> getEventDetailsById(String id) async {
    final response = await post(
        "https://aaveg.in/22/api/event/:eventId/get/", {"eventId": "$id"});

    if (response.statusCode == 200) {
      final event = eventDetailFromJson(response.bodyString!);
      return event;
    } else {
      return Future.error("Error ocuured in fetching details. Try agin!!");
    }
  }
}
