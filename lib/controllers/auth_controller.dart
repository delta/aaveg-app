import 'dart:convert';
import 'package:aaveg_app/providers/auth_provider.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
// import 'package:universal_html/html.dart' as html;
// import 'dart:html' as html;
import 'package:http/http.dart' as http;

class AuthController extends GetxController with StateMixin<dynamic> {
  AuthProvider api = AuthProvider();
  Future<void> getResponse(String code) async {
    api.getTokenResponse(code).then((response) {
      print("Response in web view $response");
      print(response.jwt);
    }, onError: (err) {
      print("Error in web view $err");
    });
  }
}
