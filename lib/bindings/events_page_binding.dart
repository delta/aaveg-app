import 'package:aaveg_app/controllers/event_popup_controller.dart';
import 'package:aaveg_app/controllers/events_page_controller.dart';
import 'package:get/instance_manager.dart';

class EventsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(EventsPageController());
    Get.put(EventPopupController());
  }
}
