import 'package:aaveg_app/controllers/nav_bar_controller.dart';
import 'package:get/instance_manager.dart';

class NavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavBarController());
  }
}
