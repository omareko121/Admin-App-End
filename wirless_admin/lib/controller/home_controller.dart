import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless_delivery/core/class/statusRequest.dart';
import 'package:wirless_delivery/core/serve/serveise.dart';


abstract class homecontroller extends GetxController {
  initilData();
}

class homecontrollerimb extends homecontroller {
  Myserveses myserveses = Get.find();


  String? username;
  int? id;
  String? email;
  String? phone;
  String? password;

  late StatusRequest statusRequest;



  

  @override
  initilData() {
    username = myserveses.sharedPreferences.getString('username');
    id = myserveses.sharedPreferences.getInt('id');
    email = myserveses.sharedPreferences.getString('email');
    phone = myserveses.sharedPreferences.getString('phone');
    password = myserveses.sharedPreferences.getString('password');
  }

  @override
  void onInit() {
      initilData();
    super.onInit();
  }



  

}
