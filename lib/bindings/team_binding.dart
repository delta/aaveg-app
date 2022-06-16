import 'package:aaveg_app/controllers/team_controller.dart';
import 'package:get/get.dart';

class TeamBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TeamController());
  }
}
