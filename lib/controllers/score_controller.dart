import 'package:aaveg_app/models/score_model.dart';
import 'package:aaveg_app/providers/score_provider.dart';
import 'package:aaveg_app/providers/storage_service.dart';
import 'package:get/get.dart';

class ScoreController extends GetxController with StateMixin<ScoreModel> {
  ScoreProvider scoreProvider = ScoreProvider();
  final storage = Get.find<StorageService>();
  @override
  void onInit() {
    getScores();
    super.onInit();
  }

  Future<void> getScores() async {
    scoreProvider.getScoreResponse().then((response) {
      change(response, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
