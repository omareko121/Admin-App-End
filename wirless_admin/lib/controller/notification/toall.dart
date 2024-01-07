import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wirless_delivery/core/class/statusRequest.dart';
import 'package:wirless_delivery/core/function/hundlingdata.dart';

import 'package:wirless_delivery/data/datasoures/remout/noti.dart';

class Notivicationcontrollertoall extends GetxController {
  Notidata notidata = Notidata(Get.find());

  late TextEditingController title;
  late TextEditingController body;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  StatusRequest? statusRequest = StatusRequest.none;

  send() async {
    if (formkey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await notidata.toall(title.text, body.text);
      statusRequest = hundlingdata(response);
      Get.offAllNamed("/homepage");

      update();
    } else {
      Get.snackbar("Error", "Please Write All Ditiles To The item");
    }
  }

  @override
  void onInit() {
    title = TextEditingController();
    body = TextEditingController();
    super.onInit();
  }
}
