import 'package:aaveg_app/models/my_squad_model.dart';
import 'package:aaveg_app/providers/constants.dart';
import 'package:aaveg_app/providers/storage_service.dart';
import 'package:get/get.dart';

class MySquadProvider extends GetConnect {
  Future<MysquadModel> getMySquadResponse() async {
    final storage = Get.find<StorageService>();
    var headers = {
      'Authorization': 'Bearer ${storage.getJwt()}',
    };
    final response = await post("${Constants.baseUrl}/api/squad/mySquad", {},
        headers: headers);
    if (response.statusCode == 401) {
      storage.clearStorage();
      return Future.error("Session expired. Please login again");
    }
    if (response.statusCode == 200) {
      final mysquad = mysquadModelFromJson(response.bodyString!);
      storage.storeMySquad(response.bodyString!);
      return mysquad;
    } else {
      return Future.error("Error ocuured in fetching scores. Try agin!!");
    }
  }
}
