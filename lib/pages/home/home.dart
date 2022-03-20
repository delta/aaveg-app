import 'package:aaveg_app/api/apimanager.dart';
import 'package:aaveg_app/models/result_respone.dart';
import 'package:aaveg_app/models/score_response.dart';
import 'package:aaveg_app/pages/home/homescreen.dart';
import 'package:aaveg_app/screens/error.dart';
import 'package:aaveg_app/screens/loading.dart';
import 'package:aaveg_app/services/cache_manager.dart';
import 'package:aaveg_app/utils/clan_utils.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<ResultResponse<ScoresResponse, String>>? _scores;
  var _clanLogo = 'assets/images/Agni.webp';
  var _clan = 'Agni';
  ScoresResponse? _cache;

  @override
  void initState() {
    _scores = ApiManager().scores().whenComplete(() {
      CacheManager().getScores().then((value) {
        setState(() {
          _cache = value!;
        });
      });
      CacheManager().getClan().then((value) {
        setState(() {
          _clan = value;
          _clanLogo = Utils().getClanLogo(value);
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body: FutureBuilder<ResultResponse<ScoresResponse, String>>(
          future: _scores,
          builder: (context, api) {
            if (api.hasData) {
              if (api.data!.message == 'success') {
                var res = api.data!.response as ScoresResponse;
                return HomeScreen(
                    clanLogo: _clanLogo,
                    clan: _clan,
                    res: res,
                    isOffline: false);
              } else if (api.data!.message == 'Network Error') {
                if (_cache != null) {
                  return HomeScreen(
                      clanLogo: _clanLogo,
                      clan: _clan,
                      res: _cache!,
                      isOffline: true);
                } else {
                  return ErrorScreen();
                }
              }
              return LoadingScreen();
            }
            return LoadingScreen();
          }));
}
