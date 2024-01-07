import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless_delivery/core/serve/serveise.dart';

class Mymedele extends GetMiddleware {
  int? get priority => 1;

  Myserveses myserveses = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myserveses.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: "/homepage");
    }


    if (myserveses.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: "/Login");
    }

    return null;
  }
}
