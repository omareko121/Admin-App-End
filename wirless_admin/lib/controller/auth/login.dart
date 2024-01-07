// ignore_for_file: non_constant_identifier_names, avoid_single_cascade_in_expression_statements, avoid_print, unused_local_variable, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: unused_import
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:wirless_delivery/core/serve/serveise.dart';
import '../../core/class/statusRequest.dart';
import '../../core/function/hundlingdata.dart';
import '../../data/datasoures/remout/auth/login.dart';

abstract class Logincontroller extends GetxController {
  login();
  Sginuptopage();
  forgetpasgoto();
}

class Logincontrollerimb extends Logincontroller {
  late TextEditingController email;
  late TextEditingController paswword;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest? statusRequest;
  Logindata logindata = Logindata(Get.find());

  Myserveses myserveses = Get.find();

  @override
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await logindata.postdata(
        email.text,
        paswword.text,
      );
      statusRequest = hundlingdata(response);

      print("------------------------------------$response");
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          // data.addAll(response['data']);
          if (response['data']['admin_approve'] == 1) {
            myserveses.sharedPreferences
                .setInt("id", response['data']['admin_id']);
            String userid = myserveses.sharedPreferences.getInt("id").toString();
            myserveses.sharedPreferences
                .setString("username", response['data']['admin_name']);
            myserveses.sharedPreferences
                .setString("password", response['data']['admin_password']);
            myserveses.sharedPreferences
                .setString("phone", response['data']['admin_phone']);
            myserveses.sharedPreferences
                .setString("email", response['data']['admin_email']);
            myserveses.sharedPreferences.setString("step", "2");
          
            Get.offAllNamed("/homepage");
          } else {
            Get.offAllNamed("/checEmail", arguments: {"email": email.text});
          }
        } else {
          Get.defaultDialog(
              title: "خطا",
              middleText: "عزيزي الايميل المستخدم او الباسوورد غير صحيح",
              titleStyle: const TextStyle(
                  fontFamily: 'myfont1',
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
              middleTextStyle: const TextStyle(
                  fontFamily: 'myfont1',
                  fontSize: 17,
                  fontWeight: FontWeight.bold));
        }
      } else {
        Get.defaultDialog(
            title: "خطا",
            middleText: "عزيزي الايميل المستخدم او الباسوورد غير صحيح",
            titleStyle: const TextStyle(
                fontFamily: 'myfont1',
                fontSize: 22,
                fontWeight: FontWeight.bold),
            middleTextStyle: const TextStyle(
                fontFamily: 'myfont1',
                fontSize: 17,
                fontWeight: FontWeight.bold));
      }

      update();
    } else {
      Get.defaultDialog(
          title: "خطا",
          middleText: "عزيزي تاكد من كتابه الحقول كلها ب الشكل الصحيح",
          titleStyle: const TextStyle(
              fontFamily: 'myfont1', fontSize: 22, fontWeight: FontWeight.bold),
          middleTextStyle: const TextStyle(
              fontFamily: 'myfont1',
              fontSize: 17,
              fontWeight: FontWeight.bold));
    }
  }

  bool isvis = true;

  showpassword() {
    isvis = isvis == true ? false : true;
    update();
  }

  @override
  Sginuptopage() {
    Get.offNamed("sginup");
  }

  @override
  void onInit() {
    email = TextEditingController();
    paswword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    paswword.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  forgetpasgoto() {
    Get.toNamed("forgetp");
  }
}
