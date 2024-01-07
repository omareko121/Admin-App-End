
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wirless_delivery/controller/Users/view.dart';
import 'package:wirless_delivery/controller/items/view.dart';
import 'package:wirless_delivery/core/class/statusRequest.dart';
import 'package:wirless_delivery/core/function/hundlingdata.dart';
import 'package:wirless_delivery/data/Models/usersmodel.dart';

import 'package:wirless_delivery/data/datasoures/remout/users/users.dart';

class Addusercontroller extends GetxController {
  UsersData usersData = UsersData(Get.find());

  late TextEditingController name;
  late TextEditingController password;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController verficode;

  Usersmodel? usersmodel;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  StatusRequest? statusRequest = StatusRequest.none;

  adddata() async {
    if (formkey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "name": name.text,
        "password": password.text,
        "email": email.text,
        "phone": phone.text,
        "verifaidcode": verficode.text,
        "datenow": DateTime.now().toString(),
      };
      var response = await usersData.add(data);
      statusRequest = hundlingdata(response);
      print("------------------------------------$response");

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.offAllNamed("/usersview");
          Viewuserscontroller c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.falier;
        }
      }

      update();
    } else {
      Get.snackbar("Error", "Please Write All Ditiles To The item");
    }
  }

  mybake() {
    Get.offAllNamed("/homepage");
  }

  @override
  void onInit() {
    name = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    verficode = TextEditingController();
    super.onInit();
  }
}
