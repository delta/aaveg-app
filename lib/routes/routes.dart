import 'package:aaveg_app/bindings/sample_bindings.dart';
import 'package:aaveg_app/pages/home.dart';
import 'package:aaveg_app/pages/sample.dart';
import 'package:get/get.dart';

// declare all ur routes here
class Routes {
  var route = [
    GetPage(name: "/sample", page: () => Sample(), binding: SampleBinding()),
    GetPage(name: "/home", page: () => Home()),
  ];
}
