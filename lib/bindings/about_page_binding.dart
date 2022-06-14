import 'package:aaveg_app/controllers/about_page_controller.dart';
import 'package:get/instance_manager.dart';

class AboutPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AboutPageController());
  }
}
