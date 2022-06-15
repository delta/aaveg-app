import 'package:aaveg_app/models/about_model.dart';
import 'package:aaveg_app/providers/constants.dart';
import 'package:aaveg_app/providers/storage_service.dart';
import 'package:get/get.dart';

class AboutProvider extends GetConnect {
  Future<AboutModel> getAboutContentResponse() async {
    final storage = Get.find<StorageService>();
    final aboutData = storage.getAboutContent();
    if (aboutData != null) {
      return aboutModelFromJson(aboutData);
    } else {
      final response =
          await post("${Constants.baseUrl}/api/constants/aboutUsContent", {});
      if (response.statusCode == 200) {
        final about = aboutModelFromJson(response.bodyString!);
        storage.storeAboutContent(response.bodyString!);
        return about;
      } else {
        return Future.error("Error ocuured in fetching scores. Try agin!!");
      }
    }
  }
}
