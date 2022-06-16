import 'package:aaveg_app/models/team_model.dart';
import 'package:aaveg_app/providers/storage_service.dart';
import 'package:aaveg_app/providers/team_provider.dart';
import 'package:get/get.dart';

class TeamController extends GetxController with StateMixin<TeamModel> {
  TeamProvider teamProvider = TeamProvider();
  final storage = Get.find<StorageService>();
  @override
  void onInit() {
    getTeams();
    super.onInit();
  }

  @override
  void onReady() {
    getTeams();
    super.onReady();
  }

  var team = "Core".obs;
  var teamIndex = 0.obs;
  Future<void> getTeams() async {
    teamProvider.getTeamResponse().then(
        (response) => change(response, status: RxStatus.success()),
        onError: (error) =>
            change(null, status: RxStatus.error(error.toString())));
  }

  void setTeam(String teamName, int index) {
    team.value = teamName;
    teamIndex.value = index;
  }
}
