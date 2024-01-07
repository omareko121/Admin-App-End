// ignore_for_file: unrelated_type_equality_checks

import 'package:get/get.dart';
import 'package:wirless_delivery/core/class/statusRequest.dart';
import 'package:wirless_delivery/core/function/hundlingdata.dart';
import 'package:wirless_delivery/data/Models/catogris.dart';
import 'package:wirless_delivery/data/Models/items.dart';
import 'package:wirless_delivery/data/Models/usersmodel.dart';
import 'package:wirless_delivery/data/datasoures/remout/items/items.dart';
import 'package:wirless_delivery/data/datasoures/remout/users/users.dart';

class Viewuserscontroller extends GetxController {
  UsersData usersData = UsersData(Get.find());

  List<Usersmodel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await usersData.view();
    statusRequest = hundlingdata(response);
    print("------------------------------------$response");

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => Usersmodel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.falier;
      }
    }

    update();
  }

  gotoEditdata(Usersmodel usersmodel) {
    Get.toNamed("/usersedit", arguments: {'usersmodel': usersmodel});
  }


  // Goadddata(Itemsmodel itemsmodel){
  //       Get.toNamed("/itemsadd", arguments: {'itemsmodel': itemsmodel});

  // }

  delete(String id) {
    usersData.delete(id);
    data.removeWhere((element) => element.usersId == id);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
