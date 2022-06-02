import 'package:aaveg_app/controllers/originstory_controller.dart';
import 'package:get/instance_manager.dart';

class OriginStoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OriginStoryController());
  }
}
