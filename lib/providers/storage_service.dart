import 'package:aaveg_app/models/auth_model.dart';
import 'package:aaveg_app/providers/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  late GetStorage storage;

  Future<StorageService> initStorage() async {
    await GetStorage.init();
    storage = GetStorage();
    return this;
  }

  Future<void> storeJwt(AuthModel user) async {
    await storage.write(Constants.jwt, user.jwt);
  }

  String? getJwt() {
    return storage.read(Constants.jwt);
  }

  void clearStorage() {
    storage.remove(Constants.jwt);
  }
}
