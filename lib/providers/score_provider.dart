import 'package:aaveg_app/models/score_model.dart';
import 'package:aaveg_app/providers/constants.dart';
import 'package:aaveg_app/providers/storage_service.dart';
import 'package:get/get.dart';

class ScoreProvider extends GetConnect {
  Future<ScoreModel> getScoreResponse() async {
    final storage = Get.find<StorageService>();
    final response = await post("${Constants.baseUrl}/api/squad/get", {null});
    if (response.statusCode == 200) {
      final squadScore = scoreModelFromJson(response.bodyString!);
      squadScore.squads?.sort((a, b) {
        return a.position!.overall!.compareTo(b.position!.overall!);
      });
      squadScore.squads?.reversed.toList();
      storage.storeSquads(response.bodyString!);
      return squadScore;
    } else {
      if (response.status.hasError) {
        if (storage.getSquads() != null) {
          final cacheResponse = storage.getSquads()!;
          return scoreModelFromJson(cacheResponse);
        } else {
          return Future.error("Check your internet connection");
        }
      }
      return Future.error("Error ocuured in fetching scores. Try agin!!");
    }
  }
}
