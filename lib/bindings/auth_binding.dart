import 'package:aaveg_app/controllers/auth_controller.dart';
import 'package:aaveg_app/controllers/date_controller.dart';
import 'package:get/instance_manager.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(DateController());
  }
}
