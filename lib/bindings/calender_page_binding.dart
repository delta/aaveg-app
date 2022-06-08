import 'package:get/instance_manager.dart';

import '../controllers/calendar_page_controller.dart';

class CalendarPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CalendarPageController());
  }
}
