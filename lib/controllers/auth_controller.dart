import 'package:aaveg_app/providers/auth_provider.dart';
import 'package:aaveg_app/providers/storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController with StateMixin<dynamic> {
  AuthProvider api = AuthProvider();
  var storageService = Get.find<StorageService>();
  Future<void> getResponse(String code) async {
    api.getTokenResponse(code).then((response) {
      if (response.jwt != null) {
        storageService.storeJwt(response);
        Get.snackbar(
          "Login",
          "Login Successful",
          duration: Duration(seconds: 3),
          snackPosition: SnackPosition.BOTTOM,
          snackStyle: SnackStyle.FLOATING,
          margin: EdgeInsets.all(10),
        );
        Get.offAllNamed("/home");
      }
    }, onError: (err) {
      Get.snackbar(
        "Login Error",
        "Error occured while logging in ${err.toString()}",
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
        margin: EdgeInsets.all(10),
      );
    });
  }
}
