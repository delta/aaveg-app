import 'package:aaveg_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';
import '../../utils/constants.dart';

class WebViewWidget extends GetView<AuthController> {
  const WebViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authcontroller = Get.find<AuthController>();
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
    return Container(
      child: WebView(
        initialUrl: url.toString(),
        javascriptMode: JavascriptMode.unrestricted,
        navigationDelegate: (NavigationRequest request) {
          print(url);
          if (request.url.contains('?code=')) {
            final redirectUrl = Uri.parse(request.url);
            final codefromParam = redirectUrl.queryParameters['code'];
            print("Code from params $codefromParam");
            controller.getResponse(codefromParam!);
            Navigator.of(context)
                .pushReplacementNamed("/dauth", arguments: codefromParam);
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}
