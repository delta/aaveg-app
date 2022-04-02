import 'package:aaveg_app/controllers/sample_controller.dart';
import 'package:get/instance_manager.dart';

// create bindings to initailze your controllers here
class SampleBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SampleController());
  }
}
