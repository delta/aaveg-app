import 'package:aaveg_app/models/about_model.dart';
import 'package:aaveg_app/providers/about_provider.dart';
import 'package:aaveg_app/providers/storage_service.dart';
import 'package:get/get.dart';

class AboutPageController extends GetxController with StateMixin<AboutModel> {
  AboutProvider aboutProvider = AboutProvider();
  final storage = Get.find<StorageService>();
  @override
  void onInit() {
    getAboutContent();
    super.onInit();
  }

  @override
  void onReady() {
    getAboutContent();
    super.onReady();
  }

  Future<void> getAboutContent() async {
    aboutProvider.getAboutContentResponse().then(
        (response) => change(response, status: RxStatus.success()),
        onError: (error) =>
            change(null, status: RxStatus.error(error.toString())));
  }
}
