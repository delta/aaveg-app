import 'package:get/get.dart';

// write your code logic here
class CalendarPageController extends GetxController {
  // counter is decalred as obs will be made observable
  var counter = 0.obs;
  void increment() {
    counter++;
  }
}
