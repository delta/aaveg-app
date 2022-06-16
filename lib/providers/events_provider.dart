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
      return Future.error("Error ocuured in fetching scores. Try agin!!");
    }
  }

  Future<Event> getEventDetailsById(String id) async {
    final response = await post(
        "https://aaveg.in/22/api/event/:eventId/get/", {"eventId": "$id"});
    print(response.bodyString);
    if (response.statusCode == 200) {
      final event = eventModelFromJson(response.bodyString!);
      return event;
    } else {
      return Future.error("Error ocuured in fetching details. Try agin!!");
    }
  }
}
