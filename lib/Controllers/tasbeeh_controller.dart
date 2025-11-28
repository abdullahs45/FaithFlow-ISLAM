import 'package:get/get.dart';

class TasbeehController extends GetxController {
  var count = 0.obs;
  var rounds = 0.obs;

  void increment() {
    count.value++;
    if (count.value >= 33) {
      count.value = 0;
      rounds.value++;
    }
  }

  void reset() {
    count.value = 0;
    rounds.value = 0;
  }
}
