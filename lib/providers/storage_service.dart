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

  Future<void> storeUser(AuthModel user) async {
    await storage.write(Constants.jwt, user.jwt);
    await storage.write(Constants.name, user.userDetails?.name);
    await storage.write(Constants.squad, user.userDetails?.squad);
  }

  Future<void> storeSquads(String squads) async {
    await storage.write(Constants.squads, squads);
  }

  String? getSquads() {
    return storage.read(Constants.squads);
  }

  Future<void> storeTeams(String team) async {
    await storage.write(Constants.team, team);
  }

  String? getTeams() {
    return storage.read(Constants.team);
  }

  Future<void> storeAboutContent(String about) async {
    await storage.write(Constants.about, about);
  }

  String? getAboutContent() {
    return storage.read(Constants.about);
  }

  Future<void> storeMySquad(String mysquad) async {
    await storage.write(Constants.mysquad, mysquad);
  }

  String? getMySquad() {
    return storage.read(Constants.mysquad);
  }

  String? getName() {
    return storage.read(Constants.name);
  }

  String? getSquad() {
    return storage.read(Constants.squad);
  }

  String? getJwt() {
    return storage.read(Constants.jwt);
  }

  void clearStorage() {
    storage.remove(Constants.jwt);
  }
}
