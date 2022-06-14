import 'package:aaveg_app/models/team_model.dart';
import 'package:aaveg_app/providers/constants.dart';
import 'package:aaveg_app/providers/storage_service.dart';
import 'package:get/get.dart';

class TeamProvider extends GetConnect {
  Future<TeamModel> getTeamResponse() async {
    final storage = Get.find<StorageService>();
    final teamData = storage.getTeams();
    if (teamData != null) {
      return teamModelFromJson(teamData);
    } else {
      final response =
          await post("${Constants.baseUrl}/api/constants/teamsData", {});
      if (response.statusCode == 200) {
        final team = teamModelFromJson(response.bodyString!);
        storage.storeTeams(response.bodyString!);
        return team;
      } else {
        return Future.error("Error ocuured in fetching scores. Try agin!!");
      }
    }
  }
}
