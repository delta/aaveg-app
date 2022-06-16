import 'package:aaveg_app/controllers/my_squad_controller.dart';
import 'package:get/instance_manager.dart';

class MySquadBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MySquadController());
  }
}
