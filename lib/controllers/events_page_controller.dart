import 'package:aaveg_app/providers/events_provider.dart';
import 'package:aaveg_app/providers/storage_service.dart';
import 'package:get/get.dart';

import '../models/event_modal.dart';

class EventsPageController extends GetxController with StateMixin<EventsModel> {
  final storage = Get.find<StorageService>();
  EventsProvider eventsProvider = EventsProvider();
  String eventId = '';
  @override
  void onInit() {
    getEvents();
    super.onInit();
  }

  @override
  void onReady() {
    getEvents();

    super.onReady();
  }

  Future<void> getEvents() async {
    eventsProvider.getEventsResponse().then(
        (response) => change(response, status: RxStatus.success()),
        onError: (error) =>
            change(null, status: RxStatus.error(error.toString())));
  }
}
