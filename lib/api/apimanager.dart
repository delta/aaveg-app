import 'package:aaveg_app/api/constants.dart';
import 'package:aaveg_app/models/events_response.dart';
import 'package:aaveg_app/models/game_response.dart';
import 'package:aaveg_app/models/login_response.dart';
import 'package:aaveg_app/models/result_respone.dart';
import 'package:aaveg_app/models/score_response.dart';
import 'package:aaveg_app/services/cache_manager.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  Future<ResultResponse<LoginResponse, String>> login(
      String email, String password) async {
    var client = http.Client();
    var result = LoginResponse();
    var message = '';
    try {
      var response = await client.post(Uri.parse(Urls.login),
          body: {'email': email, 'password': password});

      if (response.statusCode == 200) {
        result = loginResponseFromJson(response.body);
        message = 'success';
      } else {
        message = loginResponseFromJson(response.body).message;
      }
    } catch (e) {
      message = 'Network Error';
    }
    return ResultResponse(result, message);
  }

  Future<ResultResponse<EventsResponse, String>> events() async {
    var client = http.Client();
    var result = EventsResponse();
    var message = '';
    try {
      var response = await client.get(Uri.parse(Urls.event));
      result = eventsResponseFromJson(response.body);
      message = 'success';
      await CacheManager().storeEvents(response.body);
    } catch (e) {
      message = 'Network Error';
    }
    return ResultResponse(result, message);
  }

  Future<ResultResponse<ScoresResponse, String>> scores() async {
    var client = http.Client();
    var result = ScoresResponse();
    var message = '';
    try {
      var response = await client.get(Uri.parse(Urls.score), headers: {
        'Content-type': 'application/x-www-form-urlencoded',
      });
      result = scoresResponseFromJson(response.body);
      message = 'success';
      await CacheManager().storeScores(result);
    } catch (e) {
      message = 'Network Error';
    }
    return ResultResponse(result, message);
  }

  Future<String> gamePost(
      String clan, String rollno, String score, String kills) async {
    var client = http.Client();
    var message = '';
    try {
      var response = await client.post(Uri.parse(Urls.gamepost), body: {
        'rollnumber': rollno,
        'clan': clan,
        'distance': score,
        'kills': kills
      });
      print(response.statusCode.toString());
      if (response.statusCode == 200) {
        message = 'success';
      } else if (response.statusCode == 201) {
        message = 'nil';
      } else {
        message = 'nil';
      }
      print(response.body);
    } catch (e) {
      print(e);
      message = 'error';
    }
    print(message);
    return message;
  }

  Future<ResultResponse<GameResponse, String>> gameGet() async {
    var client = http.Client();
    var result = GameResponse();
    var message = 'null';
    try {
      var response = await client.get(Uri.parse(Urls.gameget), headers: {
        'Content-type': 'application/x-www-form-urlencoded',
      });
      result = gameResponseFromJson(response.body);
      message = 'success';
      await CacheManager().storeGame(result);
    } catch (e) {
      print(e);
      message = 'Network Error';
    }
    print(message);
    return ResultResponse(result, message);
  }
}

// Future<List<SponsorResponse>> sponsors() async {
//   var client = http.Client();
//   var result = List<SponsorResponse>.empty(growable: true);
//   try {
//     var response = await client.get(Uri.parse(Urls.sponsors));
//     print(response.body);
//     if (response.body != null) {
//       result = sponsorResponseFromJson(response.body);
//     }
//   } catch (e) {
//     print(e);
//   }
//   return result;
// }
