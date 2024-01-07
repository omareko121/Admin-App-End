// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wirless_delivery/core/function/hundlingdata.dart';
// ignore: unused_import

import '../../core/class/statusRequest.dart';
import '../../data/datasoures/remout/ResetPassword/Checkemail.dart';

abstract class forgetpaswoordcontroller extends GetxController {
  gotov();
  
}

class forgetpaswoordcontrollerimp extends forgetpaswoordcontroller {
  
  StatusRequest? statusRequest;
  CheckEmailRES checkEmailRES = CheckEmailRES(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;


  @override

  @override
  gotov() async{
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
        statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailRES.postdata(
        email.text
        );
      statusRequest = hundlingdata(response);
      print("------------------------------------$response");
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'succsess') {
          Get.offAllNamed("/vcode" , arguments: {
            "email" : email.text
          });
        } else {
            Get.defaultDialog(
            title: "خطا",
            middleText: "عزيزي الايميل المستخدم غير صحيح",
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



