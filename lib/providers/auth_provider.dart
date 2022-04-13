import 'package:get/get_connect/connect.dart';
import 'package:aaveg_app/utils/constants.dart';

class AuthProvider extends GetConnect {
  Future getCallBack(String code) async {
    final response = await get('${ApiConstants.auth}?code=$code', headers: {
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': 'Accept',
    });

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return print(response.bodyString!);
    }
  }
}
