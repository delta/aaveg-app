import 'package:aaveg_app/models/auth_model.dart';
import 'package:get/get_connect/connect.dart';

class AuthProvider extends GetConnect {
  Future<AuthModel> getTokenResponse(String code) async {
    final response =
        await post("http://10.0.2.2:3000/api/user/login", {"code": code});
    print(response.body);
    return authModelFromJson(response.bodyString!);
  }
}
