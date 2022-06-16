import 'package:aaveg_app/models/date_model.dart';
import 'package:aaveg_app/models/score_model.dart';
import 'package:aaveg_app/providers/date_provider.dart';
import 'package:aaveg_app/providers/storage_service.dart';
import 'package:aaveg_app/views/widgets/AuthWebView/dauth_web_view.dart';
import 'package:get/get.dart';

class DateController extends GetxController with StateMixin<DateModal> {
  DateProvider scoreProvider = DateProvider();
  final storage = Get.find<StorageService>();
  @override
  void onInit() {
    getDate();
    super.onInit();
  }

  void loginControl() {
    if (storage.getJwt() != null)
      storage.clearStorage();
    else
      Get.to(WebViewWidget());
  }

  Future<void> getDate() async {
    scoreProvider.getDateResponse().then((response) {
      change(response, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
