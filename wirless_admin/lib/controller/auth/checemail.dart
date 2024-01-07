// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: unused_import

abstract class ChecEmailcontroller extends GetxController {
  cheackemail();
  gotopageSuc();
}

class ChecEmailcontrollerimp extends ChecEmailcontroller {
  late TextEditingController email;


  @override
  cheackemail() {}

  @override
  gotopageSuc() {
    Get.toNamed("login");
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
  
  
}
