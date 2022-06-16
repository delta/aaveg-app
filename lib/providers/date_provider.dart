import 'package:aaveg_app/models/date_model.dart';
import 'package:aaveg_app/providers/constants.dart';
import 'package:aaveg_app/providers/storage_service.dart';
import 'package:get/get.dart';

class DateProvider extends GetConnect {
  Future<DateModal> getDateResponse() async {
    final storage = Get.find<StorageService>();
    final dateStore = storage.getaavegDate();
    if (dateStore != null) {
      final date = dateModalFromJson(dateStore);
      return date;
    } else {
      final response =
          await post("${Constants.baseUrl}/api/constants/aavegDate/", {});
      if (response.statusCode == 200) {
        final date = dateModalFromJson(response.bodyString!);
        storage.storeDate(response.bodyString!);
        return date;
      } else {
        return Future.error("Error ocuured in fetching scores. Try agin!!");
      }
    }
  }
}
