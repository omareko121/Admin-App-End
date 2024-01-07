import 'dart:io';

import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wirless_delivery/controller/cat/view.dart';
import 'package:wirless_delivery/controller/items/view.dart';
import 'package:wirless_delivery/core/class/statusRequest.dart';
import 'package:wirless_delivery/core/function/hundlingdata.dart';
import 'package:wirless_delivery/core/function/upoldeImage.dart';
import 'package:wirless_delivery/data/Models/catogris.dart';
import 'package:wirless_delivery/data/Models/items.dart';
import 'package:wirless_delivery/data/datasoures/remout/cat/cat.dart';
import 'package:wirless_delivery/data/datasoures/remout/items/items.dart';

class Additemscontroller extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());
  CategoriesData categoriesData = CategoriesData(Get.find());

  List<SelectedListItem> dropdownList = [];

  late TextEditingController name;
  late TextEditingController dropdown;
  late TextEditingController dropdownid;
  late TextEditingController desc;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;
  late TextEditingController catid;
  late TextEditingController catname;

  Itemsmodel? itemsmodel;

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
      } else {
        statusRequest = StatusRequest.loading;
        update();
        Map data = {
          "name": name.text,
          "desc": desc.text,
          "count": count.text,
          "price": price.text,
          "discount": discount.text,
          "catid": catid.text,
          "datenow": DateTime.now().toString(),
          // "datenow": catid.text,
        };
        var response = await itemsData.add(data, file!);
        statusRequest = hundlingdata(response);
        print("------------------------------------$response");

        if (StatusRequest.success == statusRequest) {
          if (response['status'] == 'success') {
            Get.offAllNamed("/itemsview");
            Viewitemscontroller c = Get.find();
            c.getData();
          } else {
            statusRequest = StatusRequest.falier;
          }
        }

        update();
      }
    } else {
      Get.snackbar("Error", "Please Write All Ditiles To The item");
    }
  }

  getCat() async {
    statusRequest = StatusRequest.loading;
    var response = await categoriesData.view();
    statusRequest = hundlingdata(response);
    print("------------------------------------$response");

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List<Catigoris> data = [];
        List datalist = response['data'];
        data.addAll(datalist.map((e) => Catigoris.fromJson(e)));
        for (int i = 0; i < data.length; i++) {
          dropdownList.add(SelectedListItem(
              name: data[i].categoriesName!, value: data[i].categoriesId));
        }
      } else {
        statusRequest = StatusRequest.falier;
      }
    }

    update();
  }

  mybake() {
    Get.offAllNamed("/homepage");
  }

  @override
  void onInit() {
    getCat();
    name = TextEditingController();
    desc = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    dropdown = TextEditingController();
    dropdownid = TextEditingController();
    catid = TextEditingController();
    catname = TextEditingController();
    super.onInit();
  }
}
