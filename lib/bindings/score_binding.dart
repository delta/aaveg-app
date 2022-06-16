import 'package:aaveg_app/controllers/score_controller.dart';
import 'package:get/get.dart';

class ScoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ScoreController());
  }
}
