import 'package:aaveg_app/models/my_squad_model.dart';
import 'package:aaveg_app/providers/my_squad_provider.dart';
import 'package:aaveg_app/providers/storage_service.dart';
import 'package:get/get.dart';

class MySquadController extends GetxController with StateMixin<MysquadModel> {
  final storage = Get.find<StorageService>();
  MySquadProvider mySquadProvider = MySquadProvider();
  @override
  void onInit() {
    getMySquad();
    super.onInit();
  }

  @override
  void onReady() {
    getMySquad();
    super.onReady();
  }

  Future<void> getMySquad() async {
    mySquadProvider.getMySquadResponse().then(
        (response) => change(response, status: RxStatus.success()),
        onError: (error) =>
            change(null, status: RxStatus.error(error.toString())));
  }
}
