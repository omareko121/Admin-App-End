import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wirless_delivery/core/class/statusRequest.dart';
import 'package:wirless_delivery/core/function/hundlingdata.dart';
import 'package:wirless_delivery/core/function/upoldeImage.dart';
import 'package:wirless_delivery/data/datasoures/remout/cat/cat.dart';

class Addcatcontroller extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  late TextEditingController name;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

 StatusRequest? statusRequest = StatusRequest.none;

  File? file;

  chooseImg() async {
    file = await fileuplode();
    update();
  }

  getData() async {
    if (formkey.currentState!.validate()) {
      if (file == null) {
        Get.snackbar("Error", "Image is required. Please select an image");
      }

      statusRequest = StatusRequest.loading;
      update();
      Map data = {"name": name.text};
      var response = await categoriesData.add(data, file!);
      statusRequest = hundlingdata(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.offAllNamed("/categories");
        } else {
          statusRequest = StatusRequest.falier;
        }
      }

      update();
    } else {
      Get.snackbar("Error", "Please Write Name To The Category");
    }
  }

  mybake() {
    Get.offAllNamed("/homepage");
  }

  @override
  void onInit() {
    name = TextEditingController();
    super.onInit();
  }
}
