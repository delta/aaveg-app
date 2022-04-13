import 'package:aaveg_app/controllers/auth_controller.dart';
import 'package:get/instance_manager.dart';

// create bindings to initailze your controllers here
class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
