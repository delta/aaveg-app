import 'package:aaveg_app/models/events_response.dart';
import 'package:aaveg_app/models/game_response.dart';
import 'package:aaveg_app/models/score_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  Future<SharedPreferences> getInstance() async {
    var s = await SharedPreferences.getInstance();
    return s;
  }

  Future storeLogin(
      String rollnumber, String password, String clan, String userId) async {
    SharedPreferences _prefrences = await SharedPreferences.getInstance();
    _prefrences.setString('rollnumber', rollnumber);
    _prefrences.setString('clan', clan);
    _prefrences.setString('userId', userId);
  }

  Future<String> getUser() async {
    SharedPreferences _prefrences = await SharedPreferences.getInstance();
    return _prefrences.getString('userId');
  }

  Future<String> getClan() async {
    SharedPreferences _prefrences = await SharedPreferences.getInstance();
    return _prefrences.getString('clan');
  }

  Future<String> getRN() async {
    SharedPreferences _prefrences = await SharedPreferences.getInstance();
    return _prefrences.getString('rollnumber');
  }

  Future removeCache() async {
    SharedPreferences _prefrences = await SharedPreferences.getInstance();
    _prefrences.remove('rollnumber');
    _prefrences.remove('clan');
    _prefrences.remove('userId');
    _prefrences.remove('event');
    _prefrences.remove('scores');
  }

  Future<void> storeEvents(String events) async {
    SharedPreferences _prefrences = await SharedPreferences.getInstance();
    _prefrences.setString('event', events);
  }

  Future<EventsResponse> getEvents() async {
    SharedPreferences _prefrences = await SharedPreferences.getInstance();
    String value = _prefrences.getString('event');
    if (value != null) {
      return eventsResponseFromJson(value);
    } else {
      return null;
    }
  }

  Future<void> storeScores(ScoresResponse events) async {
    SharedPreferences _prefrences = await SharedPreferences.getInstance();
    _prefrences.setString('scores', scoresResponseToJson(events).toString());
  }

  Future<ScoresResponse> getScores() async {
    SharedPreferences _prefrences = await SharedPreferences.getInstance();
    String value = _prefrences.getString('scores');
    if (value != null) {
      return scoresResponseFromJson(value);
    } else {
      return null;
    }
  }

  Future<bool> getBGM() async {
    SharedPreferences _prefrences = await SharedPreferences.getInstance();
    return _prefrences.getBool('bgm');
  }

  Future<void> storeBGM(bool isOn) async {
    SharedPreferences _prefrences = await SharedPreferences.getInstance();
    _prefrences.setBool('bgm', isOn);
  }

  Future<String> getHS() async {
    SharedPreferences _prefrences = await SharedPreferences.getInstance();
    if (_prefrences.getString('hs') == null) {
      return '0';
    } else {
      return _prefrences.getString('hs');
    }
  }

  Future<void> storeHS(int hs) async {
    SharedPreferences _prefrences = await SharedPreferences.getInstance();
    _prefrences.setString('hs', hs.toString());
  }

  Future<void> storeGame(GameResponse events) async {
    SharedPreferences _prefrences = await SharedPreferences.getInstance();
    _prefrences.setString('game', gameResponseToJson(events).toString());
  }

  Future<GameResponse> getGame() async {
    SharedPreferences _prefrences = await SharedPreferences.getInstance();
    String value = _prefrences.getString('game');
    if (value != null) {
      return gameResponseFromJson(value);
    } else {
      return null;
    }
  }
}
