import 'package:get/get.dart';

class NavBarController extends GetxController {
  RxBool isVisible = true.obs;
  void setVisiblity(bool value) {
    isVisible.value = value;
  }

  void nextPageVisiblity() {
    isVisible.value = true;
  }
}
