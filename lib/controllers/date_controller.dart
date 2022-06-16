import 'package:aaveg_app/models/date_model.dart';
import 'package:aaveg_app/providers/date_provider.dart';
import 'package:aaveg_app/providers/storage_service.dart';
import 'package:aaveg_app/views/widgets/AuthWebView/dauth_web_view.dart';
import 'package:get/get.dart';

class DateController extends GetxController with StateMixin<DateModal> {
  DateProvider scoreProvider = DateProvider();
  final storage = Get.find<StorageService>();
  var buttonName = "LOGIN".obs;
  @override
  void onInit() {
    getDate();
    if (storage.getJwt() != null)
      buttonName.value = "LOGOUT";
    else
      buttonName.value = "LOGIN";
    super.onInit();
  }

  void loginControl() {
    if (storage.getJwt() != null) {
      storage.clearStorage();
      buttonNameChanged();
    } else
      Get.to(WebViewWidget());
  }

  void buttonNameChanged() {
    if (storage.getJwt() != null)
      buttonName.value = "LOGOUT";
    else
      buttonName.value = "LOGIN";
  }

  Future<void> getDate() async {
    scoreProvider.getDateResponse().then((response) {
      change(response, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
