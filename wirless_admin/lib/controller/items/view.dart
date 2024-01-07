// ignore_for_file: unrelated_type_equality_checks

import 'package:get/get.dart';
import 'package:wirless_delivery/core/class/statusRequest.dart';
import 'package:wirless_delivery/core/function/hundlingdata.dart';
import 'package:wirless_delivery/data/Models/catogris.dart';
import 'package:wirless_delivery/data/Models/items.dart';
import 'package:wirless_delivery/data/datasoures/remout/items/items.dart';

class Viewitemscontroller extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());

  List<Itemsmodel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await itemsData.view();
    statusRequest = hundlingdata(response);
    print("------------------------------------$response");

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => Itemsmodel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.falier;
      }
    }

    update();
  }

  GotoEditdata(Itemsmodel itemsmodel) {
    Get.toNamed("/itemsEdit", arguments: {'itemsmodel': itemsmodel});
  }


  Goadddata(Itemsmodel itemsmodel){
        Get.toNamed("/itemsadd", arguments: {'itemsmodel': itemsmodel});

  }

  delete(String id, String imagename) {
    itemsData.delete({"id": id, "imagename": imagename});
    data.removeWhere((element) => element.itemsId == id);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
