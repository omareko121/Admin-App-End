import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wirless_delivery/controller/cat/view.dart';
import 'package:wirless_delivery/core/class/statusRequest.dart';
import 'package:wirless_delivery/core/function/hundlingdata.dart';
import 'package:wirless_delivery/core/function/upoldeImage.dart';
import 'package:wirless_delivery/data/Models/catogris.dart';
import 'package:wirless_delivery/data/datasoures/remout/cat/cat.dart';

class Editcatcontroller extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  late TextEditingController name;

  Catigoris? datamodel;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  StatusRequest? statusRequest = StatusRequest.none;

  File? file;

  chooseImg() async {
    file = await fileuplode();
    update();
  }

  getData() async {
    if (formkey.currentState!.validate()) {
      // if (file == null) {
      //   Get.snackbar("Error", "Image is required. Please select an image");
      // }

      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "id": datamodel!.categoriesId,
        "name": name.text,
        "imageold": datamodel!.categoriesImg
      };
      var response = await categoriesData.edit(data, file);
      statusRequest = hundlingdata(response);
      print("------------------------------------$response");

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.offAllNamed("/categories");
          Viewcatcontroller c = Get.find();
          c.getData();
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
    datamodel = Get.arguments['datamodel'];
    name = TextEditingController();
    name.text = datamodel!.categoriesName!;
    super.onInit();
  }
}
