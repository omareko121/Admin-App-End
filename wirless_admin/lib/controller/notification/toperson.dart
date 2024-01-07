import 'dart:io';

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wirless_delivery/controller/items/view.dart';
import 'package:wirless_delivery/core/class/statusRequest.dart';
import 'package:wirless_delivery/core/function/hundlingdata.dart';
import 'package:wirless_delivery/core/function/upoldeImage.dart';
import 'package:wirless_delivery/data/Models/items.dart';
import 'package:wirless_delivery/data/Models/usersmodel.dart';
import 'package:wirless_delivery/data/datasoures/remout/noti.dart';
import 'package:wirless_delivery/data/datasoures/remout/users/users.dart';

class Notivicationcontrollertoperson extends GetxController {
  Notidata notidata = Notidata(Get.find());
  UsersData usersData = UsersData(Get.find());

  List<SelectedListItem> dropdownList = [];

  late TextEditingController title;
  late TextEditingController body;
  late TextEditingController userid;
  late TextEditingController username;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  StatusRequest? statusRequest = StatusRequest.none;

  send() async {
    if (formkey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await notidata.toperson(userid.text, title.text, body.text);
      statusRequest = hundlingdata(response);
      Get.offAllNamed("/homepage");

      update();
    } else {
      Get.snackbar("Error", "Please Write All Ditiles To The item");
    }
  }

  getuser() async {
    statusRequest = StatusRequest.loading;
    var response = await usersData.view();
    statusRequest = hundlingdata(response);
    print("------------------------------------$response");

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List<Usersmodel> data = [];
        List datalist = response['data'];
        data.addAll(datalist.map((e) => Usersmodel.fromJson(e)));
        for (int i = 0; i < data.length; i++) {
          dropdownList.add(SelectedListItem(
              name: data[i].usersName!, value: data[i].usersId));
        }
      } else {
        statusRequest = StatusRequest.falier;
      }
    }

    update();
  }

  @override
  void onInit() {
    getuser();
    userid = TextEditingController();
    title = TextEditingController();
    username = TextEditingController();
    body = TextEditingController();
    super.onInit();
  }
}
