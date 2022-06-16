import 'package:aaveg_app/models/eventDetail_modal.dart';
import 'package:aaveg_app/providers/events_provider.dart';
import 'package:aaveg_app/providers/storage_service.dart';
import 'package:get/get.dart';

class EventPopupController extends GetxController with StateMixin<EventDetail> {
  final storage = Get.find<StorageService>();
  EventsProvider eventsProvider = EventsProvider();
  String eventId = '';

  setEventId(String id) {
    eventId = id;
  }

  void getDetails(String id) {
    getEventDetailsById(id);
  }

  Future<void> getEventDetailsById(String id) async {
    eventsProvider.getEventDetailsById(id).then(
        (response) => change(response, status: RxStatus.success()),
        onError: (error) =>
            change(null, status: RxStatus.error(error.toString())));
  }
}
