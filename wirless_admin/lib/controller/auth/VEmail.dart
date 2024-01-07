// ignore_for_file: non_constant_identifier_names, unused_import, duplicate_ignore, avoid_single_cascade_in_expression_statements, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:wirless_delivery/core/class/statusRequest.dart';
import 'package:wirless_delivery/core/function/hundlingdata.dart';
import 'package:wirless_delivery/core/serve/serveise.dart';
// ignore: unused_import

import '../../data/datasoures/remout/auth/verefiycode.dart';

abstract class Vircodepasewow extends GetxController {
  Vircode();
  gotresetpaswv(String verificationCode);
  resnd();
}

class Vircodepasewowrimp extends Vircodepasewow {
  late String verificationCode;
  StatusRequest? statusRequest;
  verefiycodeemail Verefiycodeemail = verefiycodeemail(Get.find());

  String? email;
  Myserveses myserveses = Get.find();

  @override
  Vircode() {}

  @override
  gotresetpaswv(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await Verefiycodeemail.postdata(email!, verificationCode);
    print("----------------------$response");
    statusRequest = hundlingdata(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offAllNamed("/succesful");
      } else {
        Get.defaultDialog(
            title: "خطا",
            middleText: "عزيزي الرمز غير صحيح تاكد من الرمز المرسل",
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
          middleText: "عزيزي الرمز غير صحيح تاكد من الرمز المرسل",
          titleStyle: const TextStyle(
              fontFamily: 'myfont1', fontSize: 22, fontWeight: FontWeight.bold),
          middleTextStyle: const TextStyle(
              fontFamily: 'myfont1',
              fontSize: 17,
              fontWeight: FontWeight.bold));
    }

    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  resnd() {
    Verefiycodeemail.resend(email!);
  }
}
