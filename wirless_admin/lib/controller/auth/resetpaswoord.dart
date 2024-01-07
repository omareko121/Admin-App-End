// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless_delivery/core/function/hundlingdata.dart';
import 'package:wirless_delivery/data/datasoures/remout/ResetPassword/ResetEmail.dart';
// ignore: unused_import

import '../../core/class/statusRequest.dart';

abstract class resetpascontller extends GetxController {
  resetpasword();
  gotopaswwordpage();
}

class resetpascontllerimp extends resetpascontller {
  late TextEditingController newpaswword;
  late TextEditingController Renewpaswword;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest? statusRequest;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  String? email;

  @override
  resetpasword() {}

  @override
  gotopaswwordpage() async {
    var formdata = formstate.currentState;
    if(newpaswword.text != Renewpaswword.text){
      Get.defaultDialog(
              title: "خطا",
              middleText: "عزيزي الرجاء كتابه الباسوورد مره اخرى بطريقه الصحيحه",
              titleStyle: const TextStyle(
                  fontFamily: 'myfont1',
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
              middleTextStyle: const TextStyle(
                  fontFamily: 'myfont1',
                  fontSize: 17,
                  fontWeight: FontWeight.bold));
    }else{
          if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postdata(
        email!,
        newpaswword.text,
      );
      statusRequest = hundlingdata(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.offAllNamed("/succesful2");
        } else {
          Get.defaultDialog(
              title: "خطا",
              middleText: "عزيزي كلمه المرور المدخله نفس كلمه المرور المستخدمه حاليا الرجاء ادخال كلمه مرور مختلفه",
              titleStyle: const TextStyle(
                  fontFamily: 'myfont1',
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
              middleTextStyle: const TextStyle(
                  fontFamily: 'myfont1',
                  fontSize: 17,
                  fontWeight: FontWeight.bold));
        }
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

  }

  bool isvis = true;

  showpassword() {
    isvis = isvis == true ? false : true;
    update();
  }

  @override
  void onInit() {
    newpaswword = TextEditingController();
    Renewpaswword = TextEditingController();
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void dispose() {
    newpaswword.dispose();
    Renewpaswword.dispose();
    super.dispose();
  }
}
