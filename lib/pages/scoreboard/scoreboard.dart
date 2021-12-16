import 'package:aaveg_app/api/apimanager.dart';
import 'package:aaveg_app/models/result_respone.dart';
import 'package:aaveg_app/models/score_response.dart';
import 'package:aaveg_app/pages/scoreboard/scorescreen.dart';
import 'package:aaveg_app/screens/error.dart';
import 'package:aaveg_app/screens/loading.dart';
import 'package:aaveg_app/services/cache_manager.dart';
import 'package:aaveg_app/utils/clan_utils.dart';
import 'package:flutter/material.dart';

typedef BoolCallback = Function(bool b);

class Scores extends StatefulWidget {
  const Scores({Key key}) : super(key: key);

  @override
  _ScoresState createState() => _ScoresState();
}

class _ScoresState extends State<Scores> with SingleTickerProviderStateMixin {
  Future<ResultResponse<ScoresResponse, String>> _scores;
  TabController _tabController;
  ScoresResponse _cache;
  var _clan = 'Agni';

  @override
  void initState() {
    _scores = ApiManager().scores();
    CacheManager().getScores().then((value) {
      setState(() {
        _cache = value;
      });
      CacheManager().getClan().then((value) {
        setState(() {
          _clan = value;
        });
      });
    });
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        toolbarHeight: 45,
        backgroundColor: Colors.black,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Theme.of(context).primaryColor,
          labelColor: Theme.of(context).primaryColor,
          indicatorWeight: 3,
          labelPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
          unselectedLabelColor: Colors.grey.shade500,
          tabs: const [
            Text('Overall'),
            Text('Culturals'),
            Text('Spectrum'),
            Text('ScoreBoard')
          ],
        ),
      ),
      body: FutureBuilder<ResultResponse<ScoresResponse, String>>(
          future: _scores,
          builder: (context, api) {
            if (api.hasData) {
              if (api.data.message == 'success') {
                var res = api.data;

                return ScoresScreen(
                  tabController: _tabController,
                  list: [
                    Utils().series(res.response, 1, _clan),
                    Utils().series(res.response, 2, _clan),
                    Utils().series(res.response, 3, _clan),
                  ],
                  eventsScore: res.response.eventsScore,
                  isOffline: false,
                  clan: _clan,
                );
              } else if (api.data.message == 'Network Error') {
                if (_cache != null) {
                  return ScoresScreen(
                    tabController: _tabController,
                    list: [
                      Utils().series(_cache, 1, _clan),
                      Utils().series(_cache, 2, _clan),
                      Utils().series(_cache, 3, _clan),
                    ],
                    eventsScore: _cache.eventsScore,
                    isOffline: true,
                    clan: _clan,
                  );
                } else {
                  return ErrorScreen();
                }
              }
              return LoadingScreen();
            }
            return LoadingScreen();
          }));
}
