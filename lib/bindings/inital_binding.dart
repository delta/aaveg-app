import 'package:aaveg_app/controllers/auth_controller.dart';
import 'package:aaveg_app/controllers/date_controller.dart';
import 'package:aaveg_app/controllers/nav_bar_controller.dart';
import 'package:get/instance_manager.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DateController());
    Get.put(NavBarController());
    Get.put(AuthController());
  }
}
