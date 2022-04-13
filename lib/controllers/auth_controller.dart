import 'package:aaveg_app/providers/auth_provider.dart';
import 'package:aaveg_app/utils/constants.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:universal_html/html.dart' as html;
// import 'dart:html' as html;
import 'package:url_launcher/url_launcher.dart';

class AuthController extends GetxController with StateMixin<dynamic> {
  AuthProvider api = AuthProvider();
  onCallBack(String code) async {
    var c = code;
    api.getCallBack(c).then((response) {
      change(response, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  String code = '';
  late html.WindowBase? _popupWin;
  void loginWithDauth() async {
    final currentUri = Uri.base;
    print(currentUri);
    final port = currentUri.port;
    // final _redirectUri = 'http://localhost:$port/static.html';

    final url = Uri.https('auth.delta.nitt.edu', '/authorize', {
      'client_id': ClientCredentials.clientId,
      'redirect_uri': ClientCredentials.redirectUri,
      'response_type': 'code',
      'grant_type': 'authorization_code',
      'state': ClientCredentials.state,
      'scope': 'email+openid+profile+user',
      'nonce': ClientCredentials.nonce
    });

    print(url.toString());

    try {
      // _popupWin = html.window.open(url.toString(), '_blank');   //package works ony on chrome
      // print(_popupWin);

      launch(url.toString()); // Need to fetch auth code from url

      //   html.window.onMessage.listen((event) {
      //     print(event.data.toString());

      //     if (event.data.toString().contains('?code=')) {
      //       _login(event.data.toString());
      //     }
      //   });
    } catch (e) {
      print("entered catch");
      print('$e');
    }
  }

  // Call this function on recieving auth code

  // void _login(String eventBody) {
  //   print('reached');
  //   final receivedUri = Uri.parse(eventBody);
  //   String token = receivedUri.queryParameters['code']!;
  //   code = token;
  //   onCallBack(code);
  //   _popupWin!.close();
  // }
}
