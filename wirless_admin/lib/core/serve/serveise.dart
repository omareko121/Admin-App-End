// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myserveses extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<Myserveses> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServese() async {
  await Get.putAsync(() => Myserveses().init());
}
